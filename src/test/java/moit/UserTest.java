package moit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID; // ✅ 고유 ID 생성을 위해 추가
import javax.sql.DataSource;

import org.junit.After; // ✅ 테스트 후 정리용
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moit.dao.UserMapper;
import com.moit.dto.AuthUserDto;
import com.moit.dto.UserDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
        "classpath:config/root-context.xml",
        "classpath:config/security-context.xml" 
})
public class UserTest {

    @Autowired UserMapper userMapper;
    @Autowired @Qualifier("passwordEncoder") PasswordEncoder pwencoder;

    private static final String TEST_NICK = "테스트닉네임";
    private static final String TEST_PROFILE = "/uploads/default.png";

    // ✅ 마지막으로 삽입한 ID를 저장해두었다가 @After에서 삭제
    private String lastInsertedId;

    /**
     * 공통 Helper 메소드: 매번 고유 loginId/email/mobile을 생성하여 삽입
     */
    private UserDto createAndInsertTestUser() {
        lastInsertedId = "testuser_" + UUID.randomUUID().toString().substring(0,8);
        String uniqueEmail = "test_" + UUID.randomUUID().toString().substring(0,8) + "@moit.com";
        String uniqueMobile = "010-" + (int)(Math.random()*9000+1000) + "-" + (int)(Math.random()*9000+1000);

        UserDto dto = new UserDto();
        dto.setLoginId(lastInsertedId);
        dto.setNickname(TEST_NICK);
        dto.setMobile(uniqueMobile);
        dto.setEmail(uniqueEmail);
        dto.setPassword(pwencoder.encode("pass1234"));
        dto.setMemberTypeId(1);
        dto.setStatusId(1);
        dto.setProfileUrl(TEST_PROFILE);

        userMapper.insert(dto);
        return dto;
    }

    // ✅ 각 테스트 끝날 때 삽입한 데이터 삭제
    @After
    public void cleanUp() {
        if (lastInsertedId != null) {
            userMapper.deleteMemberPhysical(lastInsertedId);
            lastInsertedId = null;
        }
    }

    @Test
    public void t01_insert_모든속성_정상저장_검증() {
        // ✅ 직접 고유값 생성
        String uniqueId = "testuser_" + UUID.randomUUID().toString().substring(0,8);
        String uniqueEmail = "test_" + UUID.randomUUID().toString().substring(0,8) + "@moit.com";
        String uniqueMobile = "010-" + (int)(Math.random()*9000+1000) + "-" + (int)(Math.random()*9000+1000);
        lastInsertedId = uniqueId;

        UserDto dto = new UserDto();
        dto.setLoginId(uniqueId);
        dto.setNickname(TEST_NICK);
        dto.setMobile(uniqueMobile);
        dto.setEmail(uniqueEmail);
        dto.setPassword(pwencoder.encode("pass1234"));
        dto.setMemberTypeId(1);
        dto.setStatusId(1);
        dto.setProfileUrl(TEST_PROFILE);

        int result = userMapper.insert(dto);

        Assert.assertEquals(1, result);
        Assert.assertTrue(dto.getMemberId() > 0);
    }

    @Test
    public void t02_readAuth_인증속성_조인_검증() {
        UserDto dto = createAndInsertTestUser();

        AuthUserDto auth = userMapper.readAuth(dto.getLoginId());

        Assert.assertNotNull(auth);
        Assert.assertEquals(dto.getLoginId(), auth.getLoginId());
        Assert.assertTrue(pwencoder.matches("pass1234", auth.getPassword()));
        Assert.assertEquals("ROLE_MEMBER", auth.getTypeName());
    }

    @Test
    public void t03_findMember_모든필드_매핑_및_케이스_검증() {
        UserDto dto = createAndInsertTestUser();

        Map<String, Object> paramId = new HashMap<>();
        paramId.put("loginId", dto.getLoginId());
        UserDto member = userMapper.findMember(paramId);

        Assert.assertNotNull(member);
        Assert.assertEquals(dto.getLoginId(), member.getLoginId());
        Assert.assertEquals(TEST_NICK, member.getNickname());
        Assert.assertEquals(dto.getMobile(), member.getMobile());
        Assert.assertEquals(dto.getEmail(), member.getEmail());
        Assert.assertEquals(1, member.getMemberTypeId());
        Assert.assertEquals(1, member.getStatusId());
        Assert.assertEquals(TEST_PROFILE, member.getProfileUrl());
        Assert.assertEquals("N", member.getDeleteYn());
        Assert.assertNotNull(member.getCreatedAt());

        Map<String, Object> paramNick = new HashMap<>();
        paramNick.put("nickname", TEST_NICK);
        UserDto memberByNick = userMapper.findMember(paramNick);
        Assert.assertNotNull(memberByNick);
        Assert.assertEquals(dto.getLoginId(), memberByNick.getLoginId());

        Map<String, Object> paramEmpty = new HashMap<>();
        UserDto memberEmpty = userMapper.findMember(paramEmpty);
        Assert.assertNull(memberEmpty);
    }

    @Test
    public void t04_updateMember_모든변경가능속성_동적검증() {
        UserDto dto = createAndInsertTestUser();

        UserDto updateDto = new UserDto();
        updateDto.setLoginId(dto.getLoginId());
        updateDto.setNickname("새닉네임");

        // ✅ mobile도 Unique 제약조건이 있으므로 매번 다른 값으로 생성
        updateDto.setMobile("010-" + (int)(Math.random()*9000+1000) + "-" + (int)(Math.random()*9000+1000));

        updateDto.setMemberTypeId(2);
        updateDto.setStatusId(3);
        updateDto.setProfileUrl("/uploads/new.png");
        updateDto.setDeleteYn("Y");

        int updateResult = userMapper.updateMember(updateDto);
        Assert.assertEquals(1, updateResult);

        Map<String, Object> param = new HashMap<>();
        param.put("loginId", dto.getLoginId());
        UserDto afterUser = userMapper.findMember(param);

        Assert.assertEquals("새닉네임", afterUser.getNickname());
        Assert.assertEquals(updateDto.getMobile(), afterUser.getMobile());
        Assert.assertEquals(2, afterUser.getMemberTypeId());
        Assert.assertEquals(3, afterUser.getStatusId());
        Assert.assertEquals("/uploads/new.png", afterUser.getProfileUrl());
        Assert.assertEquals("Y", afterUser.getDeleteYn());
        Assert.assertEquals(dto.getEmail(), afterUser.getEmail());
    }

    @Test
    public void t05_select10_and_selectCnt_조건별속성필터링_검증() {
        UserDto dto = createAndInsertTestUser();

        Map<String, Object> param = new HashMap<>();
        param.put("start", 0);
        param.put("end", 10);
        param.put("memberTypeId", 1);
        param.put("statusId", 1);
        param.put("searchKeyword", "testuser");

        List<UserDto> list = userMapper.select10(param);
        int cnt = userMapper.selectCnt(param);

        Assert.assertTrue(cnt >= 1);
        Assert.assertFalse(list.isEmpty());

        UserDto targetedUser = list.get(0);
        Assert.assertTrue(targetedUser.getLoginId().contains("testuser"));
        Assert.assertEquals(1, targetedUser.getMemberTypeId());
        Assert.assertEquals(1, targetedUser.getStatusId());
        Assert.assertEquals("N", targetedUser.getDeleteYn());
    }

    @Test
    public void t06_deleteMemberPhysical_물리삭제완료_검증() {
        UserDto dto = createAndInsertTestUser();

        int result = userMapper.deleteMemberPhysical(dto.getLoginId());
        Assert.assertEquals(1, result);

        Map<String, Object> param = new HashMap<>();
        param.put("loginId", dto.getLoginId());
        Assert.assertNull(userMapper.findMember(param));
    }
}

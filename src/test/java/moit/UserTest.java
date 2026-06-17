package moit;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moit.dao.UserMapper;
import com.moit.dto.AuthDto;
import com.moit.dto.UserDto;
import com.moit.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"classpath:config/root-context.xml"   , 
		"classpath:config/security-context.xml" 
})
public class UserTest {
	@Autowired   ApplicationContext context;
	@Autowired   DataSource  ds;
	@Autowired   SqlSession  sqlSession;
	@Autowired   UserMapper  user;
	@Autowired   UserService service;
	@Autowired @Qualifier("passwordEncoder") PasswordEncoder pwencoder;
	
	@Test
	public void test5() {
		// 권한
		AuthDto adto = new AuthDto();
		adto.setEmail("second@gmail.com");
		System.out.println(user.readAuth("second@gmail.com"));
		
		//회원가입 + (암호화)
//		UserDto dto = new UserDto();
//		dto.setNickname("second"); dto.setLoginId("second02");
//		dto.setMobile("010-1111-1111"); dto.setEmail("second@gmail.com");
//		dto.setPassword(pwencoder.encode("1234"));
//		
//		System.out.println(user.insert(dto)); 
	}
	
	@Ignore @Test
	public void test4() {
		
		// 이메일 중복 검사
		//System.out.println(user.findByEmail("first@gmail.com"));
		
		//로그인
//		UserDto dto = new UserDto();
//		dto.setEmail("first@gmail.com"); dto.setPassword("1234");
//		System.out.println(user.findLogin(dto));
		
		//회원가입
//		UserDto dto = new UserDto();
//		dto.setNickname("first"); dto.setLoginId("first01");
//		dto.setMobile("010-1234-1234"); dto.setEmail("first@gmail.com");
//		dto.setPassword("1234");
//		System.out.println(user.insert(dto));
	}
	
	@Ignore @Test public void test1() { System.out.println(context); }
	@Ignore @Test public void test2() { System.out.println(sqlSession); }
	@Ignore @Test public void test3() { System.out.println(ds); }
}

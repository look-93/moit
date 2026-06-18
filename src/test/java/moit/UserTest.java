package moit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moit.dao.QuestionMapper;
import com.moit.dto.QuestionDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"classpath:config/root-context.xml"   , 
		"classpath:config/security-context.xml" 
})
public class UserTest {
	@Autowired   ApplicationContext context;
	@Autowired   DataSource         ds;
	@Autowired   SqlSession         sqlSession;
	@Autowired   QuestionMapper     question;
	
	
	@Ignore @Test
	public void findBySearchContent() {
	    QuestionDto dto = new QuestionDto();
	    dto.setContent("내용");
	    System.out.println( question.findBySearch(dto) );
	}
	
	@Ignore @Test // 제목으로 검색
	public void findBySearchTitle() {
	    QuestionDto dto = new QuestionDto();
	    dto.setTitle("제목");
	    System.out.println( question.findBySearch(dto) );
	}
	
	@Ignore @Test // 답변 달릴 시 상태 변경
	public void updateStatusAnswered() {
	    question.updateStatusAnswered(11);
	    QuestionDto dto = question.findById(11);
	    System.out.println("상태 : " + dto.getStatus());
	}
	
	@Ignore @Test // 문의 삭제 (논리 삭제)
	public void deleteQuestion() {
	    question.deleteQuestion(12);
	    System.out.println("삭제 완료");
	}
	
	@Ignore @Test // 문의 수정
	public void updateQuestion() {

	    QuestionDto dto = new QuestionDto();

	    dto.setQuestionId(1);
	    dto.setTitle("수정된 제목");
	    dto.setContent("수정된 내용");
	    dto.setIsPublic("N");

	    question.updateQuestion(dto);

	    System.out.println("수정 완료");
	}
	
	@Ignore @Test // 문의 등록
	public void insertQuestion() {

	    QuestionDto dto = new QuestionDto();

	    dto.setParentId(1);
	    dto.setMemberId(1);
	    dto.setCategory("ADMIN");
	    dto.setTitle("JUnit 등록 테스트");
	    dto.setContent("문의 등록 테스트입니다.");
	    dto.setIsPublic("Y");
	    dto.setDeleteYn("N");

	    question.insertQuestion(dto);

	    System.out.println("등록 완료");
	}
	
	@Ignore @Test // 페이징
	public void findAll() {

	    Map<String, Integer> map = new HashMap<>();
	    map.put("start", 0);
	    map.put("end", 10);

	    List<QuestionDto> list = question.findAll(map);

	    for(QuestionDto q : list) {
	        System.out.println(q);
	    }
	}
	
	@Ignore @Test // 상세보기
	public void test1() {
		System.out.println(question.findById(1));
	}
}

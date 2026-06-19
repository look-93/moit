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

import com.moit.dao.AnswerMapper;
import com.moit.dao.QuestionMapper;
import com.moit.dto.AnswerDto;
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
	@Autowired   AnswerMapper		answer;
	
	
	@Ignore @Test // 질문별 답변 조회
	public void findByQuestionId() {
	    AnswerDto dto = answer.findByQuestionId(11);
	    System.out.println(dto);
	}
	
	@Ignore @Test // 답변 삭제 (논리 삭제)
	public void deleteAnswer() {
	    answer.deleteAnswer(12);
	    System.out.println("답변 삭제 완료");
	}
	
	@Ignore @Test // 답변 수정
	 public void updateAnswer() {
	     AnswerDto dto = new AnswerDto();

	     dto.setAnswerId(11);
	     dto.setContent("수정된 답변 내용");
	     dto.setIsPublic("N");

	     answer.updateAnswer(dto);

	     System.out.println("답변 수정 완료");
	 }
	
	@Ignore @Test // 답변 등록
	public void insertAnswer() {
	    AnswerDto dto = new AnswerDto();
	    
	    dto.setQuestionId(12);
	    dto.setMemberId(2);
	    dto.setContent("JUnit 답변 등록 테스트");
	    dto.setIsPublic("Y");
	    
	    answer.insertAnswer(dto);
	    
	    System.out.println("답변 등록 완료");
	}
	
	/////////////////////////////////////////////////////////////////
	
	@Ignore @Test  // 오늘 등록 문의 수
	public void findTodayCnt() {
	    int count = question.findTodayCnt();
	    System.out.println( "오늘 등록 문의 수 : " + count );
	}
	
	@Ignore @Test  // 답변 완료 수
	public void findAnsweredCnt() {
	    int count = question.findAnsweredCnt();
	    System.out.println( "답변 완료 수 : " + count );
	}
	
	@Ignore @Test  // 답변 대기 수
	public void findPendingCnt() {
	    int count = question.findPendingCnt();
	    System.out.println( "답변 대기 수 : " + count );
	}
	
	@Ignore @Test  // 전체 문의 수
	public void findAllCnt() {
	    int count = question.findAllCnt();
	    System.out.println( "전체 문의 수 : " + count );
	}
	
	@Ignore @Test // 등록일 검색
	public void findBySearchDate() {
	    QuestionDto dto = new QuestionDto();
	    dto.setCreatedAt( java.sql.Timestamp.valueOf( "2026-06-18 00:00:00") );
	    System.out.println( question.findBySearch(dto) );
	}
	
	@Ignore @Test // 내용 검색
	public void findBySearchContent() {
	    QuestionDto dto = new QuestionDto();
	    dto.setContent("내용");
	    System.out.println( question.findBySearch(dto) );
	}
	
	@Ignore @Test // 제목 검색
	public void findBySearchTitle() {
	    QuestionDto dto = new QuestionDto();
	    dto.setTitle("제목");
	    System.out.println( question.findBySearch(dto) );
	}
	
	@Ignore @Test // 답변 상태 변경
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
        dto.setTitle("JUnit 문의 등록");
        dto.setContent("문의 등록 테스트입니다.");
        dto.setIsPublic("Y");
        dto.setDeleteYn("N");

	    question.insertQuestion(dto);

	    System.out.println("��� �Ϸ�");
	}
	
	@Ignore @Test // 사용자측 문의 목록 페이징
	public void findMyQuestions() {
	    Map<String, Object> map = new HashMap<>();

	    map.put("memberId", 1); // 로그인 사용자
	    map.put("start", 0);    // 시작 위치
	    map.put("end", 10);     // 페이지당 10개

	    List<QuestionDto> list = question.findMyQuestions(map);

	    System.out.println("===== 내 문의 목록 =====");

	    for (QuestionDto dto : list) {
	        System.out.println(
	            dto.getQuestionId() + " / "
	            + dto.getTitle() + " / "
	            + dto.getStatus());}
	}
	
	@Test // 관리자측 문의 목록 페이징
	public void findAll() {
	    Map<String, Integer> map = new HashMap<>();

	    map.put("start", 0);   // 1페이지
	    map.put("end", 10);

	    List<QuestionDto> list = question.findAll(map);

	    for(QuestionDto q : list) {
	        System.out.println(q.getQuestionId()+ " / "+ q.getTitle()+ " / "+ q.getStatus()
	        );
	    }
	}
	
	@Ignore @Test // 상세보기
	public void test1() {
		System.out.println(question.findById(1));
	}
}

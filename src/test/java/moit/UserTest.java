package moit;

import java.util.List;

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

	@Test
	public void 전체질문조회() {

	    List<QuestionDto> list = question.findAll();

	    for (QuestionDto q : list) {
	        System.out.println(q);
	    }
	}
	
	@Ignore @Test public void test1() {
		System.out.println(question.findById(1));
	}
}

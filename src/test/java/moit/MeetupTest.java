package moit;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moit.dao.MeetupMapper;
import com.moit.service.AdminMeetupService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"classpath:config/root-context.xml"   , 
		"classpath:config/security-context.xml" 
})
public class MeetupTest {
	@Autowired   ApplicationContext context;
	@Autowired   DataSource         ds;
	@Autowired   SqlSession         sqlSession;
	@Autowired   AdminMeetupService adminMeetupService;
	
	
	@Ignore//@Test
	public void test1() {
		System.out.println(adminMeetupService.deleteByMeetup(1));
	}
	
}

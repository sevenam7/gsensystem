package test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lm.po.Gradetable;
import com.lm.service.IUsertableService;
/**
 * 
 *单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:spring-mybatis.xml"})	
public class test {
    @Autowired
    private IUsertableService iUsertableService;
	@Test
	public void Test(){
		List<Gradetable> gList= iUsertableService.selectGrade();
		for (Gradetable g : gList) {
			System.out.println("ID:"+g.getGradeId());
			System.out.println("name:"+g.getGradename());
		}
		
	}
	@Before
	public void Before(){
		System.out.println("测试前");
		
	}
	@After
	public void After(){
		System.out.println("测试后");
	}
}

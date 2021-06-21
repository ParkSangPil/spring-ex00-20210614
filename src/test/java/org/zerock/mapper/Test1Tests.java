package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Test1VO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test1Tests {

	@Setter(onMethod_ = @Autowired)
	private Test1Mapper mapper;
	
	@Test
	public void testGetList() {
		assertNotNull(mapper);
		
		List<Test1VO> list = mapper.getList();
		
//		assertEquals(5, list.size());
		assertTrue(list.size() > 0);
		
	}
	
	@Test
	public void testInsert() {
		Test1VO test1 = new Test1VO();
		test1.setName("새로운 이름");
		test1.setAge(11);
		
		int cnt = mapper.insert(test1);
		
		assertEquals(1, cnt);
	}
	
	@Test
	public void testInsertSelectKey() {
		Test1VO test1 = new Test1VO();
		test1.setName("새로운 이름");
		test1.setAge(11);
		
		assertEquals(0, test1.getId());
		
		int cnt = mapper.insertSelectKey(test1);
		
		assertEquals(1, cnt);
		assertNotEquals(0, test1.getId());
	}

	@Test
	public void testRead() {
		
		Test1VO vo = mapper.read(1);
		assertNotNull(vo);
		assertEquals(1, vo.getId());
		
		Test1VO test1 = new Test1VO();
		test1.setName("새로운 이름");
		test1.setAge(11);

		int cnt = mapper.insertSelectKey(test1);
		
		long key = test1.getId();
		
		Test1VO newtest1 = mapper.read(key);
		 
		assertNotNull(newtest1);
		assertEquals(key, newtest1.getId());
	}
	@Test
	public void testDelete() {
		int cnt = mapper.delete(0);
		
		assertEquals(0, cnt);
		
		Test1VO test1 = new Test1VO();
		test1.setName("새로운 이름");
		test1.setAge(11);
		
		mapper.insertSelectKey(test1);
		
		cnt = mapper.delete(test1.getId());
		assertEquals(1, cnt);
	}
	
	@Test
	public void testUpdate() {
		long id = 3;
		
		Test1VO test1 = new Test1VO();
		test1.setId(id);
		test1.setName("new 이름");
		test1.setAge(11);
		
		int cnt = mapper.update(test1);
		
		assertEquals(1, cnt);
		
		Test1VO test15 = mapper.read(id);
		assertEquals(test1.getName(), test15.getName());
		assertEquals(test1.getAge(), test15.getAge());
	}

}

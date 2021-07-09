package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Test
	public void test() {
		assertNotNull(mapper);
		
		assertNotNull(encoder);
	}
	
	@Test(expected = Exception.class)
	public void testInsert1() {
		MemberVO vo1 = new MemberVO();
		vo1.setUserid("member");
		vo1.setUserpw(encoder.encode("member")); // 평문으로 안넣기로 함 그래서 encode 함
		vo1.setUserName("멤버");
		
		mapper.insert(vo1);
	}
	
	@Test(expected = Exception.class)
	public void testInsert2() {
		MemberVO vo1 = new MemberVO();
		vo1.setUserid("admin");
		vo1.setUserpw(encoder.encode("admin")); // 평문으로 안넣기로 함 그래서 encode 함
		vo1.setUserName("운영자");
		
		mapper.insert(vo1);
	}
	
//	@Test                      한번만 넣어주는 거기 때문에!
//	public void testInsertAuth() {
//		AuthVO vo1 = new AuthVO();
//		vo1.setAuth("ROLE_MEMBER");
//		vo1.setUserid("member");
//		mapper.insertAuth(vo1);
//		
//		vo1.setAuth("ROLE_MEMBER");
//		vo1.setUserid("admin");
//		mapper.insertAuth(vo1);
//
//		vo1.setAuth("ROLE_ADMIN");
//		vo1.setUserid("admin");
//		mapper.insertAuth(vo1);
//	}
	
	@Test
	public void testRead() {
		MemberVO vo = mapper.read("admin");
		
		assertEquals(2, vo.getAuthList().size());
		assertEquals("admin", vo.getUserid());
		assertEquals("운영자", vo.getUserName());
		assertTrue(encoder.matches("admin", vo.getUserpw()));
	}
	
	@Test
	public void textUpdate() {
		MemberVO vo = mapper.read("");
		
		String newpw = "111";
		vo.setUserpw(encoder.encode(newpw));
		
		assertEquals(1, mapper.update(vo));
	}
	
	

}







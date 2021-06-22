package org.zerock.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글입니당.");
		board.setContent("새로 작성하는 내용입니당.");
		board.setWriter("새로운 작가입니당.");
		
		service.register(board);
		
		assertNotEquals(0, board.getBno());
		
	}
	
	@Test
	public void testGetList() {
		List<BoardVO> list = service.getList();
		
		assertNotNull(list);
		assertTrue(list.size() > 0);
	}
	
	@Test
	public void testGet() {
		BoardVO vo = service.get(1L);
		
		assertNotNull(vo);
		assertEquals(1L, vo.getBno());
	}
	
	@Test
	public void testModify() {
		BoardVO vo = service.get(1L);
		vo.setTitle("수정된 제목입니다");
		vo.setContent("수정된 본문 입니다.");
		
		service.modify(vo);
		
		vo = service.get(1L);
		
		assertEquals("수정된 제목입니다", vo.getTitle());
		assertEquals("수정된 본문 입니다.", vo.getContent());
	}
	
	@Test
	public void testRemove() {
		Long key1 = 13L;
//		Long key2 = 14L; 계속 지워주면 오류가 나니까!
		
		
		assertFalse(service.remove(key1));
//		assertTrue(service.remove(key2));
		
		/* key2 실험 하고 싶으면 */
		BoardVO vo = new BoardVO();
		vo.setTitle("title");
		vo.setContent("content");
		vo.setWriter("writer");
		
		service.register(vo);
		
		assertTrue(service.remove(vo.getBno()));
		
	}
	
}













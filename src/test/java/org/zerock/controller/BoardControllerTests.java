package org.zerock.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		{
			"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
		})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		ModelAndView mav = mockMvc.perform(/*MockMvcRequestBuilders.*/
				get("/board/list")
				.param("pageNum", "2")
				.param("amount", "7"))
			.andReturn()// 요청을 받아서
			.getModelAndView();// View에 전달되는게 어떤건지
		
		assertEquals("board/list", mav.getViewName());
		
		Map<String, Object> map = mav.getModel();
		
		Object o = map.get("list");
		assertNotNull(o);
		assertTrue(o instanceof List<?>);
		
		List<BoardVO> list = (List<BoardVO>) o;
		assertEquals(7, list.size());
		
//		fail("fail");
	}
	
	@Test
	public void testRegister() throws Exception{
		FlashMap fm = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 새글 제목")
				.param("content", "테스트 새글 내용")
				.param("writer", "user00"))
		.andReturn().getFlashMap();
		
		assertNotNull(fm.get("result"));
	}
	
	@Test
	public void testGet() throws Exception{
		
		ModelAndView mv = mockMvc.perform(get("/board/get").param("bno", "1"))
			.andReturn()
			.getModelAndView();
		
		Map<String, Object> model = mv.getModel();
		
		BoardVO vo = (BoardVO) model.get("board");
		assertNotNull(vo);
		assertEquals(1, vo.getBno());
		
	}
	
	@Test
	public void testGet2() throws Exception{
		
		mockMvc.perform(get("/board/get").param("bno", "1"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("board"));
	}
	
	@Test
	public void testModify() throws Exception{
		mockMvc.perform(post("/board/modify")
				.param("bno", "1")
				.param("title", "이게 수정된 제목이다!")
				.param("content", "이게 수정된 내용이다!")
				.param("writer", "응애 나 애기 작가"))
		.andExpect(status().is3xxRedirection())
		.andExpect(flash().attribute("result", "success"));
	}
	
	@Test
	public void testRemove() throws Exception{
		FlashMap fm = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 새글 제목")
				.param("content", "테스트 새글 내용")
				.param("writer", "user00"))
		.andReturn().getFlashMap();
		
		
		
		mockMvc.perform(post("/board/remove")
				.param("bno", fm.get("result").toString()))
		.andExpect(status().is3xxRedirection())
		.andExpect(flash().attribute("result", "success"));
	}

}






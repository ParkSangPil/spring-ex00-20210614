package org.zerock.domain;

import static org.junit.Assert.*;

import org.junit.Test;

public class PageDTOTests {

	@Test
	public void test() {
		Criteria cri = new Criteria(1, 10);
		
		PageDTO p1 = new PageDTO(cri);
		
		assertEquals(10, p1.getEndPage());
		
		assertEquals(10,  new PageDTO(new Criteria(5,10)).getEndPage());
		assertEquals(10,  new PageDTO(new Criteria(10,10)).getEndPage());
		
		assertEquals(20,  new PageDTO(new Criteria(11,10)).getEndPage());
	}

}

package org.zerock.sample;

import static org.junit.Assert.*;

import org.junit.Test;

public class StringSplitTest {

	@Test
	public void test() {
		
		String str1 ="java,spring,css";
		
		String[] arr1 = str1.split(",");
		
		assertEquals("java", arr1[0]);
		assertEquals("spring", arr1[1]);
		assertEquals("css", arr1[2]);
	}
	
	@Test
	public void test2() {
		
		String str1 = "TWC";
		String[] arr1 = str1.split(""); // 하나씩 끊어지니까 T W C로 3개로 나눠짐
		
		assertEquals(3, arr1.length);
		assertEquals("T", arr1[0]);
	}

}

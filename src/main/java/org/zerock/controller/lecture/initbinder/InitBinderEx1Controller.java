package org.zerock.controller.lecture.initbinder;

import java.beans.PropertyEditorSupport;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/init1")
@Log4j
public class InitBinderEx1Controller {
	
	@Data
	public static class MyData {
		private String name;
		private int age;
	}
	
	public static class MyDataEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String text) throws IllegalArgumentException {
			// text ==>  name-age
			String[] data = text.split("-");
			String name = data[0];
			int age = Integer.valueOf(data[1]);
			
			MyData d = new MyData();
			d.setName(name);
			d.setAge(age);
			
			setValue(d);
		}
	}

	// http://localhost:8080/controller/init1/ex1?name=seoul
	@RequestMapping("/ex1")
	public void method1(String name) {
		log.info("method1");
		log.info(name);
	}
	
	// http://localhost:8080/controller/init1/ex2?data=donald-99
	@RequestMapping("/ex2")
	public void method2(@RequestParam MyData data) {
		log.info("method2");
		log.info(data);
	}
	
	// http://localhost:8080/controller/init1/ex3?birth=2020-07-07
	@RequestMapping("/ex3")
	public void method3(@RequestParam Date birth) {
		log.info("method3");
		log.info(birth);
	}
	
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		log.info("init binder");
//		
//		binder.registerCustomEditor(MyData.class, new MyDataEditor());
//		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//	}
}















package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ex03/*")
@Log4j
public class Ex03Controller {

	
	@RequestMapping("/sub01")
	public void method01(User user) {// 여기에 작성하는걸로 아래 코드를 대신할 수 있다.
		
//		String id = request.getParameter("id");
//		String ageStr = request.getParameter("age");
//		int age = Integer.parseInt(ageStr);
//		
//		User user = new User();
//		user.setId(id);
//		user.setAge(age);
		
		
		
		log.info("ex03, sub01 method");
		log.info(user);
		
	}
	
	
}

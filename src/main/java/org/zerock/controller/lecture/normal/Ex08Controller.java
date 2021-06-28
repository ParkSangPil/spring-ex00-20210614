package org.zerock.controller.lecture.normal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ex08/*")
@Log4j
public class Ex08Controller {

	@RequestMapping("/sub01")
	public void method01(Model model) {
		log.info("ex08, sub01 method");
		
		model.addAttribute("name", "donald");
		model.addAttribute("age", 22);
	}
	
	@RequestMapping("/sub02")
	public void method02(Model model) {
		log.info("ex08, sub02 method");
		
		User user = new User();
		user.setId("bts");
		user.setAge(22);
				
		model.addAttribute("user", user);
	}
	
	@RequestMapping("/sub03")
	public String method03(Model model) {
		log.info("ex08, sub03 method");
		
		User user = new User();
		user.setId("korea");
		user.setAge(5000);
		
//		model.addAttribute("user", user);
		model.addAttribute(user); // 이건 변수명이 아니라 class명이다
		
		return "ex08/sub02";
	}
	
	@RequestMapping("/sub04")
	public String method04(User user, Model model) {
		
		log.info("ex08, sub04 method");
		
		model.addAttribute("user", user);
		
		
		
		
		return "ex08/sub02";
	}
	
	// sub04 와 sub05 가 하는 일은 거의 같다.
	
	@RequestMapping("/sub05")
	public String method05(@ModelAttribute("user") User user, Model model) {
		log.info("ex08, sub05 method");
		
		
		
		return "ex08/sub02";
	}
	
	@RequestMapping("/sub06")
	public String method06(@ModelAttribute User user, Model model) {
		log.info("ex08, sub06 method"); //("user") 을 생략하면 class명인 user로 자동으로 들어간다 
		
		
		
		return "ex08/sub02";
	}
	
	// 심지어 @ModelAttribute 를 생략해도 작동한다
	@RequestMapping("/sub07")
	public String method07(User user, Model model) {
		log.info("ex08, sub07 method");
		
		model.addAttribute("hello world"); //이름을 안정해주면 string으로 들어간다.
		
		
		return "ex08/sub02";
	}
	
	@RequestMapping("/sub08")
	public String method08(User user) {
		
		log.info("ex08, sub08 method");
		
		return "ex08/sub02";
		
	}
	
	@RequestMapping("/sub09")
	public void method09(@ModelAttribute("age") int age,@ModelAttribute("name") String name) {// 이름을 생략하면 타입이 이름이 되어버린다.
		log.info("ex08, sub09 method");
		
		log.info(age);
		log.info(name);
		
	}
	
	
}
















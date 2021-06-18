package org.zerock.controller.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ex06/*")
public class Ex06Controller {
	
	@RequestMapping("/sub01")
	public String method01() {
		
		log.info("ex06, sub01 method");
		return "ex06/sub01"; // return값이 String 인 경우에 servlet-context.xml에서
		                     // 18~22 줄에서 WEB-INF/views/(여기에 String값).jsp 으로 view가 결정된다.
		
	}
	
	@RequestMapping("/sub02")
	public void method02() {
		
		log.info("ex06, sub02 method2");
	}
	
	@RequestMapping("/sub03")
	public String method03() {
		log.info("ex06, sub03 method");
		
		return "forward:/ex06/sub02"; // 주소창의 주소가 안바뀜!
	}
	
	@RequestMapping("/sub04")
	public String method04() {
		log.info("ex06, sub04 method");
		
		return "redirect:/ex06/sub02"; // 주소창의 주소가 바뀜!
	}
	
	
	
	
	
	
	
	
}

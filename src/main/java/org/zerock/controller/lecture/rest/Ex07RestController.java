package org.zerock.controller.lecture.rest;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest07")
@Log4j
public class Ex07RestController {

	@RequestMapping("/sub01")
	public String method01(String name, int age) {
		log.info("rest07 sub01 method...");
		
		
		return "method1 "+ name + ", " + age;
	}
	
	@RequestMapping("/sub02")
	public String method02(String id, int age, HttpServletRequest req) throws Exception {
		log.info("rest07 sub02 method...");
		
		// request body 
		log.info
		(req.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
		
		return "method2 : " + id + ", " + age;
	}
	
	@RequestMapping("/sub03")
	private String method03(@RequestBody User user) {
		
		log.info(user);
		
		return "rest07 sub03";
	}
	
	@RequestMapping("/sub04")
	public User method04() {
		User user = new User();
		user.setId("서울");
		user.setAge(88);
		
		return user;
	}
	
	@RequestMapping("/Sang")
	public static String getIp(){ 
		String result = null; try { 
			result = InetAddress.getLocalHost().getHostAddress(); 
			} catch (UnknownHostException e) {
				result = ""; 
				}
	System.out.println(result); 
	return result;
	}
	
}

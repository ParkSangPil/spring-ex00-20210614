package org.zerock.controller.lecture.rest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.controller.lecture.domain.User;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest09")
@Log4j
public class Ex09RestController {

	@PostMapping("/sub01")
	public User method01(String id, int age) { //method01( 이 안에 바로 User를 넣어도 된다 )
		
		User user = new User();
		user.setId(id);
		user.setAge(age);
		
		return user;
	}
}

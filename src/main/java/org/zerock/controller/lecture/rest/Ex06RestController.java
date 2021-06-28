package org.zerock.controller.lecture.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;import org.springframework.web.client.HttpServerErrorException;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest06")
@Log4j
public class Ex06RestController {

	
	@RequestMapping("/sub01")
	public String method01() {
		log.info("rest06 sub01 method...");
		return "hello";
	}
	
	@RequestMapping("/sub02")
	public String method02() {
		return "method02 response";
	}
	
	@RequestMapping("/sub04")
	public ResponseEntity<String> method04(){
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping("/sub05")
//	@GetMapping
//	@PostMapping
//	@DeleteMapping
//	@PutMapping
	public String method05(HttpServletRequest request) {
		log.info(request.getMethod());
		
		
		return "hello";
	}
}

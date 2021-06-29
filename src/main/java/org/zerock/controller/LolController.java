package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Criteria;
import org.zerock.domain.LolVO;
import org.zerock.service.LolService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@AllArgsConstructor
@Log4j
public class LolController {
	
	private LolService service;

	@RequestMapping("/lol")
	public void list() { 
		log.info("sample/lol method.......");
		
	}
	
	@PostMapping("/register")
	public String register(LolVO lol) {
		service.register(lol);
		
		return "${appRoot}/sample/lol";
		
	}
	
}

package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@AllArgsConstructor
@Log4j
public class docController {
	
	@GetMapping("/docplanet")
	public void list(Model model) {

		log.info("서버");
	}

}

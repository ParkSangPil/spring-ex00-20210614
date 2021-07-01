package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
/*
	@RequestMapping("/register")
	public String register(@RequestParam Map<String, LolVO> map, HttpServletRequest request) {
		log.info(map);

		Map<String, LolVO> map = new HashMap<String, LolVO>();
		// 이걸 10번????
		map.put("1", request.getParameter("LolVO"));

//		service.register(list);

		return "redirect:/sample/lol";

	}

	
	@PostMapping("/register") 
	public String register(LolVO lol, Map<Integer, LolVO> map) { 
	
		Map<String, LolVO> list = new HashMap<String, LolVO>();
		for(int i = 0 ; i < 10 ; i++){
		
		list.put("teamn", lol.getTeamn());
		list.put("teamk", lol.getTeamk());
		list.put("teamd", lol.getTeamd());
		
		}
		service.register(lol);
	
		return "redirect:/sample/lol"; 
	}
*/
	@PostMapping("/register2")
	public String register(@RequestBody ArrayList<LolVO> list) {
		
		log.info(list);
			
		service.register(list);

		return "redirect:/sample/lol";
	}

}

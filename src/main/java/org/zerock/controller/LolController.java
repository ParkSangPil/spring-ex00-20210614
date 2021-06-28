package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@AllArgsConstructor
@Log4j
public class LolController {
	
	private BoardService service;
	
	/* @AllArgsConstructor 이 대신해준다
	 * public BoardController(BoardService service) { this.service = service; }
	 */

	@GetMapping("/lol")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) { // criteria cri가 model로 들어가서 전해지는것
		log.info("sample/lol method.......");
		
	}
}

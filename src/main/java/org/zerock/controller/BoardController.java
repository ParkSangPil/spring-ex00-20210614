package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService service;
	
	/* @AllArgsConstructor 이 대신해준다
	 * public BoardController(BoardService service) { this.service = service; }
	 */

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) { // criteria cri가 model로 들어가서 전해지는것
		log.info("board/list method.......");
		int total = service.getTotal(cri);  //  TODO: 일단 넣어둔거임 변경해야함
		
		// service getList() 실행 결과를
		List<BoardVO> list = service.getList(cri);
		
//		System.out.println(list.size()+"ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ");
		
		// model에 attribute로 넣고
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		// view로 포워드 하는게 목표
		
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) { // 아래 주석이 컬럼들을 자동으로 넣어줌
		
		// service에게 등록업무 시키고
		service.register(board); // board는 title,content,writer 을 가지고 있지
		
		// redirect목적지로 정보 전달
//		rttr.addFlashAttribute("result", board.getBno()); 강사님은 또 다르게 만들었다 참고 ㄱㄱ
		rttr.addFlashAttribute("result", "작성");
		
		// /board/list 로 redirect 시켜야함
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"}) // 요청 경로에 따라서 jsp가 결정된다
	public void get(Model model,
			@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") Criteria cri) { // requesparam 없어도 되는거 알지?
		
		log.info("board/get method");
		
		// service 에게 일 시킴
		BoardVO vo = service.get(bno);
		
		// 결과를 모델에 넣음
		model.addAttribute("board", vo);
		
		// forward
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, Criteria cri) {
		// request parameter 수집
		
		
		// service 일 시킴
		boolean success = service.modify(board);
		
		// 결과를 model 또는 FlashMap에 넣고
		rttr.addFlashAttribute("result", "수정");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		// forward or redirect
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, 
						 RedirectAttributes rttr,
						 Criteria cri) {
		// parameter 수집
		
		// service 시키고
		boolean success = service.remove(bno);
		
		// 결과를 담고
		if(success) {
			rttr.addFlashAttribute("result", "삭제");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		// forward or redirect
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri) {
		
	}
	
	
	
	
}



















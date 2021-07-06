package org.zerock.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;
import org.zerock.service.LolService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@AllArgsConstructor
@Log4j
public class LolController {

	private LolService service;

	/*
	 @RequestMapping("/lol") public void list() {
	 log.info("sample/lol method.......");
	 
	 }
	 */
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
		
//		String ipv4 = null; 
//		try { 
//			ipv4 = InetAddress.getLocalHost().getHostAddress(); 
//		} catch (UnknownHostException e) {
//			ipv4 = ""; 
//		}
	
		String ipv6 = "";
	    HttpServletRequest request = 
	    ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

	    ipv6 = request.getHeader("X-Forwarded-For");
	    
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("Proxy-Client-IP"); 
	    } 
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("WL-Proxy-Client-IP"); 
	    } 
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("HTTP_CLIENT_IP"); 
	    } 
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("HTTP_X_FORWARDED_FOR"); 
	    }
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("X-Real-IP"); 
	    }
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("X-RealIP"); 
	    }
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getHeader("REMOTE_ADDR");
	    }
	    if (ipv6 == null || ipv6.length() == 0 || "unknown".equalsIgnoreCase(ipv6)) { 
	        ipv6 = request.getRemoteAddr(); 
	    }
//	    log.info(ipv4);
		log.info(ipv6);
		service.registerOTP(ipv6);
		
		log.info(list);
		service.register(list);

		return "redirect:/sample/lol";
	}
	
	@GetMapping("/lol")
	public void list(Model model) {

		
//		이건 list로 전부 불러오는 코드임!!!
		
//		log.info("lol/list method.......");
//		
//		// service getList() 실행 결과를
//		List<LolVO> list55 = service.getList();
//				
//		// model에 attribute로 넣고
//		model.addAttribute("list55", list55);
		
		List<LolVO2> list55 = service.getList();
		model.addAttribute("list55", list55);
		
		List<LolVO2> list66 = service.getChamp();
		model.addAttribute("list66", list66);
		
	}

}

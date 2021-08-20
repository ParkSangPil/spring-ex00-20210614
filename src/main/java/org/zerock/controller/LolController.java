package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zerock.domain.DuoVO;
import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;
import org.zerock.domain.LolVO3;
import org.zerock.domain.SadariVO;
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
	
	@GetMapping("/sadari")
	public void sadari(SadariVO vo) {
		
	}
	
	@PostMapping(value = "/getBestPlayer", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getBestPlayer(String champ) {

		return service.getbestplayer(champ);

	}
	
	@PostMapping("/duo")
	@ResponseBody
	public HashMap<String, Integer> duo(DuoVO vo) {
		
//		int q = 1;
//		int w = 1;
//		if((q == 1) && (w == 1)) {
//			log.info("이거 작성 되냐?");
//		}
		
		String Aplayer = vo.getAplayer();
		String Bplayer = vo.getBplayer();
		
		log.info(Aplayer);
		log.info(Bplayer);
		
		double countl = 0;
		double countw = 0;
		double winrate = 0;
		
		List<LolVO3> duorate = service.cal(vo);
		
		ArrayList<LolVO3> part1 = new ArrayList<LolVO3>();
		for(int a = 0 ; a < duorate.size() ; a++) { //이것도 향상된거에서 바꿈 for(LolVO3 onegame : duorate) { 원랜 이거였음
			
			// 여기서 부터 데이터가 안좋아서 억지로 넣은것 마음에 안듦 ㅠㅜ 
			LolVO3 onegame = duorate.get(a);
			if(a == duorate.size()-1) {
				log.info("-----------------------------------");
				System.out.println(part1);
				for(int i = 0 ; i < part1.size() ; i++) {
					if(Aplayer.equals(part1.get(i).getName())) {
						log.info("작동 합니다.");
						for(int j = 0 ; j < part1.size() ; j++) {
							if(Bplayer.equals(part1.get(j).getName())) {
								if((part1.get(i).getVictory().equals("승")) && (part1.get(j).getVictory().equals("승"))) {
									countw++;
									log.info("듀오 승리!");
								}else if((part1.get(i).getVictory().equals("패")) && (part1.get(j).getVictory().equals("패"))) {
									countl++;
									log.info("듀오 패배!");
								}
							}
						}
					}else {
						log.info("작동 안합니다 ㅠ.");
					}
				}
				log.info("-----------------------------------");
				part1.clear();
			}
			// 여기까지
			
			int b = onegame.getBno();
			if(((b%10) == 1)) { // ㅅㅂ ㅋㅋㅋㅋㅋㅋㅋㅋ 여기 이상해염
				log.info("-----------------------------------");
				System.out.println(part1);
				for(int i = 0 ; i < part1.size() ; i++) {
					if(Aplayer.equals(part1.get(i).getName())) {
						log.info("작동 합니다.");
						for(int j = 0 ; j < part1.size() ; j++) {
							if(Bplayer.equals(part1.get(j).getName())) {
								if((part1.get(i).getVictory().equals("승")) && (part1.get(j).getVictory().equals("승"))) {
									countw++;
									log.info("듀오 승리!");
								}else if((part1.get(i).getVictory().equals("패")) && (part1.get(j).getVictory().equals("패"))) {
									countl++;
									log.info("듀오 패배!");
								}
							}
						}
					}else {
						log.info("작동 안합니다 ㅠ.");
					}
				}
				log.info("-----------------------------------");
				part1.clear();
			}
			log.info(onegame);
			part1.add(onegame);
		}
		log.info(countw);
		log.info(countl);
		
		winrate = ((countw / (countw + countl)) * 100);
		double result = Math.round(winrate);
		log.info(result);
		
		Map<String, Integer> resultfin = new HashMap<>();
		int countw2 = (int) countw;
		int countl2 = (int) countl;
		int result2 = (int) result;
		
		resultfin.put("승리카운트", countw2);
		resultfin.put("패배카운트", countl2);
		resultfin.put("승률", result2);
		
		return (HashMap<String, Integer>) resultfin;
	}

}

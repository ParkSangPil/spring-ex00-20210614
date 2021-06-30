package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.LolVO;
import org.zerock.mapper.LolMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LolServiceImpl implements LolService{

	@Setter(onMethod_ = @Autowired)
	private LolMapper mapper;
	
	@Override
	public int register(LolVO lol) { // 리스트를 받아서 매퍼를 포문으로 여러번 실행...
		
		
		for(int i = 0 ; i < 10 ; i++) {
			
			return mapper.insert("insertList", map);
			
		}
	}
}

package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.LolVO;
import org.zerock.mapper.LolMapper;

import lombok.Setter;

@Service
public class LolServiceImpl implements LolService{

	private LolMapper mapper;
	
	@Override
	public void register(LolVO lol) {
		mapper.insert(lol);
	}

}

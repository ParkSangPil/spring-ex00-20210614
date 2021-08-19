package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.DuoVO;
import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;
import org.zerock.domain.LolVO3;
import org.zerock.mapper.LolMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LolServiceImpl implements LolService{

	@Setter(onMethod_ = @Autowired)
	private LolMapper mapper;

	@Override
	public int register(ArrayList<LolVO> list) {
			return mapper.insertList(list);
	}

	@Override
	public List<LolVO2> getList() {
		return mapper.getList();
	}

	@Override
	public List<LolVO2> getChamp() {
		return mapper.getChamp();
	}
	
	@Override
	public void registerOTP(String ipv6) {
		mapper.registerOTP(ipv6);
	}
	
	@Override
	public String getbestplayer(String champ) {
		return mapper.getbestplayer(champ);
	}
	
	@Override
	public List<LolVO3> cal(DuoVO vo) {
		return mapper.duo(vo);
	}
}

package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.LolVO;

public interface LolMapper {

	public List<LolVO> insertList();
	
	public int insert(LolVO lol);
}

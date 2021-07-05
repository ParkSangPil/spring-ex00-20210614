package org.zerock.mapper;

import java.util.ArrayList;
import java.util.List;

import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;

public interface LolMapper {

	public int insertList(ArrayList<LolVO> list);

	public List<LolVO2> getList();

	public List<LolVO2> getChamp();

	public String registerOTP(String result);
	
//	public int insert(LolVO lol);
}

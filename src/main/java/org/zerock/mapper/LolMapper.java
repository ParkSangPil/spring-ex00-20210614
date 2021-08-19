package org.zerock.mapper;

import java.util.ArrayList;
import java.util.List;

import org.zerock.domain.DuoVO;
import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;
import org.zerock.domain.LolVO3;

public interface LolMapper {

	public int insertList(ArrayList<LolVO> list);

	public List<LolVO2> getList();

	public List<LolVO2> getChamp();

	public void registerOTP(String ipv6);

	public String getbestplayer(String champ);

	public List<LolVO3> duo(DuoVO vo);

//	public int insert(LolVO lol);
}

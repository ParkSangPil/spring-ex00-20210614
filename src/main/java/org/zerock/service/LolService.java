package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.zerock.domain.DuoVO;
import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;
import org.zerock.domain.LolVO3;

public interface LolService {

	public int register(ArrayList<LolVO> list);

	public List<LolVO2> getList();

	public List<LolVO2> getChamp();

	public void registerOTP(String ipv6);

	public String getbestplayer(String champ);

	public List<LolVO3> cal(DuoVO vo);

}

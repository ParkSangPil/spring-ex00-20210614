package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.zerock.domain.LolVO;
import org.zerock.domain.LolVO2;

public interface LolService {

	public int register(ArrayList<LolVO> list);

	public List<LolVO2> getList();

	public List<LolVO2> getChamp();

	public void registerOTP(String ipv6);

}

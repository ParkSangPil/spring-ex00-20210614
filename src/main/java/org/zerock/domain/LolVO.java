package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LolVO {

	private int bno;
	private String teamn;
	private int teamk;
	private int teamd;
	private int teama;
	private String teamc;
	private String victory;
	private Date regdate;
	private String ip;
	
//	public ArrayList<LolVO> getTypeArr(){
//		ArrayList<LolVO> list = new ArrayList<>();
//		return list;
//	}
}
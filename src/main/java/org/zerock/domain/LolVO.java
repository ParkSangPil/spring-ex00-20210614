package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LolVO {

	private int bno;
	private String team1;
	private String team2;
	private String winner;
	private Date regdate;
}
package org.zerock.domain;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int amount;
	private int pageNum;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getFrom() {
		return amount * (pageNum -1);
	}
	
	public String[] getTypeArr() {
		
		if(type == null) {
			return new String[] {};
		}else {
			String[] types = type.split("");	
			return types;
		}
	}
	
}

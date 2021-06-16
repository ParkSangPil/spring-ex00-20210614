package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;

@Component // 이거 있으면 
//            자동으로 bean이 되고 자동으로 Autowired가 일어난다
@ToString
@Getter
public class SampleHotel {
	
	private Chef chef;
	
//	@Autowired
	public SampleHotel(Chef chef) {
		this.chef = chef;
	}
}

package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {
	
	@Setter(onMethod_ = @Autowired)
	private Chef chef;
	
//	@Autowired                            @Data 와 @Setter~ 가 이 코드를 대신한다.
//	public void setChef(Chef chef) {
//		this.chef = chef;
//	}
	
}

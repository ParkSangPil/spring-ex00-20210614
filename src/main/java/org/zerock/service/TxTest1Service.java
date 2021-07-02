package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.mapper.TxTest1Mapper;

import lombok.Setter;

@Service
@Transactional // class 단위에도 넣을 수 있다.
public class TxTest1Service {

	@Setter (onMethod_ = @Autowired)
	private TxTest1Mapper mapper;
	
	
//	@Transactional // 이걸로 묶지 않으면 name하나만 성공하고 아래는 성공하지 않는다
	public void insert(String name) {
		
		mapper.insert(name);
		mapper.insert(name + name);
	}
}














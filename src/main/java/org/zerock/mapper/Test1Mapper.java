package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Test1VO;

public interface Test1Mapper {
	
	public List<Test1VO> getList();

	public Test1VO read(long id);
	
	public int insertSelectKey(Test1VO board);
	
	public int insert(Test1VO board);
	
	public int delete(long id);
	
	public int update(Test1VO test);

}

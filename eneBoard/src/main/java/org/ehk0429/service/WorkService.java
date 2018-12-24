package org.ehk0429.service;

import java.util.List;

public interface WorkService {

	// 조회
	public List<String> getWorkList(String keywords);
	
	// 상세 조회
	public String getWork(int id);
}

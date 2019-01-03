package org.ehk0429.service;

import org.ehk0429.domain.UserVO;

public interface JoinService {

	// 등록
		public void register(UserVO user);
		
		public void authRegister(String user_id);
}

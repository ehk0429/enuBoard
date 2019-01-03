package org.ehk0429.service;

import org.ehk0429.domain.UserVO;
import org.ehk0429.mapper.AuthMapper;
import org.ehk0429.mapper.UserMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class JoinServiceImple implements JoinService {

	private UserMapper userMapper;
	private AuthMapper authMapper;

	@Override
	public void register(UserVO user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

	@Override
	public void authRegister(String user_id) {
		// TODO Auto-generated method stub
		authMapper.insert(user_id);
	}

}

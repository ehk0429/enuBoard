package org.ehk0429.security;

import java.util.Arrays;

import org.ehk0429.domain.UserVO;
import org.ehk0429.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	
	@Setter(onMethod_ = {@Autowired})
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println(username);
		UserVO userVO = userMapper.read(username);
		System.out.println(userVO);
		String passwordEncode = this.passwordEncoder.encode(userVO.getPassword());
		

		 GrantedAuthority authority = new SimpleGrantedAuthority(userVO.getAuth());
		    UserDetails userDetails = (UserDetails)new User(username,
		    		passwordEncode, Arrays.asList(authority));
		    return userDetails;
	}

}

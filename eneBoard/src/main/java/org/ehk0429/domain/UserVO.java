package org.ehk0429.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserVO {
	
	// 아이디
	private String id;
	// 이름
	private String name;
	// 비밀번호
	private String password;
	// 전화번호
	private String phoneNum;
	// 사용여부
	private Boolean isEnabled;
	// 등록일자
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date createdAt;
}

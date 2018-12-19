package org.ehk0429.domain;

import java.util.Date;

import org.ehk0429.code.BoardType;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Board {
	// 아이디
	private int id;
	// 타입 ( 게시판, 방명록 )
	private BoardType boardType; 
	// 제목
	private String title;
	// 내용
	private String content;
	// 비밀글 여부
	private Boolean isEnabled;
	// 등록일자
	private Date createdAt;
	// 변경일자
	private Date updatedAt;
	// 댓글
}

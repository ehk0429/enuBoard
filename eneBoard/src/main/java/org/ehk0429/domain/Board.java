package org.ehk0429.domain;

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
	// 댓글 id
	private int commentId;
	// 비밀글 여부
	private Boolean isEnabled;
}

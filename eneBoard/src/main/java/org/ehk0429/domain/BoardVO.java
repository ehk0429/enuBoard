package org.ehk0429.domain;

import java.sql.Date;

import org.ehk0429.code.BoardType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardVO {
	// 아이디
	private int id;
	// 타입 ( 게시판, 방명록 )
	private BoardType type; 
	// 작성자
	private String writer;
	// 제목
	private String title;
	// 내용
	private String content;
	// 비밀글 여부
	private Boolean is_enabled;
	// 등록일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	// 변경일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updated_at;
	// 댓글
}

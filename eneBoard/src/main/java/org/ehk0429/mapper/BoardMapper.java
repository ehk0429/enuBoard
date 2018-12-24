package org.ehk0429.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.ehk0429.domain.BoardVO;
import org.ehk0429.domain.UserVO;

public interface BoardMapper {

	// 전체 조회
	@Select("SELECT * FROM board WHERE `type` LIKE '%BOARD%'")
	public List<BoardVO> getBoardList();

	@Select("SELECT * FROM board WHERE `type` LIKE '%GUESTBOOK%'")
	public List<BoardVO> getGuestBookList();
	
	// 상세 조회
	public BoardVO getBoard(int id);
	
	// 상세 조회
	public BoardVO getGuestBook(int id);
	
	// 등록
	public void insert(BoardVO board);
	// 수정
	public int update(BoardVO board);
	// 삭제
	public int delete(int id);
}

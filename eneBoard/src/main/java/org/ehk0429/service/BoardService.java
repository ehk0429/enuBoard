package org.ehk0429.service;

import java.util.List;

import org.ehk0429.domain.BoardVO;
import org.ehk0429.domain.Page;

public interface BoardService {
	
	// 전체 조회
	public List<BoardVO> getBoards(Page page);
	
	public Integer getBoardTotalCount();
	// 상세 조회
	public BoardVO getBoard(int id);
	// 전체 조회
	public List<BoardVO> getGuestBooks(Page page);
	
	public Integer getGuestBookTotalCount();
	// 상세 조회
	public BoardVO getGuestBook(int id);
	// 등록
	public void register(BoardVO board);
	// 수정
	public Boolean modify(BoardVO board);
	// 삭제
	public Boolean remove(int id);
}

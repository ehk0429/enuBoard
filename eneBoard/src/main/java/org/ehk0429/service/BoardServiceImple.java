package org.ehk0429.service;

import java.util.List;

import org.ehk0429.domain.BoardVO;
import org.ehk0429.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImple implements BoardService {

	private BoardMapper mapper;

	@Override
	public List<BoardVO> getBoards() {
		// TODO Auto-generated method stub
		return mapper.getBoardList();
	}

	@Override
	public BoardVO getBoard(int id) {
		// TODO Auto-generated method stub
		return mapper.getBoard(id);
	}
	
	@Override
	public List<BoardVO> getGuestBooks() {
		// TODO Auto-generated method stub
		return mapper.getGuestBookList();
	}

	@Override
	public BoardVO getGuestBook(int id) {
		// TODO Auto-generated method stub
		return mapper.getGuestBook(id);
	}
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.insert(board);
	}

	@Override
	public Boolean remove(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id) == 1;
	}

	@Override
	public Boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board) == 1; //update 성공여부 true , false
	}

	

}

package org.ehk0429.controller;

import org.ehk0429.domain.BoardVO;
import org.ehk0429.domain.Page;
import org.ehk0429.domain.PageDTO;
import org.ehk0429.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/guestBook/*")
@AllArgsConstructor
public class GuestBookController {
	
	private BoardService boardService;

	@GetMapping("/list")
	private void list(Model model, Page page) {
		model.addAttribute("pages", new PageDTO(page, boardService.getGuestBookTotalCount()));
		model.addAttribute("list", boardService.getGuestBooks(page));
	}
	
	@GetMapping("/detail")
	private void detail(@RequestParam("id") int id, Model model) {
		model.addAttribute("item", boardService.getGuestBook(id));
	}
	
	//등록 
	@GetMapping("/register")
	private void register() {
	}
	
	@PostMapping("/register")
	private String register(BoardVO board, RedirectAttributes redirectAttributes) {
		boardService.register(board);
		redirectAttributes.addFlashAttribute("result", board.getId());
		return "redirect:/guestBook/list";
	}
	
	//수정 
	@GetMapping("/modify")
	private void modify(@RequestParam("id") int id, Model model) {
		model.addAttribute("item", boardService.getGuestBook(id));
	}
	
	@PostMapping("/modify")
	private String modify(BoardVO board, RedirectAttributes redirectAttributes) {
		boardService.modify(board);
		if (boardService.modify(board)) { // 수정 성공시 true
			redirectAttributes.addFlashAttribute("result", "success");
		}
		return "redirect:/guestBook/list";
	}
	
	//삭제
	@PostMapping("/remove")
	private String remove(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
		
		if(boardService.remove(id)) {
			redirectAttributes.addFlashAttribute("result", "success");
		}
		return "redirect:/guestBook/list";
	}
}

package org.ehk0429.controller;

import org.ehk0429.domain.BoardVO;
import org.ehk0429.domain.Page;
import org.ehk0429.domain.PageDTO;
import org.ehk0429.service.BoardService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor // 생성자 생성 및 자동 주입
public class BoardController {

	private BoardService service;

	@GetMapping("/list")
	public void list(Model model, Page page) {
		model.addAttribute("list", service.getBoards(page));
		model.addAttribute("pages", new PageDTO(page, service.getBoardTotalCount()));
	}

	@GetMapping("/detail")
	public void detail(@RequestParam("id") int id, Model model) {
		model.addAttribute("item", service.getBoard(id));
	}

	@GetMapping("/modify")
	public void modify(@RequestParam("id") int id, Model model) {
		model.addAttribute("item", service.getBoard(id));
	}

	@GetMapping("/register")
	public void register(Authentication authentication, Model model) {
		model.addAttribute("writer", authentication.getName());
	}

	@PostMapping("/register")
	public String test(BoardVO board, RedirectAttributes redirectAttributes) {
		service.register(board); // 등록
		redirectAttributes.addFlashAttribute("result", board.getId());
		return "redirect:/board/list";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes redirectAttributes) {
		if (service.modify(board)) { // 수정 성공시 true
			redirectAttributes.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
		if (service.remove(id)) { // 삭제 성공시 true
			redirectAttributes.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

}

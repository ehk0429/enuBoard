package org.ehk0429.controller;

import org.ehk0429.service.WorkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/work/*")
@AllArgsConstructor
public class WorkController {
	private WorkService service; 
	// keywords string 기업명, 공고명, 업직종 키워드, 직무내용에서 검색하고자 하는 검색어
	// bbs_gb integer 공채구분 (1: 공채속보)
	// published 등록일
	// start integer 검색 결과 페이지 번호, 제로(0) 기반의 서수 번호 입니다. 기본값: 0
	// count integer 검색 결과 수, 기본값: 10, 최대값: 110
	@GetMapping("/list")
	public void list() {
	}
	
	@PostMapping("/list")
	public String list(@RequestParam("keywords") String keywords, Model model) {
		System.out.println(keywords);
		model.addAttribute("result", service.getWorkList(keywords));
		return "/work/list";
	}
}

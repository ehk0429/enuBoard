package org.ehk0429.controller;

import org.ehk0429.service.TranslationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/translation/*")
@AllArgsConstructor
public class TranslationController {

	private TranslationService service;
	
	@GetMapping("/search")
	private void search() {
	}
	
	@PostMapping("/search")
	private String search(@RequestParam("text") String text, @RequestParam("source") String source, @RequestParam("target") String target, Model model) {
		model.addAttribute("text", service.getTranslatedText(text, source, target));
		return "/translation/search";
	}
}

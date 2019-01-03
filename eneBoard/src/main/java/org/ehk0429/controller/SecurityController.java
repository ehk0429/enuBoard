package org.ehk0429.controller;

import org.ehk0429.domain.UserVO;
import org.ehk0429.service.BoardService;
import org.ehk0429.service.JoinService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping
@AllArgsConstructor // 생성자 생성 및 자동 주입
public class SecurityController {
	
	private JoinService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication authentication, Model model) {
		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		System.out.println(error);
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account!");
		}
		if (logout != null) {
			model.addAttribute("logout", "LogOut!");
		}
	}

	@GetMapping("/logout")
	public void logout() {
	}
	
	@PostMapping("/logout")
	public void logoutPost() {
	}
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public String joinPost(UserVO user, RedirectAttributes redirectAttributes) {
		service.register(user);
		System.out.println(user);
		redirectAttributes.addFlashAttribute("result", user.getId());
		if (user.getId() != null) {
			service.authRegister(user.getId()); // primary key
		}
		return "redirect:/login";
	}
}

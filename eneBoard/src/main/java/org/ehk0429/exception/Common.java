package org.ehk0429.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class Common {

//	전체
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		model.addAttribute("exception", ex);
		return "error/error_page";
	}
	
//	404
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "error/custom404";
	}
}

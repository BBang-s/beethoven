package com.skcc.beethoven.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ControllerExceptionHandler {
		
	private static final Logger logger = LoggerFactory.getLogger(ControllerExceptionHandler.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e, HttpServletRequest req) 
	{			
		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("/error.jsp");
		
		return mav;
	}

}

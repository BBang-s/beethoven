package com.skcc.beethoven.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.beethoven.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService usrService;
		
	//사용자 목록조회
	@RequestMapping("/userlist.do")
	public ModelAndView doUserList(HttpServletRequest req, HttpServletResponse res) 
	{	
		HashMap<String,String> paramMap = (HashMap)req.getAttribute("RequestMap");	
				
		ModelAndView mav = new ModelAndView();
		
		List<HashMap> usrList = usrService.getListUser(paramMap);
		
		// 사용자 리스트 
		mav.addObject("UserList", usrList);
		
		mav.setViewName("/userlist.jsp");
		
		return mav;
	}
	
	//사용자 등록화면 이동
	@RequestMapping("/useradd.go")
	public ModelAndView goUserInsert(HttpServletRequest req, HttpServletResponse res) 
	{	
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/userinfo.jsp");
		
		return mav;
	}
	
	// 사용자 수정화면 이동
	@RequestMapping("/usermod.go")
	public ModelAndView goUserModify(HttpServletRequest req, HttpServletResponse res) 
	{
		HashMap<String,String> paramMap = (HashMap)req.getAttribute("RequestMap");
		
		ModelAndView mav = new ModelAndView();
		
		HashMap usrInfo = usrService.getUser(paramMap);
		
		// 사용자 정보 
		mav.addObject("UserMap", usrInfo);
		
		mav.setViewName("/userinfo.jsp");
		
		return mav;
	}
	
	// 사용자 등록
	@RequestMapping("/adduser.do")
	public ResponseEntity insertUser(HttpServletRequest req, HttpServletResponse res) 
	{
		HashMap<String,String> paramMap = (HashMap)req.getAttribute("RequestMap");
				
		String jsonResult = usrService.addUser(paramMap);
		
		logger.debug("사용자 등록 결과 : " + jsonResult);
		
		return ResponseEntity.ok().body(jsonResult);
	}
	
	// 사용자 수정
	@RequestMapping("/upduser.do")
	public ResponseEntity updateUser(HttpServletRequest req, HttpServletResponse res) 
	{
		HashMap<String,String> paramMap = (HashMap)req.getAttribute("RequestMap");
		
		String jsonResult = usrService.updUser(paramMap);

		logger.debug("사용자 수정 결과 : " + jsonResult);
		
		return ResponseEntity.ok().body(jsonResult);
	}
	
	// 사용자 삭제
	@RequestMapping("/deluser.do")
	public ResponseEntity deleteUser(HttpServletRequest req, HttpServletResponse res) 
	{
		HashMap<String,String> paramMap = (HashMap)req.getAttribute("RequestMap");
		
		String jsonResult = usrService.delUser(paramMap);
		
		logger.debug("사용자 삭제 결과 : " + jsonResult);
		
		return ResponseEntity.ok().body(jsonResult);
	}
	
}

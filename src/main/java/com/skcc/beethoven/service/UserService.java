package com.skcc.beethoven.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.skcc.beethoven.mapper.TblUserMapper;

@Service
public class UserService {
	
	@Autowired
	TblUserMapper usrMapper;
	
	// 사용자 목록
	public List<HashMap> getListUser(HashMap<String,String> paramMap)
	{
		return usrMapper.getListUser(paramMap);
	}
		
	// 사용자 정보 조회
	public HashMap getUser(HashMap<String,String> paramMap)
	{
		return usrMapper.getUser(paramMap);
	}
			
	// 사죵자 정보 등록
	public String addUser(HashMap<String,String> paramMap)
	{
		int addCnt = usrMapper.addUser(paramMap);

		JsonObject json = new JsonObject();
		json.addProperty("result", addCnt);
		
		return json.toString();
	}
	
	// 사죵자 정보 수정
	public String updUser(HashMap<String,String> paramMap)
	{
		int updCnt = usrMapper.updUser(paramMap);

		JsonObject json = new JsonObject();
		json.addProperty("result", updCnt);
		
		return json.toString();
	}
	
	// 사죵자 삭제
	public String delUser(HashMap<String,String> paramMap)
	{
		int delCnt = usrMapper.delUser(paramMap);

		JsonObject json = new JsonObject();
		json.addProperty("result", delCnt);
		
		return json.toString();
	}


}

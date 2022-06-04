package com.skcc.beethoven.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface TblUserMapper {

	// 사용자 목록 
	public List<HashMap> getListUser(HashMap<String,String> paramMap);	
		
	// 사용자 조회
	public HashMap getUser(HashMap<String,String> paramMap);
	
	// 사용자 등록
	public int addUser(HashMap<String,String> paramMap);
	
	// 사용자 수정
	public int updUser(HashMap<String,String> paramMap);
	
	// 사용자 삭제
	public int delUser(HashMap<String,String> paramMap);	
	
}

package com.skcc.beethoven.restcontroller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skcc.beethoven.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.minidev.json.JSONObject;


@RestController
@RequestMapping("/v1/api")
@Api(tags = "사용자")
public class UserRestController {

	private static final Logger logger = LoggerFactory.getLogger(UserRestController.class);
	
	@Autowired
	private UserService usrService;
	
    @ApiOperation(httpMethod = "GET"
			,value = "전체 사용자 조회"
			,notes = "현재 등록되어 있는 모든 사용자를 조회합니다."
			,responseContainer = "JSONObject")
    @GetMapping(value = "/users")    
	public JSONObject getListUser() 
    {
    	try 
		{
	    	List<HashMap> usrList = usrService.getListUser(new HashMap());
	    		
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			
			if(usrList.size() == 0)
			{
				resultMap.put("result", "0");
				resultMap.put("message", "등록된 사용자가 없습니다.");
			}
			else
			{
				resultMap.put("result", "1");
				resultMap.put("message", "사용자 목록이 정상적으로 조회되었습니다.");
			}
			resultMap.put("listCount", String.valueOf(usrList.size()));
			resultMap.put("UserList", usrList);
		
			return new JSONObject(resultMap);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", "-1");
			jsonObject.put("message", "조회 중 오류가 발생했습니다.");
			
			return jsonObject;
		}
	}
    
    @ApiOperation(httpMethod = "GET"
    		,value = "특정 사용자 조회"
			,notes = "사용자ID로 특정 사용자를 조회합니다."
			,responseContainer = "JSONObject")
	@GetMapping(value = "/user/{id}")    
	public JSONObject getUser(@PathVariable("id") String usrId) 
    {
    	
		try 
		{
			HashMap<String,String> paramMap = new HashMap<String,String>();
	    	paramMap.put("usr_id", usrId);
	    	HashMap<String,String> resultMap = usrService.getUser(paramMap);
	    	
	    	if(resultMap == null || resultMap.isEmpty())
	    	{
	    		if(resultMap == null)
	    			resultMap = new HashMap<String,String>();
	    		
				resultMap.put("result", "0");
				resultMap.put("message", "확인 요청하신 사용자가 존재하지 않습니다.");
			}	    	
			else
			{
				resultMap.put("result", "1");
				resultMap.put("message", "확인 요청하신 사용자가 존재합니다.");
			}
	    		    	
	    	return new JSONObject(resultMap);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", "-1");
			jsonObject.put("message", "요청 확인 중 오류가 발생했습니다.");
						
			return jsonObject;
		}
	}
    
   
}

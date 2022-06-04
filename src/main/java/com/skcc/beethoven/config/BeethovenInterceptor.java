package com.skcc.beethoven.config;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.beethoven.exception.InterceptorException;

@Component
public class BeethovenInterceptor implements HandlerInterceptor  {
	
	private static final Logger logger = LoggerFactory.getLogger(BeethovenInterceptor.class);
	
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws InterceptorException 
    {
		logger.debug("Interceptor > preHandle");
		
		// 화면상 선택한 메뉴 유지 처리
		HttpSession session = request.getSession();
		String menuId = request.getParameter("mnu");
		HashMap<String,String> menuMap = null;
		
		if(menuId == null)
		{	
			if(session.getAttribute("menuMap") == null)
			{
				menuMap = new HashMap<String,String>();
				menuMap.put("a01", "active"); // 홈 메뉴 선택
			}
			else			
				menuMap = (HashMap)session.getAttribute("menuMap");
		}
		else
		{		
			// 메뉴값 초기화
			menuMap = new HashMap<String,String>();
			
			menuMap.put(menuId.substring(0, 1), "active open");
			menuMap.put(menuId, "active"); 	
		}	
		
		if(menuMap != null)
			session.setAttribute("menuMap", menuMap);
		
		// Request 파라미터 확인 로그
		String reqUri = request.getRequestURI();
        String[] reqParams = null;
        
        Map reqMap = request.getParameterMap();      
      
        HashMap<String,String> paramMap = new HashMap<String,String>();
        
        logger.debug("\n\n\n");
        logger.debug("");
        logger.debug("=========================================================================");
        logger.debug("# HTTP Request ("+reqUri+") Parameters");
        logger.debug("=========================================================================");
        
        for(Object key : reqMap.keySet())
        {
        	
        	logger.debug(key+" : " + (Arrays.toString((String[])reqMap.get(key))).replaceAll(", ", ","));
        	        	
        	reqParams = request.getParameterValues((String)key);
        	if(reqParams.length == 1)
        		paramMap.put((String)key, request.getParameter((String)key));
        	else
        		paramMap.put((String)key, (Arrays.toString((String[])reqMap.get(key))).replaceAll(", ", ","));
 
        }
  
        logger.debug("=========================================================================");       
        logger.debug("\n");
        logger.debug("");
				
        request.setAttribute("RequestMap", paramMap);
		return true;
    }

	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws InterceptorException 
    {
    	logger.debug("Interceptor > postHandle");
    	
    	try
		{
    		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw (InterceptorException)e;
		}
    }

	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3) throws InterceptorException 
    {
    	logger.debug("Interceptor > afterCompletion" );
    	
    	try
		{
    		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw (InterceptorException)e;
		}
    }
}

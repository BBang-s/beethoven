package com.skcc.beethoven.config;

import java.util.List;
import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceHandlerMethodArgumentResolver;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class WebConfig implements WebMvcConfigurer  {
    
	@Override
	public void addInterceptors(InterceptorRegistry registry) 
	{
		registry.addInterceptor(localeChangeInterceptor());
		registry.addInterceptor(deviceResolverHandlerInterceptor());
	    registry.addInterceptor(serviceInterceptor())
	            .addPathPatterns("/**")
	            .excludePathPatterns("/") // Context Root
	            .excludePathPatterns("/*.htm") // html 페이지 제외
	            .excludePathPatterns("/*.html") // html 페이지 제외
	            .excludePathPatterns("/favicon.ico")
	            .excludePathPatterns("/error")	             
	            .excludePathPatterns("/css/**") // CSS
	            .excludePathPatterns("/js/**") // JS
	            .excludePathPatterns("/images/**") // image
	            .excludePathPatterns("/font/**") // font
	            .excludePathPatterns("/plugin/**") // font
	            .excludePathPatterns("/tmpl/**") // JS
	            .excludePathPatterns("/*.zip") // zip파일
	            .excludePathPatterns("/*.pdf") // pdf 파일 공유	            
	            .excludePathPatterns("/v1/api/talk/**")
	            .excludePathPatterns("/v1/api/auth/**")	           
	            .excludePathPatterns("/v2/**") // swagger 설정 예외처리
	            .excludePathPatterns("/swagger*/**"); // swagger 설정 예외처리
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) 
	{		
		registry.addViewController("/").setViewName("/index.jsp"); //context root로 요청시 welcome-file 설정 추가
	}
	
	@Bean
	public BeethovenInterceptor serviceInterceptor() 
	{
	    return new BeethovenInterceptor();
	}
	
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() 
	{
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		lci.setParamName("lang");
	    return lci;	
	}
	
	@Bean
	public CookieLocaleResolver localeResolver() 
	{
	    CookieLocaleResolver localeResolver = new CookieLocaleResolver();
	    localeResolver.setDefaultLocale(Locale.KOREAN); // 기본 한국어
		localeResolver.setCookieName("btv.locale"); // 쿠키 이름 ; mae.locale
		localeResolver.setCookieMaxAge(60 * 60); // 쿠키 살려둘 시간, -1로 하면 브라우져를 닫을 때 없어짐.
		localeResolver.setCookiePath("/"); // Path를 지정해 주면 해당하는 path와 그 하위 path에서만 참조
	    return localeResolver;
	}
	
	@Bean
    MappingJackson2JsonView jsonView()
	{
        return new MappingJackson2JsonView();
    }
		
	@Bean
	public DeviceResolverHandlerInterceptor deviceResolverHandlerInterceptor() 
	{
	    return new DeviceResolverHandlerInterceptor();
	}

	@Bean
	public DeviceHandlerMethodArgumentResolver deviceHandlerMethodArgumentResolver() 
	{
	    return new DeviceHandlerMethodArgumentResolver();
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) 
	{
	   argumentResolvers.add(deviceHandlerMethodArgumentResolver());
	}

}
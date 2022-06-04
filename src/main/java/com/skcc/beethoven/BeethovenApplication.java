package com.skcc.beethoven;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication 
public class BeethovenApplication extends SpringBootServletInitializer { 
	@Override 
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) { 
		return application.sources(BeethovenApplication.class); 
	}

	public static void main(String[] args) { 
		SpringApplication.run(BeethovenApplication.class, args); 
	}
}


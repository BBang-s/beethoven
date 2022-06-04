package com.skcc.beethoven.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class BeethovenSwaggerConfig implements WebMvcConfigurer {

	private String admBasePackage = "com.skcc.beethoven.restcontroller";    
    private String version = "";
    private String title = "";
    
    @Bean
    public Docket beethovenRestApiV1() {
    	title = "베토벤";
    	version = "1.0";
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo(title, version))
                .groupName(title)
                .select()
                .apis(RequestHandlerSelectors.basePackage(admBasePackage))
                .paths(PathSelectors.any())
                .build();
    }
    
    private ApiInfo apiInfo(String title, String version) {
        return new ApiInfoBuilder()
                .title("Beethoven REST API(" + title + ")" + version)
                .version(version)
                .description("Beethoven REST API 입니다.")
                .build();
    }
    
}
package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.common.FileManagerServices;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		//웹주소 url 형식
		.addResourceHandler("/images/**")
		// 실제 파일위치 경로
		.addResourceLocations("file:///" + FileManagerServices.FILE_UPLOAD_PATH);
		
	}
}

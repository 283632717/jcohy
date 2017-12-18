package com.jcohy;

import com.jcohy.intercepter.CommonIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class JcohyApplication extends WebMvcConfigurerAdapter{

	@Autowired
	private CommonIntercepter commonInterceptor;

	public static void main(String[] args) {
		SpringApplication.run(JcohyApplication.class, args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
		registry.addInterceptor(commonInterceptor)
				.addPathPatterns("/**");
	}
}

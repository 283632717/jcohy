package com.jcohy;

import com.jcohy.intercepter.CommonIntercepter;
import com.jcohy.intercepter.LoginIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class JcohyApplication extends WebMvcConfigurerAdapter{

	@Autowired
	private CommonIntercepter commonInterceptor;
	@Autowired
	private LoginIntercepter loginIntercepter;
	public static void main(String[] args) {
		SpringApplication springApplication = new SpringApplication(JcohyApplication.class);
		//
		springApplication.run(args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
		registry.addInterceptor(commonInterceptor)
				.addPathPatterns("/**");
		registry.addInterceptor(loginIntercepter).addPathPatterns("/admin/**")
				.excludePathPatterns("/admin");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//倒计时主页
		registry.addViewController("/").setViewName("home");
		//登录主页
		registry.addViewController("/admin").setViewName("redirect:/login");
		//前台首页
		registry.addViewController("/index").setViewName("index");
		//后台主页
		registry.addViewController("/admin/index").setViewName("admin/main");
		//博客管理主页
		registry.addViewController("/blog/index").setViewName("admin/blog/index");
	}
}

package com.jcohy.config;

import com.jcohy.directive.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class FreeMarkerConfig {

    @Autowired
    private freemarker.template.Configuration configuration;
    
    @Autowired
    private CategoryDirective categoryDirective;
    @Autowired
    private BlogDirective blogDirective;
    @Autowired
    private TagDirective tagDirective;
    @Autowired
    private LinkDirective linkDirective;
    @Autowired
    private NoticeDirective noticeDirective;
    @Autowired
    private MenuDirective menuDirective;
    @PostConstruct
    public void setSharedVariable() {
    	try {
			configuration.setSharedVariable("categoryList", categoryDirective);
			configuration.setSharedVariable("blogList", blogDirective);
			configuration.setSharedVariable("tagList", tagDirective);
			configuration.setSharedVariable("linkList", linkDirective);
			configuration.setSharedVariable("noticeList",noticeDirective);
            configuration.setSharedVariable("menuList",menuDirective);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}

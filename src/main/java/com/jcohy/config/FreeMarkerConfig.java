package com.jcohy.config;

import com.jcohy.directive.BlogDirective;
import com.jcohy.directive.CategoryDirective;
import com.jcohy.directive.LinkDirective;
import com.jcohy.directive.TagDirective;
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
    
    @PostConstruct
    public void setSharedVariable() {
    	try {
			configuration.setSharedVariable("categoryList", categoryDirective);
			configuration.setSharedVariable("blogList", blogDirective);
			configuration.setSharedVariable("tagList", tagDirective);
			configuration.setSharedVariable("linkList", linkDirective);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}

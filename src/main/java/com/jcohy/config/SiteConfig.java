package com.jcohy.config;

import com.jcohy.model.Options;
import com.jcohy.service.OptionsService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/28 11:08.
 * ClassName  : SiteConfig
 * Description  :
 */

@Component
public class SiteConfig implements InitializingBean{

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private OptionsService optionsService;


    @Override
    public void afterPropertiesSet() throws Exception {
        setOptions();
    }

    /**
     *
	 * 设置系统基本属性到ServletContext中
     *
	 */
    private void setOptions() {
        List<Options> options = optionsService.findAll();
        for (Options option : options) {
			servletContext.setAttribute(option.getOptionKey(), option.getOptionValue());
            System.out.println(option.getOptionKey()+":"+option.getOptionValue());
        }
    }
}

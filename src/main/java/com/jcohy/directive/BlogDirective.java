package com.jcohy.directive;

import com.jcohy.model.Blog;
import com.jcohy.service.BlogService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/18 15:40.
 * ClassName  : BlogDirective
 * Description  :
 */
@Component
public class BlogDirective implements TemplateDirectiveModel {


    @Autowired
    private BlogService blogService;

    @Override
    public void execute(Environment environment, Map params, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        List<Blog> list = new ArrayList<Blog>();
        if(params != null && params.containsKey("type")){
            String type = params.get("type").toString();

            if("readNum".equalsIgnoreCase(type)){
                list = blogService.findHotN(5);
            }

            if("shareNum".equalsIgnoreCase(type)){
                list = blogService.findFeaturedN(5);
            }

            if("all".equalsIgnoreCase(type)){
                list = blogService.findAll();
            }

            environment.setVariable("list", new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(list));
            if (templateDirectiveBody != null) {
                templateDirectiveBody.render(environment.getOut());
            }
        }
    }
}

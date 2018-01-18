package com.jcohy.directive;

import com.jcohy.model.Category;
import com.jcohy.service.CategoryService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/18 15:47.
 * ClassName  : CategoryDirective
 * Description  :
 */
@Component
public class CategoryDirective implements TemplateDirectiveModel{

    @Autowired
    private CategoryService categoryService;

    @Override
    public void execute(Environment environment, @SuppressWarnings("rawtypes") Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {

        List<Category> list = categoryService.findVisible();
        environment.setVariable("list", new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(list));
        if (templateDirectiveBody != null) {
            templateDirectiveBody.render(environment.getOut());
        }

    }
}

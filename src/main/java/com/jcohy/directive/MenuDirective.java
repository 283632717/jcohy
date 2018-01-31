package com.jcohy.directive;

import com.jcohy.model.Menu;
import com.jcohy.service.MenuService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:56.
 * ClassName  : MenuDirective
 * Description  :
 */
@Component
public class MenuDirective implements TemplateDirectiveModel {

    @Autowired
    private MenuService menuService;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {

        List<Menu> list = menuService.findVisible();

        environment.setVariable("list",new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(list));
        if (templateDirectiveBody != null) {
            templateDirectiveBody.render(environment.getOut());
        }
    }
}

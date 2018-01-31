package com.jcohy.directive;

import com.jcohy.model.Notice;
import com.jcohy.service.NoticeService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:21.
 * ClassName  : NoticeDirective
 * Description  :
 */
@Component
public class NoticeDirective implements TemplateDirectiveModel {

    @Autowired
    private NoticeService noticeService;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        List<Notice> noticeList = noticeService.findAllVisiable();
        environment.setVariable("list",new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25).build().wrap(noticeList));
        if (templateDirectiveBody != null) {
            templateDirectiveBody.render(environment.getOut());
        }
    }
}

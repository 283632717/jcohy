package com.jcohy.controller.admin;

import com.jcohy.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 09:35.
 * ClassName  : AdminTagController
 * Description  :
 */
@Controller
public class AdminTagController {

    @Autowired
    private TagService tagService;

}

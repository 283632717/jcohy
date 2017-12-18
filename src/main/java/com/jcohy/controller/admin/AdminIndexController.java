package com.jcohy.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 10:47.
 * ClassName  : IndexController
 * Description  :
 */
@Controller
public class AdminIndexController {

    @GetMapping("/admin/index")
    public String index(){
        return "admin/main";
    }
}

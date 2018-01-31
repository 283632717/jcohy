package com.jcohy.controller.front;

import com.jcohy.model.Blog;
import com.jcohy.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 11:57.
 * ClassName  : BlogController
 * Description  :
 */
@Controller
@RequestMapping("/article")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping("/index")
    public String index(ModelMap map){
        PageRequest pageRequest = new PageRequest(0, 5);
        Page<Blog> page = blogService.findAll(pageRequest);
        System.out.println(page.getTotalElements());
        map.put("page", page);
        return "front/home";
    }
}

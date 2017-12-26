package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.exception.ServiceException;
import com.jcohy.model.Blog;
import com.jcohy.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 20:17 2017/12/20
 * Email: jia_chao23@126.com
 * ClassName: AdminBlogController
 * Description:
 **/
@Controller
@RequestMapping("/blog")
public class AdminBlogController {


    @Autowired
    private BlogService blogService;

    @GetMapping("/index")
    private String index(){
        return "admin/datalist";
    }

    @GetMapping("/list")
    private JsonResult list(){

        try{
            List<Blog> blogs = blogService.findAll();
            blogs.forEach(System.out::println);
            return JsonResult.ok();
        }catch (ServiceException e){
            return JsonResult.fail();
        }
    }
    @GetMapping("/form")
    private String form(){

        return null;
    }

}

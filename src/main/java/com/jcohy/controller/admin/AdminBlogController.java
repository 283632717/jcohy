package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.controller.BaseController;
import com.jcohy.exception.ServiceException;
import com.jcohy.model.Blog;
import com.jcohy.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
public class AdminBlogController extends BaseController{


    @Autowired
    private BlogService blogService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Blog> all(ModelMap map){
        List<Blog> categories = blogService.findAll();
        PageJson<Blog> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(categories.size());
        page.setData(categories);
        return page;
    }


    @GetMapping("/form")
    private String form(){

        return null;
    }

}

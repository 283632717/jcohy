package com.jcohy.controller.admin;

import com.jcohy.common.PageJson;
import com.jcohy.controller.BaseController;
import com.jcohy.model.Category;
import com.jcohy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/21 10:55.
 * ClassName  : AdminCategoryController
 * Description  :
 */

@Controller
@RequestMapping("/category")
public class AdminCategoryController extends BaseController{

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/list")
    @ResponseBody
    public Page<Category> list(){
        PageRequest pageRequest = getPageRequest();
        Page<Category> categories = categoryService.findAll(pageRequest);
        return categories;
    }

    @PostMapping("/all")
    @ResponseBody
    public PageJson<Category> all(ModelMap map){
        List<Category> categories = categoryService.findAll();
        PageJson<Category> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(categories.size());
        page.setData(categories);
        return page;
    }

}

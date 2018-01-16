package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.controller.BaseController;
import com.jcohy.model.Category;
import com.jcohy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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


    @GetMapping("/list")
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

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map){

        if(id != null){
            Category category = categoryService.findById(id);
            map.put("category",category);
        }
        return "admin/category/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Category category){
        try {
            categoryService.saveOrUpdate(category);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @DeleteMapping("{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Long id){
        try {
            categoryService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
}

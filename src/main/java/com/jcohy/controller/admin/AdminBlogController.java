package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.controller.BaseController;
import com.jcohy.model.Blog;
import com.jcohy.model.Category;
import com.jcohy.model.Tag;
import com.jcohy.service.BlogService;
import com.jcohy.service.CategoryService;
import com.jcohy.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TagService tagService;

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

    @DeleteMapping("/{id}/del")
    @ResponseBody
    public JsonResult delete(@PathVariable("id")Long id){
        try {
            blogService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map){
        List<Category> categories = categoryService.findAll();
        List<Tag> tags = tagService.findAll();
        map.put("categories",categories);
        map.put("tags",tags);
        if(id != null){
            Blog blog = blogService.findById(id);
            map.put("blog",blog);
        }
        return "admin/blog/form";
    }


    @GetMapping("{id}/change")
    @ResponseBody
    public JsonResult change(@PathVariable("id") Long id,String type){
        try {
            blogService.change(id,type);

        } catch (Exception e) {

            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

}

package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.model.Tag;
import com.jcohy.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 09:35.
 * ClassName  : AdminTagController
 * Description  :
 */
@Controller
@RequestMapping("/tag")
public class AdminTagController {

    @Autowired
    private TagService tagService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Tag> all(ModelMap map){
        List<Tag> categories = tagService.findAll();
        PageJson<Tag> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(categories.size());
        page.setData(categories);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map){

        if(id != null){
            Tag tag = tagService.findById(id);
            map.put("tag",tag);
        }
        return "admin/tag/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Tag tag){
        try {
            tagService.saveOrUpdate(tag);
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
            tagService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
}

package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.model.Link;
import com.jcohy.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 13:44.
 * ClassName  : AdminLinkController
 * Description  :
 */
@Controller
@RequestMapping("/link")
public class AdminLinkController {

    @Autowired
    private LinkService linkService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Link> all(ModelMap map){
        List<Link> categories = linkService.findAll();
        PageJson<Link> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(categories.size());
        page.setData(categories);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map){

        if(id != null){
            Link link = linkService.findById(id);
            map.put("link",link);
        }
        return "admin/link/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Link link){
        try {
            linkService.saveOrUpdate(link);
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
            linkService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }

    @GetMapping("/{id}/change")
    public JsonResult change(@PathVariable("id") Long id,String type){
        try {
            linkService.change(id,type);

        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok("操作成功");
    }
}

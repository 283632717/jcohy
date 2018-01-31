package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.common.PageJson;
import com.jcohy.model.Notice;
import com.jcohy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 15:23.
 * ClassName  : AdminNoticeController
 * Description  :
 */
@Controller
@RequestMapping("/notice")
public class AdminNoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Notice> all(ModelMap map){
        List<Notice> categories = noticeService.findAll();
        PageJson<Notice> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(categories.size());
        page.setData(categories);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Long id, ModelMap map){

        if(id != null){
            Notice notice = noticeService.findById(id);
            map.put("notice",notice);
        }
        return "admin/notice/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Notice notice){
        try {
            if(notice.getVisible() == null){
                notice.setVisible(0);
            }
            noticeService.saveOrUpdate(notice);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("添加失败");
        }
        return JsonResult.ok();
    }

    @DeleteMapping("{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Long id){
        try {
            noticeService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
    @GetMapping("{id}/change")
    @ResponseBody
    public JsonResult change(@PathVariable("id") Long id,String type){
        try {
            noticeService.change(id,type);

        } catch (Exception e) {

            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }
}

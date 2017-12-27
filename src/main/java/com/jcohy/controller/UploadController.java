package com.jcohy.controller;

import com.jcohy.common.Constant;
import com.jcohy.common.JsonResult;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/27 16:04.
 * ClassName  : UploadController
 * Description  :
 */
@Controller
public class UploadController {

    @PostMapping("/upload")
    @ResponseBody
    public JsonResult upload(@RequestParam("file") MultipartFile file){

        File target = new File(Constant.TARGET_FILE_PATH);
        if(!target.exists()){
            target.mkdir();
        }
        System.out.println(file.getOriginalFilename());
        try {
            file.transferTo(new File(target,file.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @GetMapping("/download")
    public void download(@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response) throws IOException {
        File file = new File(Constant.TARGET_FILE_PATH,name);
        System.out.println(file.getPath());
        if(file.exists()) {
            // 设置强制下载不打开
            response.setContentType("application/force-download");
            // 设置文件名
            response.addHeader("Content-Disposition", "attachment;fileName=" + name);

            FileInputStream inputStream = new FileInputStream(file);
            byte[] data = new byte[(int)file.length()];
            int length = inputStream.read(data);
            inputStream.close();

            OutputStream stream = response.getOutputStream();
            stream.write(data);
            stream.flush();
            stream.close();
        }
    }
}

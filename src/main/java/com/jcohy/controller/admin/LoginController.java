package com.jcohy.controller.admin;

import com.jcohy.common.JsonResult;
import com.jcohy.model.Session;
import com.jcohy.service.UserService;
import com.jcohy.utils.CookieKit;
import com.jcohy.utils.IpKit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : LoginController
 * Description  :
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(){
        return "admin/index";
    }

    @PostMapping("/login")
    @ResponseBody
    public JsonResult login(HttpServletRequest request, HttpServletResponse response,
                            String name, String password,
                            @RequestParam(required = false) String keepLogin){
        try {
            logger.error(name+","+password);
            boolean _keepLogin = false;
            if("true".equalsIgnoreCase(keepLogin)){
                _keepLogin = true;
            }else{
                _keepLogin = false;
            }
            String ip = IpKit.getRealIp(request);
            Session session = userService.login(name,password,_keepLogin,ip);
            //把sessionID写入cookie
            CookieKit.setSessionId2Cookie(response, session.getSessionId(), ip, _keepLogin);

            return JsonResult.ok().set("returnUrl", "/admin");
        } catch (Exception e) {
            return JsonResult.fail(e.getMessage());
        }
    }
}

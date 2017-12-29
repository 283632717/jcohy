package com.jcohy.controller;

import com.jcohy.common.Constant;
import com.jcohy.model.User;
import com.jcohy.utils.CacheKit;
import com.jcohy.utils.CookieKit;
import com.jcohy.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/21 10:56.
 * ClassName  : BaseController
 * Description  :
 */
public class BaseController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    @Autowired
    private CacheKit cacheKit;

    private User loginUser = null;

    protected PageRequest getPageRequest(){
        Integer pageNumber = 0;
        String pageNumberStr = request.getParameter("page");
        System.out.println(pageNumberStr);
        if(!StringUtils.isBlank(pageNumberStr)){
            pageNumber = Integer.parseInt(pageNumberStr)-1;
        }
        Integer pageSize = 10;
        String pageSizeStr = request.getParameter("limit");
        if(!StringUtils.isBlank(pageSizeStr)){
            pageSize = Integer.parseInt(pageSizeStr);
        }

        return new PageRequest(pageNumber, pageSize);
    }

    protected User getLoginUser(){
        String sessionId = CookieKit.getSessionIdFromCookie(request,response);
        if (sessionId != null) {
            Object object = cacheKit.get(Constant.CACHE_LOGINUSER, sessionId);
            if (object != null) {
                loginUser = (User) object;
            }
        }
        return loginUser;
    }

    public boolean isLogin() {
        return getLoginUser() != null;
    }

    public boolean notLogin() {
        return !isLogin();
    }

    public boolean getKeepLogin(){

        String keepLogin = request.getParameter("keepLogin");
        System.out.println(keepLogin);
        if(keepLogin.equalsIgnoreCase("true")){
            return true;
        }
        return false;
    }

}

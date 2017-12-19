package com.jcohy.intercepter;

import com.jcohy.common.Constant;
import com.jcohy.model.Session;
import com.jcohy.model.User;
import com.jcohy.service.SessionService;
import com.jcohy.service.UserService;
import com.jcohy.utils.CacheKit;
import com.jcohy.utils.CookieKit;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 19:51 2017/12/19
 * Email: jia_chao23@126.com
 * ClassName: LoginIntercepter
 * Description:
 **/
@Component
public class LoginIntercepter implements HandlerInterceptor {

    @Resource
    private CacheKit cacheKit;
    @Resource
    private SessionService sessionService;
    @Resource
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //从cookie中获取当前用户的sessionId
        String sessionId = CookieKit.getSessionIdFromCookie(httpServletRequest, httpServletResponse);
        //如果获取的session不为空，证明浏览器端有登录记录
        if (sessionId != null) {
            //从登录缓存中取当前的登录用户
            Object object = cacheKit.get(Constant.CACHE_LOGINUSER, sessionId);
            if (object != null) {
                httpServletRequest.setAttribute("loginUser", object);
                return true;
            }else {
                //如果缓存中没有登录的用户，则去数据库中取对应的session
                Session session = sessionService.findBySessionId(sessionId);
                //数据库中存在session，并且还没有过期，则进行登录操作
                if (session != null && session.getExpireAt() - System.currentTimeMillis() >0) {
                    User user = session.getUser();
                    cacheKit.put(Constant.CACHE_LOGINUSER, sessionId, user);
                    httpServletRequest.setAttribute("loginUser", user);
                    return true;
                }
            }
        }
        //删除无用cookie
        CookieKit.removeSessionIdFromCookie(httpServletResponse);
        //跳转到登录页面
        httpServletResponse.sendRedirect("/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

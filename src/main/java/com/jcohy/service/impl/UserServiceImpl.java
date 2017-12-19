package com.jcohy.service.impl;

import com.jcohy.common.Constant;
import com.jcohy.exception.ServiceException;
import com.jcohy.model.LoginLog;
import com.jcohy.model.Session;
import com.jcohy.model.User;
import com.jcohy.repository.LoginLogRepository;
import com.jcohy.repository.SessionRepository;
import com.jcohy.repository.UserRepository;
import com.jcohy.service.UserService;
import com.jcohy.utils.CacheKit;
import com.jcohy.utils.MD5Kit;
import com.jcohy.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:23.
 * ClassName  : UserServiceImpl
 * Description  :
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SessionRepository sessionRepository;

    @Autowired
    private CacheKit cacheKit;

    @Autowired
    private LoginLogRepository loginLogRepository;

    @Override
    public Session login(String name, String password, Boolean keepLogin, String ip) throws ServiceException {
        if(StringUtils.isBlank(name) || StringUtils.isBlank(password)){
            throw new ServiceException("用户名或者密码不能为空");
        }
        User user = userRepository.findByName(name);
        if(user == null){
            throw new ServiceException("用户不存在");
        }
        String passwordMD5 = MD5Kit.generatePasswordMD5(password, user.getSalt());
        if(passwordMD5 != null && passwordMD5.equalsIgnoreCase(user.getPassword())){
            // 如果用户勾选保持登录，暂定过期时间为 Constant.SESSION_KEEPLOGIN，否则为 Constant.SESSION_UNKEEPLOGIN 分钟，单位为秒
            long liveSeconds =  keepLogin!= null && keepLogin ? Constant.SESSION_KEEPLOGIN :Constant.SESSION_UNKEEPLOGIN;
            // expireAt 用于设置 session 的过期时间点，需要转换成毫秒
            long expireAt = System.currentTimeMillis() + (liveSeconds * 1000);
            // 保存登录 session 到数据库
            Session session = new Session();
            String sessionId = StringUtils.getRandomUUID();
            session.setSessionId(sessionId);
            session.setUser(user);
            session.setExpireAt(expireAt);
            sessionRepository.save(session);

            cacheKit.put(Constant.CACHE_LOGINUSER, sessionId, user);

            //添加登录日志
            loginLogRepository.save(new LoginLog(user,new Date(),ip));

            return session;
        }else{
            throw new ServiceException("用户名或者密码不正确");
        }
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void logout(String sessionId) {
        cacheKit.remove(Constant.CACHE_LOGINUSER, sessionId);
    }

    @Override
    public User findById(Long id) {
        return userRepository.findOne(id);
    }

    @Override
    public User findByName(String name) {
        if(StringUtils.isBlank(name)){
            throw new ServiceException("用户名不能为空");
        }
        return  userRepository.findByName(name);
    }

    @Override
    public void saveOrUpdate(User user) throws ServiceException{

    }

    @Override
    public boolean checkUser(String name) {
        findByName(name);
        return findByName(name) != null? false :true;
    }

    @Override
    public void register(String name, String password, String email, String ip) throws ServiceException {
        if(StringUtils.isBlank(name)||StringUtils.isBlank(password)||StringUtils.isBlank(email)){
            throw new ServiceException("用户名或者密码或者邮箱不能为空");
        }
        User user = new User();
        //用用户名对密码进行加盐处理

    }

    @Override
    public void delete(Long id) {
        if(id == null){
            throw new ServiceException("主键不能为空");
        }
        userRepository.delete(id);
    }

    @Override
    public void updatePassword(User user, String oldpassword, String password1,
                               String password2) {
        if(StringUtils.isBlank(oldpassword) || StringUtils.isBlank(password1) || StringUtils.isBlank(password2)){
            throw new ServiceException("参数不完整");
        }

        if(!password1.equals(password2)){
            throw new ServiceException("两次输入密码不一致");
        }

        User dbUser = findById(user.getId());
        String passwordMD5 = MD5Kit.generatePasswordMD5(password1, user.getSalt());
        if(!user.getPassword().equals(passwordMD5)){
            throw new ServiceException("旧密码不正确");
        }
        dbUser.setPassword(passwordMD5);
        userRepository.saveAndFlush(dbUser);
    }
}

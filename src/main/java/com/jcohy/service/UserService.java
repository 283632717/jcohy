package com.jcohy.service;

import com.jcohy.exception.ServiceException;
import com.jcohy.model.Session;
import com.jcohy.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : UserService
 * Description  :
 */

public interface UserService {
    /**
     * 用户登录
     * @param name
     * @param password
     * @param keepLogin
     * @param ip
     * @return
     * @throws Exception
     */
    Session login(String name, String password, Boolean keepLogin, String ip) throws Exception;


    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<User> findAll(Pageable Pageable);


    /**
     *  查询
     * @return
     */
    List<User> findAll();


    /**
     * 用户注销
     * @param sessionId
     */
    void logout(String sessionId);

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    User findById(Long id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    User findByName(String name);
    /**
     * 新增或者更新用户
     * @param user
     */
    void saveOrUpdate(User user) throws ServiceException;

    /**
     * 检查用户是否存在
     * @param name
     * @return
     */
    boolean checkUser(String name);
    /**
     * 注册用户
     * @param name
     * @param password
     * @param email
     * @param ip
     * @throws ServiceException
     */
    void register(String name, String password, String email, String ip) throws ServiceException;
    /**
     * 删除用户
     * @param id
     */
    void delete(Long id);

    /**
     * 修改用户密码
     * @param user
     * @param oldpassword
     * @param password1
     * @param password2
     */
    void updatePassword(User user, String oldpassword, String password1, String password2);
}

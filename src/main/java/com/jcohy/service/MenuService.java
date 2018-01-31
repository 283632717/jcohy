package com.jcohy.service;

import com.jcohy.model.Menu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:53.
 * ClassName  : MenuService
 * Description  :
 */
public interface MenuService {

    /**
     * 查询可见菜单
     * @return
     */
    List<Menu> findVisible();


    /**
     * 查询所有资源
     * @return
     */
    List<Menu> findAll();

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Menu> findAll(Pageable pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Menu findById(Long id);

    /**
     * 增加，修改
     * @param menu
     */
    void saveOrUpdate(Menu menu);


    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Long id);
}

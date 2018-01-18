package com.jcohy.service;

import com.jcohy.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/21 11:00.
 * ClassName  : CategoryService
 * Description  :
 */
public interface CategoryService {

    /**
     * 查询可见分类
     * @return
     */
     List<Category> findVisible();


    /**
     * 查询所有资源
     * @return
     */
    List<Category> findAll();

    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Category> findAll(Pageable Pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Category findById(Long id);

    /**
     * 增加，修改
     * @param category
     */
    void saveOrUpdate(Category category);


    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Long id);
}

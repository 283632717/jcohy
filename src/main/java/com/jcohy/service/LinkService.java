package com.jcohy.service;

import com.jcohy.model.Link;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 13:30.
 * ClassName  : LinkService
 * Description  :
 */
public interface LinkService {


    /**
     * 查询所有资源
     * @return
     */
    List<Link> findAll();

    /**
     * 查询所有可见
     *
     * @return
     */
    List<Link> findAllVisiable();
    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Link> findAll(Pageable Pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Link findById(Long id);

    /**
     * 增加，修改
     * @param link
     */
    Link saveOrUpdate(Link link);


    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Long id);

    /**
     *
     * 修改状态
     * @param id
     */
    Link change(Long id,String type);
}

package com.jcohy.service;

import com.jcohy.model.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 09:35.
 * ClassName  : TagService
 * Description  :
 */
public interface TagService {

    /**
     * 查询所有标签
     * @return
     */
    List<Tag> findAll();

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Tag> findAll(Pageable pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Tag findById(Long id);

    /**
     * 增加，修改
     * @param tag
     */
    Tag saveOrUpdate(Tag tag);

    /**
     * 修改数量
     * @param name
     */
    void saveByName(String name);

    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Long id);
}

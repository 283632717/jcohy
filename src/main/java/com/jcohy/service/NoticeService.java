package com.jcohy.service;

import com.jcohy.model.Notice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:25.
 * ClassName  : NoticeService
 * Description  :
 */
public interface NoticeService {

    /**
     * 查询所有留言
     * @return
     */
    List<Notice> findAll();

    /**
     * 查询所有可见
     *
     * @return
     */
    List<Notice> findAllVisiable();
    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Notice> findAll(Pageable pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Notice findById(Long id);

    /**
     * 增加，修改
     * @param link
     */
    Notice saveOrUpdate(Notice link);
}

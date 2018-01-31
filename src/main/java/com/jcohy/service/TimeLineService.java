package com.jcohy.service;

import com.jcohy.model.TimeLine;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 14:35.
 * ClassName  : TimeLineService
 * Description  :
 */
public interface TimeLineService {
    /**
     * 查询所有留言
     * @return
     */
    List<TimeLine> findAll();

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    TimeLine findById(Long id);

    /**
     * 增加，修改
     * @param timeLine
     */
    TimeLine saveOrUpdate(TimeLine timeLine);
}

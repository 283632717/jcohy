package com.jcohy.repository;

import com.jcohy.model.Notice;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:23.
 * ClassName  : NoticeRepository
 * Description  :
 */
public interface NoticeRepository extends JpaRepository<Notice,Long> {


    /**
     * 查询所有可见
     * @param visible
     * @return
     */
    List<Notice> findAllByVisible(int visible);
}

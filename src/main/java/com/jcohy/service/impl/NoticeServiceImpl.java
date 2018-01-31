package com.jcohy.service.impl;

import com.jcohy.model.Notice;
import com.jcohy.repository.NoticeRepository;
import com.jcohy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:25.
 * ClassName  : NoticeServiceImpl
 * Description  :
 */

@Service
public class NoticeServiceImpl implements NoticeService {


    @Autowired
    private NoticeRepository noticeRepository;

    @Override
    public List<Notice> findAll() {
        return noticeRepository.findAll();
    }

    @Override
    public List<Notice> findAllVisiable() {
        return noticeRepository.findAllByVisible(0);
    }

    @Override
    public Page<Notice> findAll(Pageable pageable) {
        return noticeRepository.findAll(pageable);
    }

    @Override
    public Notice findById(Long id) {
        return noticeRepository.findOne(id);
    }

    @Override
    public Notice saveOrUpdate(Notice notice) {
        return noticeRepository.save(notice);
    }
}

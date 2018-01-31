package com.jcohy.service.impl;

import com.jcohy.model.TimeLine;
import com.jcohy.repository.TimeLineRepository;
import com.jcohy.service.TimeLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 14:36.
 * ClassName  : TimeLineServiceImpl
 * Description  :
 */

@Service
public class TimeLineServiceImpl implements TimeLineService {

    @Autowired
    private TimeLineRepository timeLineRepository;
    @Override
    public List<TimeLine> findAll() {
        return timeLineRepository.findAll();
    }

    @Override
    public TimeLine findById(Long id) {
        return timeLineRepository.findOne(id);
    }

    @Override
    public TimeLine saveOrUpdate(TimeLine timeLine) {
        return timeLineRepository.save(timeLine);
    }
}

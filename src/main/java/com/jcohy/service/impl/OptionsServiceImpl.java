package com.jcohy.service.impl;

import com.jcohy.model.Options;
import com.jcohy.repository.OptionsResitory;
import com.jcohy.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/28 11:04.
 * ClassName  : OptionsServiceImpl
 * Description  :
 */

@Service
public class OptionsServiceImpl implements OptionsService {

    @Autowired
    private OptionsResitory optionsResitory;
    @Override
    public List<Options> findAll() {
        return optionsResitory.findAll();
    }
}

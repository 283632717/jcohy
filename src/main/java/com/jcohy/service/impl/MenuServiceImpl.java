package com.jcohy.service.impl;

import com.jcohy.model.Menu;
import com.jcohy.repository.MenuRepository;
import com.jcohy.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:55.
 * ClassName  : MenuServiceImpl
 * Description  :
 */

@Service
public class MenuServiceImpl implements MenuService{

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public List<Menu> findVisible() {
        return menuRepository.findAllByVisible(0);
    }

    @Override
    public List<Menu> findAll() {
        return menuRepository.findAll();
    }

    @Override
    public Page<Menu> findAll(Pageable pageable) {
        return menuRepository.findAll(pageable);
    }

    @Override
    public Menu findById(Long id) {
        return menuRepository.findOne(id);
    }

    @Override
    public void saveOrUpdate(Menu menu) {
        menuRepository.save(menu);
    }

    @Override
    public void delete(Long id) {
        menuRepository.delete(id);
    }
}

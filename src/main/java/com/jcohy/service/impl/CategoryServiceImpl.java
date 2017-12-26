package com.jcohy.service.impl;


import com.jcohy.exception.ServiceException;
import com.jcohy.model.Category;
import com.jcohy.repository.BlogRepository;
import com.jcohy.repository.CategoryRepository;
import com.jcohy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/10/24 17:20.
 * ClassName  : CategoryServiceImpl
 * Description  :
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private BlogRepository blogRepository;

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Page<Category> findAll(Pageable Pageable) {
        return categoryRepository.findAll(Pageable);
    }

    @Override
    public Category findById(Long id) {
        return categoryRepository.findOne(id);
    }

    @Override
    public void saveOrUpdate(Category category) {
        if(category == null){
            throw new ServiceException("分类对象为空");
        }

        if(category.getId() != null){
            Category ret = findById(category.getId());
            ret.setName(category.getName());
            ret.setUpdateDate(new Date());
            categoryRepository.save(ret);
        }else{
            category.setCreateDate(new Date());
            category.setCount(0);
            category.setStatus(0);
            categoryRepository.save(category);
        }
    }


    @Override
    public void delete(Long id) {

        categoryRepository.delete(id);
    }
}

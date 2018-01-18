package com.jcohy.service.impl;

import com.jcohy.exception.ServiceException;
import com.jcohy.model.Tag;
import com.jcohy.repository.TagRepository;
import com.jcohy.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 09:37.
 * ClassName  : TagServiceImpl
 * Description  :
 */
@Service
public class TagServiceImpl implements TagService {


    @Autowired
    private TagRepository tagRepository;

    @Override
    public List<String> findAllNameList() {
        List<String> result = new ArrayList<String>();
        List<Tag> list = tagRepository.findAllByStatus(0);
        for (Tag tag : list) {
            result.add(tag.getName());
        }
        return result;
    }

    @Override
    public List<Tag> findAll() {
        return tagRepository.findAll();
    }

    @Override
    public Page<Tag> findAll(Pageable pageable) {
        return tagRepository.findAll(pageable);
    }

    @Override
    public Tag findById(Long id) {
        return tagRepository.findOne(id);
    }

    @Override
    public Tag saveOrUpdate(Tag tag) {

        if(tag == null){
            throw new ServiceException("标签对象为空");
        }
        if(tag.getId() != null){
            Tag ret = findById(tag.getId());
            ret.setName(tag.getName());
            ret.setUpdateDate(new Date());
            return tagRepository.save(ret);
        }else{
            tag.setCreateDate(new Date());
            tag.setCount(0);
            tag.setStatus(0);
            return tagRepository.save(tag);
        }
    }

    @Override
    public void saveByName(String name) {

    }

    @Override
    public void delete(Long id) {
        tagRepository.delete(id);
    }

    @Override
    public void changeStatus(Long id) {
        if(id == null){
            throw new ServiceException("ID不能为空");
        }
        Tag tag = findById(id);
        tag.setStatus(tag.getStatus() == 0?1:0);
        tagRepository.saveAndFlush(tag);
    }
}

package com.jcohy.service.impl;

import com.jcohy.exception.ServiceException;
import com.jcohy.model.Link;
import com.jcohy.repository.LinkRepository;
import com.jcohy.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/26 13:32.
 * ClassName  : LinkServiceImpl
 * Description  :
 */
@Service
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkRepository linkRepository;

    @Override
    public List<Link> findAll() {
        return linkRepository.findAll();
    }

    @Override
    public Page<Link> findAll(Pageable Pageable) {
        return linkRepository.findAll(Pageable);
    }

    @Override
    public Link findById(Long id) {
        return linkRepository.findOne(id);
    }

    @Override
    public Link saveOrUpdate(Link link) {
        if(link == null){
            throw new ServiceException("没有友情链接");
        }
        if(link.getId() != null){
            Link _link = linkRepository.findOne(link.getId());
            _link.setTitle(link.getTitle());
            _link.setUrl(link.getUrl());
            _link.setDescription(link.getDescription());
            _link.setEmail(link.getEmail());
            _link.setUpdateDate(new Date());
            return linkRepository.saveAndFlush(_link);
        }else{
            link.setStatus(0);
            link.setCreateDate(new Date());
            return linkRepository.saveAndFlush(link);
        }
    }

    @Override
    public void delete(Long id) {
        linkRepository.delete(id);
    }

    @Override
    public Link change(Long id, String type) {
        Link link = linkRepository.findOne(id);
        switch (type){
            case "status":
                link.setStatus(link.getStatus() == 0 ? 1:0);
                break;
            default:
                break;
        }
        return linkRepository.save(link);
    }
}

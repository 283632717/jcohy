package com.jcohy.service.impl;

import com.jcohy.model.Blog;
import com.jcohy.repository.BlogRepository;
import com.jcohy.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 20:18 2017/12/20
 * Email: jia_chao23@126.com
 * ClassName: BlogServiceImpl
 * Description:
 **/
@Service
public class BlogServiceImpl implements BlogService {


    @Autowired
    private BlogRepository blogRepository;

    @Override
    public List<Blog> findAll() {
        return blogRepository.findAll();
    }

    @Override
    public Blog findBlogById(Long id) {
        return blogRepository.findOne(id);
    }

    @Override
    public void saveOrUpdateBlog(Blog blog) {

        blogRepository.saveAndFlush(blog);
    }

    @Override
    public void deleteBlog(Long id) {
            blogRepository.delete(id);
    }

}

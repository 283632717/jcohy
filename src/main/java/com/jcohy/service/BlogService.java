package com.jcohy.service;

import com.jcohy.model.Blog;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 20:18 2017/12/20
 * Email: jia_chao23@126.com
 * ClassName: BlogService
 * Description:
 **/
public interface BlogService {

        List<Blog> findAll();

        Blog  findBlogById(Long id);

        void saveOrUpdateBlog(Blog blog);

        void deleteBlog(Long id);

}

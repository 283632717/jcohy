package com.jcohy.service;

import com.jcohy.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 20:18 2017/12/20
 * Email: jia_chao23@126.com
 * ClassName: BlogService
 * Description:
 **/
public interface BlogService {
        /**
         * 查询所有资源
         * @return
         */
        List<Blog> findAll();

        /**
         * 分页查询
         * @param Pageable
         * @return
         */
        Page<Blog> findAll(Pageable Pageable);

        /**
         * 通过Id查找
         * @param id
         * @return
         */
        Blog findById(Long id);

        /**
         * 增加，修改
         * @param blog
         */
        void saveOrUpdate(Blog blog);


        /**
         *
         * 根据id删除
         * @param id
         */
        void delete(Long id);


        /**
         * 改变状态。
         * @param id
         * @param type
         */
        void change(Long id,String type);
}

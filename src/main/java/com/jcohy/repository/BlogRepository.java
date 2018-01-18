package com.jcohy.repository;

import com.jcohy.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:26 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: BlogRepository
 * Description:
 **/
public interface BlogRepository extends JpaRepository<Blog,Long> {

    /**
     * 获取推荐博客列表
     *
     * @param commentNum
     *            推荐状态
     * @param privacy
     *            权限
     * @param pageable
     * @return
     */
    Page<Blog> findByCommentNumAndPrivacyOrderByCreateDateDesc(int commentNum, int privacy, Pageable pageable);


    /**
     * 根据浏览数量获取博客
     *
     * @param privacy
     *            权限
     * @param pageable
     * @return
     */
    Page<Blog> findByPrivacyOrderByReadNumDesc(int privacy, Pageable pageable);


}

package com.jcohy.repository;

import com.jcohy.model.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:26 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: BlogRepository
 * Description:
 **/
public interface BlogRepository extends JpaRepository<Blog,Long> {
}

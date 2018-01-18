package com.jcohy.repository;

import com.jcohy.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:27 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: CategoryRepository
 * Description:
 **/
public interface CategoryRepository extends JpaRepository<Category,Long> {

    /**
     * 根据状态获取分类列表
     * @param status
     * @return
     */
    List<Category> findByStatus(Integer status);
}

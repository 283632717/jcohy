package com.jcohy.repository;

import com.jcohy.model.Link;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:30 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: LinkRepository
 * Description:
 **/
public interface LinkRepository extends JpaRepository<Link,Long> {

    /**
     * 查询所有可见
     * @param status
     * @return
     */
    List<Link> findAllByStatus(int status);
}

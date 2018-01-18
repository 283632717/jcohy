package com.jcohy.repository;

import com.jcohy.model.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:29 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: TagRepository
 * Description:
 **/
public interface TagRepository extends JpaRepository<Tag,Long> {


    List<Tag> findAllByStatus(Integer status);

    /**
     * 根据标签名获取
     * @param tagName
     * @return
     */
    Tag findByName(String tagName);
}

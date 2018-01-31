package com.jcohy.repository;

import com.jcohy.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/31 09:52.
 * ClassName  : MenuRepository
 * Description  :
 */
public interface MenuRepository extends JpaRepository<Menu,Long>{

    List<Menu> findAllByVisible(int visible);
}

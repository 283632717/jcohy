package com.jcohy.service;

import com.jcohy.model.Blog;
import com.jcohy.repository.BlogRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/29 15:21.
 * ClassName  : BolgTest
 * Description  :
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class BolgTest {

    @Autowired
    private BlogRepository blogRepository;

    @Test
    public void getAll(){
        List<Blog> all = blogRepository.findAll();
        System.out.println(all.size());
        all.forEach(System.out::println);
    }
}

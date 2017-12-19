package com.jcohy.repository;

import com.jcohy.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:25 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: UserRepository
 * Description:
 **/
public interface UserRepository extends JpaRepository<User,Long>{
   User findByName(String name);
}

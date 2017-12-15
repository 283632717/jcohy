package com.jcohy.repository;

import com.jcohy.model.LoginLog;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:27 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: LoginLogRepository
 * Description:
 **/
public interface LoginLogRepository extends JpaRepository<LoginLog,Long> {
}

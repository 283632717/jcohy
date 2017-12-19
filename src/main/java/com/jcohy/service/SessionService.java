package com.jcohy.service;

import com.jcohy.model.Session;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/19 09:19.
 * ClassName  : SessionService
 * Description  :
 */
public interface SessionService {
    Session findBySessionId(String sessionId);
}

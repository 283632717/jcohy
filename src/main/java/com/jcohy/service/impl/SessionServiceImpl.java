package com.jcohy.service.impl;

import com.jcohy.model.Session;
import com.jcohy.repository.SessionRepository;
import com.jcohy.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/19 09:20.
 * ClassName  : SessionServiceImpl
 * Description  :
 */
@Service
public class SessionServiceImpl implements SessionService {

    @Autowired
    private SessionRepository sessionRepository;
    @Override
    public Session findBySessionId(String sessionId) {
        return sessionRepository.findBySessionId(sessionId);
    }
}

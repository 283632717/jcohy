package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Session
 * Description:
 **/
@Entity
@Table(name = "session")
public class Session  extends AbstractModel implements Serializable{


    private static final long serialVersionUID = 443119757745421828L;

    private String sessionId;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    private Long expireAt;


    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getExpireAt() {
        return expireAt;
    }

    public void setExpireAt(Long expireAt) {
        this.expireAt = expireAt;
    }

}


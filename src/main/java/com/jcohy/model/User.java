package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;


/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: User
 * Description:
 **/

@Entity
@Table(name = "user")
public class User extends AbstractModel implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1785824516147698045L;

    private String nickName;

    private String userName;

    private String password;

    private String salt;

    /**
     * 状态 <br>
     * -1锁定<br>
     * 0未激活<br>
     * 1激活
     */
    @Column(nullable = false, columnDefinition = "Integer default 0")
    private Integer status;

    private String avatar;

    private String ip;

    private String description;


    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}

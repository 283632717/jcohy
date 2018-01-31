package com.jcohy.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:17 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: LoginLog
 * Description:
 **/

@Entity
@Table(name = "login_log")
public class LoginLog extends AbstractModel implements Serializable{

	private static final long serialVersionUID = -7865774537910926746L;
	
	

	public LoginLog(User user, Date loginAt, String ip) {
		super();
		this.user = user;
		this.loginAt = loginAt;
		this.ip = ip;
	}



	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date loginAt;

	private String ip;


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getLoginAt() {
		return loginAt;
	}

	public void setLoginAt(Date loginAt) {
		this.loginAt = loginAt;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}

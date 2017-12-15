package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;


/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Tag
 * Description:
 **/

@Entity
@Table(name = "tag")
public class Tag extends AbstractModel implements Serializable{


	private static final long serialVersionUID = -194977139613028192L;

	private String name;

	/**
	 * 显示状态
	 * <br>
	 * 0 显示
	 * <br>
	 * 1隐藏
	 * <br>
	 */
	private Integer status;

	@Column(nullable = false,columnDefinition="int default 0")
	private Integer count;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}

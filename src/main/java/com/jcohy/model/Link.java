package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:17 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Link
 * Description:
 **/

@Entity
@Table(name = "link")
public class Link extends AbstractModel implements Serializable {

    private static final long serialVersionUID = 1744219853139483256L;


    private String title;

    @Column(length = 500)
    private String url;

    private String description;

    /**
     * 0 可见 1 隐藏
     */
    @Column(nullable = false, columnDefinition = "Integer default 0")
    private Integer status;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}

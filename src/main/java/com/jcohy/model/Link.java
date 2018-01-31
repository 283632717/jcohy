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

    @Column(name = "description")
    private String description;

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "menu_id")
    private Menu menu;

    /**
     * 0 可见 1 隐藏
     */
    @Column(nullable = false, columnDefinition = "Integer default 0")
    private Integer status;

    @Column(name = "email")
    private String email;

    @Column(name = "logo")
    private String logo;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

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

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
}

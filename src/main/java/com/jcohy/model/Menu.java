package com.jcohy.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/4 10:50.
 * ClassName  : Menu
 * Description  :
 */
@Entity
@Table(name = "menu")
public class Menu extends AbstractModel{

    @Column(name = "code")
    private Integer code;

    @Column(name = "name")
    private String name;

    @Column(name = "parent_code")
    private Integer parentId;

    @Column(name = "content")
    private String content;

    @OneToMany(mappedBy = "menu", fetch = FetchType.EAGER)
    private Set<Link> links;

    @Column(name = "visible")
    private Integer visible;

    @Column(name = "url")
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public Set<Link> getLinks() {
        return links;
    }

    public void setLinks(Set<Link> links) {
        this.links = links;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

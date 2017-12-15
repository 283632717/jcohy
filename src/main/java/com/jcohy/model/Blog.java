package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;


/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Blog
 * Description:
 **/

@Entity
@Table(name = "blog")
public class Blog extends AbstractModel implements Serializable {

    private static final long serialVersionUID = -3578273403164774283L;

    @ManyToOne
    @JoinColumn(name = "author_id")
    private User author;

    @Lob
    private String content;

    private Integer featured;

    /**
     * 权限级别<br>
     * 0 公开 1私密
     */
    private Integer privacy;

    /**
     * 状态 暂时不启用
     */
    private Integer status;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @Column(length = 500)
    private String summary;

    private String tags;

    private String title;

    @Column(nullable = false, columnDefinition = "int default 0")
    private Integer views;



    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getFeatured() {
        return featured;
    }

    public void setFeatured(Integer featured) {
        this.featured = featured;
    }

    public Integer getPrivacy() {
        return privacy;
    }

    public void setPrivacy(Integer privacy) {
        this.privacy = privacy;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

}

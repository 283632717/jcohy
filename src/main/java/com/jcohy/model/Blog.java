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

    @Column(name = "istop")
    private Integer isTop;

    @Column(name = "isrecomment")
    private Integer isRecommend;


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


    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

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

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
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

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Blog{");
        sb.append("author=").append(author);
        sb.append(", content='").append(content).append('\'');
        sb.append(", isTop=").append(isTop);
        sb.append(", isRecommend=").append(isRecommend);
        sb.append(", privacy=").append(privacy);
        sb.append(", status=").append(status);
        sb.append(", category=").append(category);
        sb.append(", summary='").append(summary).append('\'');
        sb.append(", tags='").append(tags).append('\'');
        sb.append(", title='").append(title).append('\'');
        sb.append(", views=").append(views);
        sb.append('}');
        return sb.toString();
    }
}

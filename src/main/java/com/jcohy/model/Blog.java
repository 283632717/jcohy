package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


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

    @Column(name = "iscomment")
    private Integer isCommend;


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

    @ManyToOne
    @JoinColumn(name = "type_id")
    private Type type;

    @Column(name = "url")
    private String url;


    @Column(length = 500)
    private String summary;

    @Column(name = "tags")
    private String tags;

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    private String title;



    @Column(name = "comment_num")
    private Integer commentNum;

    @Column(name = "heart_num")
    private Integer heartNum;

    @Column(name = "read_num")
    private Integer readNum;

    @Column(name = "coverURL")
    private String coverURL;

    public Integer getIsCommend() {
        return isCommend;
    }

    public void setIsCommend(Integer isCommend) {
        this.isCommend = isCommend;
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

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getHeartNum() {
        return heartNum;
    }

    public void setHeartNum(Integer heartNum) {
        this.heartNum = heartNum;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    public String getCoverURL() {
        return coverURL;
    }

    public void setCoverURL(String coverURL) {
        this.coverURL = coverURL;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Blog{");
        sb.append("author=").append(author);
        sb.append(", content='").append(content).append('\'');
        sb.append(", isTop=").append(isTop);
        sb.append(", isCommend=").append(isCommend);
        sb.append(", privacy=").append(privacy);
        sb.append(", status=").append(status);
        sb.append(", category=").append(category);
        sb.append(", summary='").append(summary).append('\'');
        sb.append(", tags='").append(tags).append('\'');
        sb.append(", title='").append(title).append('\'');
        sb.append(", commentNum=").append(commentNum);
        sb.append(", heartNum=").append(heartNum);
        sb.append(", readNum=").append(readNum);
        sb.append(", coverURL='").append(coverURL).append('\'');
        sb.append('}');
        return sb.toString();
    }
}

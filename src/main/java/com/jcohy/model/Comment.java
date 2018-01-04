package com.jcohy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/4 10:33.
 * ClassName  : Comment
 * Description  :
 */
@Entity
@Table(name = "comment")
public class Comment extends AbstractModel {

    @Column(name = "nickname")
    private String nickName;

    @Column(name = "email")
    private String email;

    @Column(name = "content")
    private String content;

    @Column(name = "likeNum")
    private Integer likeNum;

    @Column(name = "hateNum")
    private Integer hateNum;

    @Column(name = "shareNum")
    private Integer shareNum;

    @Column(name = "parent")
    private Integer parent;

    @Column(name = "blogID")
    private Integer blogID;

    @Column(name = "replyNum")
    private Integer replyNum;

    @Column(name = "headURL")
    private String headUrl;

    /**
     * 是否审核，0表示未审核，1表示审核
     */
    @Column(name = "check",columnDefinition = "int default 0")
    private Integer check;

    /**
     * 是否合法，0未通过，1通过
     */
    @Column(name = "status" ,columnDefinition = "int default 1")
    private Integer status;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getHateNum() {
        return hateNum;
    }

    public void setHateNum(Integer hateNum) {
        this.hateNum = hateNum;
    }

    public Integer getShareNum() {
        return shareNum;
    }

    public void setShareNum(Integer shareNum) {
        this.shareNum = shareNum;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    public Integer getBlogID() {
        return blogID;
    }

    public void setBlogID(Integer blogID) {
        this.blogID = blogID;
    }

    public Integer getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(Integer replyNum) {
        this.replyNum = replyNum;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public Integer getCheck() {
        return check;
    }

    public void setCheck(Integer check) {
        this.check = check;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}

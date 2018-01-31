package com.jcohy.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/4 10:31.
 * ClassName  : Notice
 * Description  :日志实体类
 */
@Entity
@Table(name = "notice")
public class Notice extends AbstractModel {


    @Column(name = "content")
    private String content;

    @Column(name = "start")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date start;

    @Column(name = "end")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date end;

    @Column(name = "visible")
    private Integer visible;

    @Column(name = "url")
    private String url;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Notice{");
        sb.append("content='").append(content).append('\'');
        sb.append(", start=").append(start);
        sb.append(", end=").append(end);
        sb.append(", visible=").append(visible);
        sb.append(", url='").append(url).append('\'');
        sb.append('}');
        return sb.toString();
    }
}

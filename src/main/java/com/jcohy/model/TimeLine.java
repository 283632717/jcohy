package com.jcohy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2018/1/4 10:56.
 * ClassName  : TimeLine
 * Description  :
 */

@Entity
@Table(name = "timeline")
public class TimeLine extends AbstractModel{

    @Column(name = "displayName")
    private String displayName;

    @Column(name = "displayDate")
    private Date displayDate;

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public Date getDisplayDate() {
        return displayDate;
    }

    public void setDisplayDate(Date displayDate) {
        this.displayDate = displayDate;
    }
}

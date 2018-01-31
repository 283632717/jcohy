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

    @Column(name = "display_name")
    private String displayName;

    @Column(name = "display_date")
    private String displayDate;

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayDate() {
        return displayDate;
    }

    public void setDisplayDate(String displayDate) {
        this.displayDate = displayDate;
    }
}

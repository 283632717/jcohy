package com.jcohy.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcohy.common.Constant;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: AbstractModel
 * Description:
 **/
@MappedSuperclass
public abstract class AbstractModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_date")
    @JsonFormat(pattern = Constant.DATETIME_FORMAT, timezone = "GMT+8")
    private Date createData;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_date")
    @JsonFormat(pattern = Constant.DATETIME_FORMAT, timezone = "GMT+8")

    private Date updateData;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateData() {
        return createData;
    }

    public void setCreateData(Date createData) {
        this.createData = createData;
    }

    public Date getUpdateData() {
        return updateData;
    }

    public void setUpdateData(Date updateData) {
        this.updateData = updateData;
    }
}

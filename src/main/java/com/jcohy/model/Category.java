package com.jcohy.model;

import javax.persistence.*;
import java.io.Serializable;


/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Category
 * Description:
 **/

@Entity
@Table(name = "category")
public class Category extends AbstractModel implements Serializable {

    private static final long serialVersionUID = -6677454688636838847L;


    private String name;

    @Column(nullable = false, columnDefinition = "int default 0")
    private Integer status;

    @Column(nullable = false, columnDefinition = "int default 0")
    private Integer count;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
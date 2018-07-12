package com.huanxink.msys.managesys.model;

import com.alibaba.fastjson.JSON;
import lombok.Data;

import java.util.Date;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:19
 */
@Data
public abstract class BasicEnity {

    private Integer id;

    private Date createdTime;

    private String creater;

    private Date updatedTime;

    private Date updater;

    public String toJSONString() {
        return JSON.toJSONString(this);
    }
}

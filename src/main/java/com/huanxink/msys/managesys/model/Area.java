package com.huanxink.msys.managesys.model;

import lombok.Data;

@Data
public class Area extends BasicEnity {

    private String areaName;

    private Integer parentId;

}
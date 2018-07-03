package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.util.List;

@Data
public class Province  extends BasicEnity {

    private String provinceName;

    private Integer parentId;

    private List<City> cities;

}
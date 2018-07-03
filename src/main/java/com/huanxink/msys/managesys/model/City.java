package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.util.List;

@Data
public class City extends BasicEnity {

    private String cityName;

    private Integer parentId;

    private List<Area> areas;

}
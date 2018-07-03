package com.huanxink.msys.managesys.model;

import lombok.Data;

@Data
public class Enterprise extends BasicEnity {

    private String enterpriseName;

    private Integer provinceId;

    private String provinceName;

    private Integer cityId;

    private String cityName;

    private Integer areaId;

    private String areaName;

}
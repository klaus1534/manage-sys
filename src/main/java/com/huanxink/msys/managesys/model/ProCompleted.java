package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ProCompleted  extends BasicEnity {

    private Integer projectEnterId;

    private String projectName;

    private String projectNo;

    private String projectCompletedNo;

    private BigDecimal realBuildAmount;

    private BigDecimal realBuildArea;

    private String realBuildScale;

    private Date realStartTime;

    private Date realCompletedTime;

}
package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProBuild extends BasicEnity {

    private Integer projectEnterId;

    private String projectName;

    private String projectNo;

    private String projectBuildNo;

    private BigDecimal projectContractAmount;

    private BigDecimal projectContractDuration;

    private String buildScale;

    private BigDecimal buildArea;

    private Integer buildEnterId;

    private String buildMan;

}
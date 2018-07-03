package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ProContract  extends BasicEnity {

    private Integer projectEnterId;

    private String projectName;

    private String projectNo;

    private String projectContractNo;

    private Date contractSignTime;

    private String contractBuildScale;

    private BigDecimal contractBuildAmount;

    private String contractType;

    private Integer tenderEnterId;

}
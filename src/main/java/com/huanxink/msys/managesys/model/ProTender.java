package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ProTender  extends BasicEnity {
    private Integer projectEnterId;

    private String projectNo;

    private String projectTenderNo;

    private String projectName;

    private String projectType;

    private Date tenderShootDate;

    private BigDecimal tenderAmount;

    private String buildScale;

    private BigDecimal tenderBuildArea;

    private Integer tenderEnterId;

    private String tenderMan;

}
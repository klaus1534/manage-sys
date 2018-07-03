package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.util.Date;

@Data
public class EnterpriseQualification extends BasicEnity {

    private String enterpriseId;

    private String qualificationName;

    private String qualificationLevel;

    private String qualificationNo;

    private Date issueTime;

    private Date validTime;
}
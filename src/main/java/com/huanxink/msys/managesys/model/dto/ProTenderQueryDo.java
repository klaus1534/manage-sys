package com.huanxink.msys.managesys.model.dto;

import lombok.Data;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/13 22:49
 */
@Data
public class ProTenderQueryDo extends ProTenderDo {

    private String qualificationName;

    private String qualificationLevel;

    private String contractType;

}

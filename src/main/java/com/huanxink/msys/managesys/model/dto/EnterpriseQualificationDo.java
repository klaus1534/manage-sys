package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.model.EnterpriseQualification;
import lombok.Data;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 15:32
 */
@Data
public class EnterpriseQualificationDo extends EnterpriseQualification {
    private String enterpriseName;
}

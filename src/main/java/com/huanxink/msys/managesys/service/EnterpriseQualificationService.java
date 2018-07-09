package com.huanxink.msys.managesys.service;

import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;

import java.util.List;
import java.util.Map;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 14:36
 */
public interface EnterpriseQualificationService extends BasicService<EnterpriseQualification, Integer, EnterpriseQualificationDo> {
    List secherLevel(Map param);
}

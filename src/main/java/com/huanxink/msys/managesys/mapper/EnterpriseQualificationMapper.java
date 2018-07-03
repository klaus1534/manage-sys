package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import org.springframework.stereotype.Repository;

@Repository
public interface EnterpriseQualificationMapper extends BasicMapper<EnterpriseQualification, Integer, EnterpriseQualificationDo>  {
}
package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface EnterpriseQualificationMapper extends BasicMapper<EnterpriseQualification, Integer, EnterpriseQualificationDo>  {
    List<T> secherLevelList(Map param);
}
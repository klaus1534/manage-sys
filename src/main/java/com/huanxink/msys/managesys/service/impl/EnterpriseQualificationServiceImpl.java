package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.EnterpriseQualificationMapper;
import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import com.huanxink.msys.managesys.service.EnterpriseQualificationService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class EnterpriseQualificationServiceImpl extends BasicServiceImpl<EnterpriseQualification, Integer, EnterpriseQualificationDo>
        implements EnterpriseQualificationService {

    @Autowired
    private EnterpriseQualificationMapper enterpriseQualificationMapper;

    @Override
    protected BasicMapper<EnterpriseQualification, Integer, EnterpriseQualificationDo> getBasicMapper() {
        return enterpriseQualificationMapper;
    }
    @Override
    public List secherLevel(Map param){

        List<T> list = enterpriseQualificationMapper.secherLevelList(param);

        return list;
    }
}

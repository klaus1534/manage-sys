package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.EnterpriseMapper;
import com.huanxink.msys.managesys.model.Enterprise;
import com.huanxink.msys.managesys.service.EnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class EnterpriseServiceImpl extends BasicServiceImpl<Enterprise, Integer, Enterprise>
        implements EnterpriseService {

    @Autowired
    private EnterpriseMapper enterpriseMapper;

    @Override
    protected BasicMapper<Enterprise, Integer, Enterprise> getBasicMapper() {
        return enterpriseMapper;
    }
}

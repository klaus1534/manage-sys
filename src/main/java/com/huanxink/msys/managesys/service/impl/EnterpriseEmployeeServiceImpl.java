package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.EnterpriseEmployeeMapper;
import com.huanxink.msys.managesys.model.EnterpriseEmployee;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import com.huanxink.msys.managesys.service.EnterpriseEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class EnterpriseEmployeeServiceImpl extends BasicServiceImpl<EnterpriseEmployee, Integer, EnterpriseEmployeeDo>
        implements EnterpriseEmployeeService {

    @Autowired
    private EnterpriseEmployeeMapper enterpriseEmployeeMapper;

    @Override
    protected BasicMapper<EnterpriseEmployee, Integer, EnterpriseEmployeeDo> getBasicMapper() {
        return enterpriseEmployeeMapper;
    }
}

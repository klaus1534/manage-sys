package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.EnterpriseEmployee;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import org.springframework.stereotype.Repository;

@Repository
public interface EnterpriseEmployeeMapper extends BasicMapper<EnterpriseEmployee, Integer, EnterpriseEmployeeDo> {
}
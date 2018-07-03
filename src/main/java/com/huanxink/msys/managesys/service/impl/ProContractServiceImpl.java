package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProContractMapper;
import com.huanxink.msys.managesys.model.ProContract;
import com.huanxink.msys.managesys.model.dto.ProContractDo;
import com.huanxink.msys.managesys.service.ProContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 15:12
 */
@Service
public class ProContractServiceImpl extends BasicServiceImpl<ProContract, Integer, ProContractDo>
        implements ProContractService {

    @Autowired
    private ProContractMapper proContractMapper;

    @Override
    protected BasicMapper<ProContract, Integer, ProContractDo> getBasicMapper() {
        return proContractMapper;
    }
}

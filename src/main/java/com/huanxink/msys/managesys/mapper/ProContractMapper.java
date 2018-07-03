package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.ProContract;
import com.huanxink.msys.managesys.model.dto.ProContractDo;
import org.springframework.stereotype.Repository;

@Repository
public interface ProContractMapper extends BasicMapper<ProContract, Integer, ProContractDo> {
}
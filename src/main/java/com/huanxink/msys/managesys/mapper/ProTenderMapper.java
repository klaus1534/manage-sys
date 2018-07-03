package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.ProTender;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ProTenderMapper extends BasicMapper<ProTender, Integer, ProTenderDo> {

    List<ProTenderDo> queryPageList(Map param);
}
package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProBuildMapper;
import com.huanxink.msys.managesys.model.ProBuild;
import com.huanxink.msys.managesys.model.dto.ProBuildDo;
import com.huanxink.msys.managesys.service.ProBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class ProBuildServiceImpl extends BasicServiceImpl<ProBuild, Integer, ProBuildDo>
        implements ProBuildService {

    @Autowired
    private ProBuildMapper proBuildMapper;
    @Override
    protected BasicMapper<ProBuild, Integer, ProBuildDo> getBasicMapper() {
        return proBuildMapper;
    }
}

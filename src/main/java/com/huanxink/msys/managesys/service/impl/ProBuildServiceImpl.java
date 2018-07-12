package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProBuildMapper;
import com.huanxink.msys.managesys.model.ProBuild;
import com.huanxink.msys.managesys.model.dto.ProBuildDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.ProBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public PageInfo<ProBuildDo> exportData(Map param, Integer pageno, Integer pageSize){
        PageHelper.startPage(pageno, pageSize);
        List<ProBuildDo> list = proBuildMapper.seacherJoinPageList(param);
        return new PageInfo<ProBuildDo>(list);
    }
}

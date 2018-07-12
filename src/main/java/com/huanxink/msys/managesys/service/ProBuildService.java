package com.huanxink.msys.managesys.service;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.model.ProBuild;
import com.huanxink.msys.managesys.model.dto.ProBuildDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;

import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:36
 */
public interface ProBuildService extends BasicService<ProBuild, Integer, ProBuildDo> {
    PageInfo<ProBuildDo> exportData(Map param, Integer pageno, Integer pageSize);
}

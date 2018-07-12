package com.huanxink.msys.managesys.service;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.model.ProCompleted;
import com.huanxink.msys.managesys.model.dto.ProCompletedDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;

import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:36
 */
public interface ProCompletedService extends BasicService<ProCompleted, Integer, ProCompletedDo> {
    PageInfo<ProCompletedDo> exportData(Map param, Integer pageno, Integer pageSize);
}

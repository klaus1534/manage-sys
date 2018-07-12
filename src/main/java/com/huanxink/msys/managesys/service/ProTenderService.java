package com.huanxink.msys.managesys.service;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.model.ProTender;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;

import java.util.Map;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 14:36
 */
public interface ProTenderService extends BasicService<ProTender, Integer, ProTenderDo> {

    PageInfo<ProTenderDo> queryPage(Map param, Integer pageno, Integer pageSize);

    PageInfo<ProTenderDo> exportData(Map param, Integer pageno, Integer pageSize);

}

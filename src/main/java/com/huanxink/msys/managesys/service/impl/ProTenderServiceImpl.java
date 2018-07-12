package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProTenderMapper;
import com.huanxink.msys.managesys.model.ProTender;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.ProTenderService;
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
public class ProTenderServiceImpl extends BasicServiceImpl<ProTender, Integer, ProTenderDo>
        implements ProTenderService {

    @Autowired
    private ProTenderMapper proTenderMapper;

    @Override
    protected BasicMapper<ProTender, Integer, ProTenderDo> getBasicMapper() {
        return proTenderMapper;
    }


    @Override
    public PageInfo<ProTenderDo> queryPage(Map param, Integer pageno, Integer pageSize) {
        PageHelper.startPage(pageno, pageSize);
        List<ProTenderDo> list = proTenderMapper.queryPageList(param);
        return new PageInfo<ProTenderDo>(list);
    }
    @Override
    public PageInfo<ProTenderDo> exportData(Map param, Integer pageno, Integer pageSize){
        PageHelper.startPage(pageno, pageSize);
        List<ProTenderDo> list = proTenderMapper.seacherJoinPageList(param);
        return new PageInfo<ProTenderDo>(list);
    }

}

package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProCompletedMapper;
import com.huanxink.msys.managesys.model.ProCompleted;
import com.huanxink.msys.managesys.model.dto.ProCompletedDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.ProCompletedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class ProCompletedServiceImpl extends BasicServiceImpl<ProCompleted, Integer, ProCompletedDo>
        implements ProCompletedService {

    @Autowired
    private ProCompletedMapper proCompletedMapper;
    @Override
    protected BasicMapper<ProCompleted, Integer, ProCompletedDo> getBasicMapper() {
        return proCompletedMapper;
    }

    @Override
    public PageInfo<ProCompletedDo> exportData(Map param, Integer pageno, Integer pageSize){
        PageHelper.startPage(pageno, pageSize);
        List<ProCompletedDo> list = proCompletedMapper.seacherJoinPageList(param);
        return new PageInfo<ProCompletedDo>(list);
    }

}

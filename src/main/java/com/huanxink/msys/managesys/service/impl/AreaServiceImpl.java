package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.AreaMapper;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.model.Area;
import com.huanxink.msys.managesys.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:43
 */
@Service
public class AreaServiceImpl extends BasicServiceImpl<Area, Integer, Area>
        implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    protected BasicMapper<Area, Integer, Area> getBasicMapper() {
        return areaMapper;
    }
}

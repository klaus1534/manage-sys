package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProvinceMapper;
import com.huanxink.msys.managesys.model.Province;
import com.huanxink.msys.managesys.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:45
 */
@Service
public class ProvinceServiceImpl extends BasicServiceImpl<Province, Integer, Province>
        implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    protected BasicMapper<Province, Integer, Province> getBasicMapper() {
        return provinceMapper;
    }
}

package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.CityMapper;
import com.huanxink.msys.managesys.model.City;
import com.huanxink.msys.managesys.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 14:43
 */
@Service
public class CityServiceImpl extends BasicServiceImpl<City, Integer, City>
        implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
    protected BasicMapper<City, Integer, City> getBasicMapper() {
        return cityMapper;
    }
}

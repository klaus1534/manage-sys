package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ManageSysMenuMapper;
import com.huanxink.msys.managesys.model.ManageSysMenu;
import com.huanxink.msys.managesys.service.ManageSysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/11 13:58
 */
@Service
public class ManageSysMenuServiceImpl extends BasicServiceImpl<ManageSysMenu, Integer, ManageSysMenu>
        implements ManageSysMenuService {

    @Autowired
    private ManageSysMenuMapper manageSysMenuMapper;

    @Override
    protected BasicMapper<ManageSysMenu, Integer, ManageSysMenu> getBasicMapper() {
        return manageSysMenuMapper;
    }

    @Override
    public List<ManageSysMenu> searchList(Map map) {
        return this.manageSysMenuMapper.seacherPageList(map);
    }
}

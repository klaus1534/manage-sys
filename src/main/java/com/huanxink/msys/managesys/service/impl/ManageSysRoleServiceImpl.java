package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ManageSysRoleMapper;
import com.huanxink.msys.managesys.model.ManageSysRole;
import com.huanxink.msys.managesys.service.ManageSysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/8 15:09
 */
@Service
public class ManageSysRoleServiceImpl extends BasicServiceImpl<ManageSysRole, Integer, ManageSysRole> implements ManageSysRoleService {

    @Autowired
    private ManageSysRoleMapper manageSysRoleMapper;
    @Override
    protected BasicMapper<ManageSysRole, Integer, ManageSysRole> getBasicMapper() {
        return this.manageSysRoleMapper;
    }
}

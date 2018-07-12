package com.huanxink.msys.managesys.service;

import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.model.dto.ManageSysUserDo;

import java.util.List;
import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/8 15:06
 */
public interface ManageSysUserService extends BasicService<ManageSysUser, Integer, ManageSysUser> {
    List<ManageSysUser> seacherList(Map param);

    ManageSysUserDo updateByDo(ManageSysUserDo manageSysUserDo);
}

package com.huanxink.msys.managesys.mapper;

import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.model.dto.ManageSysUserDo;
import org.springframework.stereotype.Repository;

@Repository
public interface ManageSysUserMapper extends BasicMapper<ManageSysUser, Integer, ManageSysUser> {

    int updateByDo(ManageSysUserDo manageSysUserDo);
}
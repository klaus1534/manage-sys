package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.model.ManageSysUser;
import lombok.Data;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/15 14:56
 */
@Data
public class ManageSysUserDo extends ManageSysUser {

    private Integer[] roles;
}

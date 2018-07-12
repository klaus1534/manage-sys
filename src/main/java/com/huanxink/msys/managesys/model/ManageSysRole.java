package com.huanxink.msys.managesys.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import java.util.Set;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/7 21:43
 */
@Data
public class ManageSysRole extends BasicEnity implements GrantedAuthority {

    private String role;

    private String roleName;

    private Set<ManageSysUser> users;

    @Override
    public String getAuthority() {
        return role;
    }
}

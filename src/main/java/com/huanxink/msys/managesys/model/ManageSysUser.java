package com.huanxink.msys.managesys.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;
import java.util.Set;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/7 16:11
 */
@Data
public class ManageSysUser extends BasicEnity implements UserDetails {

    private String username;
    private String password;
    private String email;
    private boolean enabled;
    private boolean locked;
    private Date lastPwdUpdate;

    private Set<ManageSysRole> roleSet;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roleSet;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

}

package com.huanxink.msys.managesys.config;

import com.google.common.collect.ImmutableMap;
import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.service.ManageSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/7 15:59
 */
public class ManageSysUserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private ManageSysUserService sysUsersService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (StringUtils.isEmpty(username)) {
            throw new UsernameNotFoundException(String.format("%s username is not found", username));
        }
        List<ManageSysUser> list = this.sysUsersService.seacherList(ImmutableMap.of("username", username));
        if (list == null || list.size() == 0) {
            throw new UsernameNotFoundException(String.format("%s username is not found", username));
        }
        ManageSysUser manageSysUser = list.get(0);
        return manageSysUser;
    }
}

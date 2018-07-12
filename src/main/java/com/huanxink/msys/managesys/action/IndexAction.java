package com.huanxink.msys.managesys.action;

import com.google.common.collect.ImmutableMap;
import com.huanxink.msys.managesys.model.ManageSysMenu;
import com.huanxink.msys.managesys.model.ManageSysRole;
import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.model.constants.ManageSysConstants;
import com.huanxink.msys.managesys.service.ManageSysMenuService;
import com.huanxink.msys.managesys.utils.DateHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/5 20:49
 */
@Slf4j
@Controller
public class IndexAction {

    @Autowired
    private ManageSysMenuService manageSysMenuService;

    @GetMapping("/")
    public String index(ModelMap modelMap) {
        ManageSysUser manageSysUser = (ManageSysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Set<ManageSysRole> roleSet = manageSysUser.getRoleSet();
        if (roleSet == null || roleSet.isEmpty()) {
            return "index";
        }
        Set<String> roleKeySet = roleSet.stream().map(ManageSysRole::getRole).collect(Collectors.toSet());
        List<ManageSysMenu> rootMenu = manageSysMenuService.searchList(ImmutableMap.of("rootMenu", "ROOT"));
        List<ManageSysMenu> targetMenu = null;
        // admin 显示所有菜单
        if (roleKeySet.contains(ManageSysConstants.ADMIN_ROLE_KEY)) {
            targetMenu = rootMenu.stream().map(item -> {
                item.setSubMenuList(manageSysMenuService.searchList(
                        ImmutableMap.of("parentMenu", item.getId())));
                return item;
            }).filter(item -> item.getSubMenuList() != null && !item.getSubMenuList().isEmpty()).collect(Collectors.toList());
        } else {
            //显示部分菜单
            targetMenu = rootMenu.stream().map(item -> {
                item.setSubMenuList(manageSysMenuService.searchList(
                        ImmutableMap.of("parentMenu", item.getId(),
                                "menuRoleIn", roleKeySet)));
                return item;
            }).filter(item -> item.getSubMenuList() != null && !item.getSubMenuList().isEmpty()).collect(Collectors.toList());
        }
        modelMap.put("menuList", targetMenu);
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/bulletin")
    public String bulletin(ModelMap modelMap) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        modelMap.put("userDetails", userDetails);
        modelMap.put("currentTime", DateHelper.convertDateIntoYYYYMMDD_HHMMStr(new Date()));
        return "error/bulletin";
    }

    @GetMapping("/error/todo")
    public String todoPage() {
        return "error/todo";
    }

    @GetMapping(ManageSysConstants.BAD_REQ_URI)
    public String badReqErrPage() {
        return "error/400";
    }

    @GetMapping(ManageSysConstants.NOT_FOUND_URI)
    public String notFoundErrPage() {
        return "error/404";
    }

    @GetMapping(ManageSysConstants.ACCESS_DENY_URI)
    public String accessDenyErrPage() {
        return "error/403";
    }

    @GetMapping(ManageSysConstants.INTERNAL_ERROR_URI)
    public String internalErrPage() {
        return "error/500";
    }

}

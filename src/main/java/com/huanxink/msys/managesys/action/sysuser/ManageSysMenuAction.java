package com.huanxink.msys.managesys.action.sysuser;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.huanxink.msys.managesys.action.BasicAction;
import com.huanxink.msys.managesys.model.ManageSysMenu;
import com.huanxink.msys.managesys.model.ManageSysRole;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.ManageSysMenuService;
import com.huanxink.msys.managesys.service.ManageSysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/11 13:42
 */
@Controller
@RequestMapping("/sys/menu/")
public class ManageSysMenuAction extends BasicAction<ManageSysMenu, Integer> {

    private static final String ROOT_PAGE_PATH = "sys/menu/";

    @Autowired
    private ManageSysMenuService manageSysMenuService;
    @Autowired
    private ManageSysRoleService manageSysRoleService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(manageSysMenuService)
                .conretePath(ROOT_PAGE_PATH)
                .build();
    }

    @Override
    protected String listUrl() {
        return "list";
    }

    @GetMapping("list")
    @Override
    public String list(@RequestParam Map param,
                       @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                       @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                       ModelMap modelMap) {

        List<ManageSysMenu> rootMenu = manageSysMenuService.searchList(ImmutableMap.of("rootMenu", "ROOT"));
        List<ManageSysMenu> targetMenu = rootMenu.stream().map(item -> {
            item.setSubMenuList(manageSysMenuService.searchList(
                    ImmutableMap.of("parentMenu", item.getId())));
            return item;
        }).collect(Collectors.toList());
        modelMap.put("menuList", targetMenu);
        PageInfo<ManageSysRole> rolePageInfo = this.manageSysRoleService.secherPage(Maps.newHashMap(), 0, Integer.MAX_VALUE);
        modelMap.put("roleList", rolePageInfo.getList());
        return ROOT_PAGE_PATH + "list";

    }
}

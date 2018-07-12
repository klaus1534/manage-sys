package com.huanxink.msys.managesys.action.sysuser;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.huanxink.msys.managesys.action.BasicAction;
import com.huanxink.msys.managesys.model.ManageSysRole;
import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.ManageSysUserDo;
import com.huanxink.msys.managesys.service.ManageSysRoleService;
import com.huanxink.msys.managesys.service.ManageSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/8 15:04
 */
@Controller
@RequestMapping("/sys/user")
public class ManageSysUserAction extends BasicAction<ManageSysUser, Integer> {

    private final static String ROOT_PAGE_PATH = "sys/user/";

    @Autowired
    private ManageSysUserService manageSysUserService;

    @Autowired
    private ManageSysRoleService manageSysRoleService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.manageSysUserService)
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
        log.info("request list page param: {}", param.toString());
        PageInfo pageInfo = manageSysUserService.secherJoinPage(param, pageno, pageSize);
        modelMap.put("pageInfo", pageInfo);
        PageInfo<ManageSysRole> rolePageInfo = this.manageSysRoleService.secherPage(Maps.newHashMap(), 0, Integer.MAX_VALUE);
        modelMap.put("roleList", rolePageInfo.getList());
        String pagePath = ROOT_PAGE_PATH + "list";
        log.info("response list page path: {}", pagePath);
        return pagePath;
    }

    @PostMapping("updatedo")
    public String updateEntity(ManageSysUserDo entity) {
        entity.setEnabled(true);
        this.manageSysUserService.updateByDo(entity);
        return "redirect:" + listUrl();
    }
}

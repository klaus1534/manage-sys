package com.huanxink.msys.managesys.action.sysuser;

import com.huanxink.msys.managesys.action.BasicAction;
import com.huanxink.msys.managesys.model.ManageSysRole;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.ManageSysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/8 15:04
 */
@Controller
@RequestMapping("/sys/role/")
public class ManageSysRoleAction extends BasicAction<ManageSysRole, Integer> {

    private final static String ROOT_PAGE_PATH = "sys/role/";

    @Autowired
    private ManageSysRoleService manageSysRoleService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.manageSysRoleService)
                .conretePath(ROOT_PAGE_PATH)
                .build();
    }

    @Override
    protected String listUrl() {
        return "list";
    }
}

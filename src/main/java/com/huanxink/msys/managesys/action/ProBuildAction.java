package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.ProBuild;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.ProBuildService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 11:20
 */
@Slf4j
@Controller
@RequestMapping("/pro/build/")
public class ProBuildAction extends BasicAction<ProBuild, Integer> {

    private static final String PAGE_ROOT_PATH = "pro/build/";
    @Autowired
    private ProBuildService proBuildService;


    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.proBuildService)
                .conretePath(PAGE_ROOT_PATH)
                .build();
    }

    @Override
    protected String listUrl() {
        return "join/list";
    }

    @Override
    @GetMapping("join/list")
    public String joinList(@RequestParam Map param,
                           @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                           @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                           ModelMap modelMap) {
        return super.extraEnterpriseList(param, pageno, pageSize, modelMap);
    }
}

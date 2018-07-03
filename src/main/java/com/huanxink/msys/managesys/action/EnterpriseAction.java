package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.Enterprise;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.EnterpriseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 11:20
 */
@Slf4j
@Controller
@RequestMapping("/enterprise/")
public class EnterpriseAction extends BasicAction<Enterprise, Integer> {

    private static final String PAGE_ROOT_PATH = "enterprise/";
    @Autowired
    private EnterpriseService enterpriseService;


    @Override
    protected String listUrl() {
        return "list";
    }
    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.enterpriseService)
                .conretePath(PAGE_ROOT_PATH)
                .build();
    }
}

package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.EnterpriseQualificationService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/6 9:48
 */
@Controller
@RequestMapping("/enterprise/qualification/")
public class EnterpriseQualificationAction extends BasicAction<EnterpriseQualification, Integer> {

    private final static String PAGE_ROOT_PATH = "enterprise/qualification/";

    @Autowired
    private EnterpriseQualificationService enterpriseQualificationService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                    .conreteService(this.enterpriseQualificationService)
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

    @GetMapping("join/exportData")
    public void exportData(@RequestParam String companyName,String qualificationType,String qLevel, HttpServletResponse response) throws IOException {
        super.exportData(companyName,qualificationType,qLevel,response);
    }

}

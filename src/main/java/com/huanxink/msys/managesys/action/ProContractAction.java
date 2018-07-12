package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.ProContract;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.ProContractService;
import lombok.extern.slf4j.Slf4j;
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
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 11:20
 */
@Slf4j
@Controller
@RequestMapping("/pro/contract/")
public class ProContractAction extends BasicAction<ProContract, Integer> {

    private static final String PAGE_ROOT_PATH = "pro/contract/";
    @Autowired
    private ProContractService proContractService;



    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.proContractService)
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
    public void exportData(@RequestParam String companyName,String proName,String proNo,String proContractNo,String contractAmountStart,String contractAmountEnd,String contractSignDateStart,String contractSignDateEnd, HttpServletResponse response) throws IOException {
        this.proContractService.exportData(companyName,proName,proNo,proContractNo,contractAmountStart,contractAmountEnd,contractSignDateStart,contractSignDateEnd,response);
    }

}

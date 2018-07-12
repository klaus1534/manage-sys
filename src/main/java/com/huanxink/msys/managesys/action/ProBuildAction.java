package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.ProBuild;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.ProBuildDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.ProBuildService;
import com.huanxink.msys.managesys.utils.DateHelper;
import com.huanxink.msys.managesys.utils.exl.ExportExcel;
import com.huanxink.msys.managesys.utils.exl.ExportExcelUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    @GetMapping("/join/exportData")
    public void exportData(@RequestParam Map param, HttpServletResponse response) throws Exception {
        List<ProBuildDo> list = this.proBuildService
                .exportData(param, 0, Integer.MAX_VALUE)
                .getList();
        if (list == null || list.size() == 0) {
            response.setCharacterEncoding("UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<h1>没有符合条件的数据, 因此不导出！</h1>");
            printWriter.flush();
        } else {
            ExportExcel exportExcel = new ExportExcel("企业业绩数据",
                    new String[]{
                            "企业名称",
                            "项目名称",
                            "项目编号",
                            "施工许可编号",
                            "合同金额",
                            "合同工期",
                            "建设规模",
                            "施工面积平方米",
                            "施工单位",
                            "项目负责人"
                    }, list.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
    }

    private Object[] convertArray(ProBuildDo proBuildDo) {
        Object[] obj = new Object[10];
        obj[0] =proBuildDo.getProEnterpriseName();
        obj[1] = proBuildDo.getProjectName();
        obj[2] = proBuildDo.getProjectNo();
        obj[3] = proBuildDo.getProjectBuildNo();
        obj[4] = proBuildDo.getProjectContractAmount();
        obj[5] = proBuildDo.getProjectContractDuration();
        obj[6] = proBuildDo.getBuildScale();
        obj[7] = proBuildDo.getBuildArea();
        obj[8] = proBuildDo.getBuildEnterpriseName();
        obj[9] = proBuildDo.getBuildMan();
        return obj;
    }
}

package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.ProCompleted;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.ProBuildDo;
import com.huanxink.msys.managesys.model.dto.ProCompletedDo;
import com.huanxink.msys.managesys.service.ProCompletedService;
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
@RequestMapping("/pro/completed/")
public class ProCompletedAction extends BasicAction<ProCompleted, Integer> {

    private static final String PAGE_ROOT_PATH = "pro/completed/";
    @Autowired
    private ProCompletedService proCompletedService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.proCompletedService)
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
        List<ProCompletedDo> list = this.proCompletedService
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
                            "竣工编号",
                            "实际造价万元",
                            "实际面积平方米",
                            "实际建设规模",
                            "实际开工日期",
                            "实际竣工日期"
                    }, list.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
    }

    private Object[] convertArray(ProCompletedDo proCompletedDo) {
        Object[] obj = new Object[10];
        obj[0] =proCompletedDo.getProEnterpriseName();
        obj[1] = proCompletedDo.getProjectName();
        obj[2] = proCompletedDo.getProjectNo();
        obj[3] = proCompletedDo.getProjectCompletedNo();
        obj[4] = proCompletedDo.getRealBuildAmount();
        obj[5] =proCompletedDo.getRealBuildArea();
        obj[6] = proCompletedDo.getRealBuildScale();
        obj[7] =DateHelper.convertDateIntoYYYYMMDDStr(proCompletedDo.getRealStartTime()) ;
        obj[8] =DateHelper.convertDateIntoYYYYMMDDStr(proCompletedDo.getRealCompletedTime()) ;

        return obj;
    }
}

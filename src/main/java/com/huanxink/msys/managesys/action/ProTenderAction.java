package com.huanxink.msys.managesys.action;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.model.ProTender;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.ProTenderService;
import com.huanxink.msys.managesys.utils.DateHelper;
import com.huanxink.msys.managesys.utils.exl.ExportExcel;
import com.huanxink.msys.managesys.utils.exl.ExportExcelUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/5 11:20
 */
@Slf4j
@Controller
@RequestMapping("/pro/tender/")
public class ProTenderAction extends BasicAction<ProTender, Integer> {

    private static final String PAGE_ROOT_PATH = "pro/tender/";
    @Autowired
    private ProTenderService proTenderService;


    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.proTenderService)
                .conretePath(PAGE_ROOT_PATH)
                .build();
    }

    @Override
    protected String listUrl() {
        return "join/list";
    }

    @Override
    @GetMapping("list")
    public String list(@RequestParam Map param,
                       @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                       @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                       ModelMap modelMap) {
        boolean couldQuery = false;
        if (param != null) {
            for (Object key : param.keySet()) {
                if (!StringUtils.isEmpty(param.get(key))) {
                    couldQuery = true;
                    break;
                }
            }
        }
        modelMap.putAll(param);
        if (couldQuery) {
            PageInfo pageInfo = proTenderService.queryPage(param, pageno, pageSize);
            modelMap.put("pageInfo", pageInfo);
        }
        return PAGE_ROOT_PATH + "list";
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
        List<ProTenderDo> list = this.proTenderService
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
                    "招投标编号",
                    "招标类型",
                    "中标时间",
                    "建设规模",
                    "中标金额",
                    "面积平方米",
                    "项目负责人"
                    }, list.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
    }

    private Object[] convertArray(ProTenderDo proTenderDo) {
        Object[] obj = new Object[10];
        obj[0] = proTenderDo.getProEnterpriseName();
        obj[1] = proTenderDo.getProjectName();
        obj[2] = proTenderDo.getProjectNo();
        obj[3] = proTenderDo.getProjectTenderNo();
        obj[4] = proTenderDo.getProjectType();
        obj[5] = DateHelper.convertDateIntoYYYYMMDDStr(proTenderDo.getTenderShootDate());
        obj[6] = proTenderDo.getBuildScale();
        obj[7] = proTenderDo.getTenderAmount();
        obj[8] = proTenderDo.getTenderBuildArea();
        obj[9] = proTenderDo.getTenderMan();
        return obj;
    }
}

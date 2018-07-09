package com.huanxink.msys.managesys.action;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.huanxink.msys.managesys.model.Enterprise;
import com.huanxink.msys.managesys.model.EnterpriseQualification;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import com.huanxink.msys.managesys.model.dto.ProTenderDo;
import com.huanxink.msys.managesys.service.EnterpriseQualificationService;
import com.huanxink.msys.managesys.service.EnterpriseService;
import com.huanxink.msys.managesys.utils.DateHelper;
import com.huanxink.msys.managesys.utils.exl.ExportExcel;
import com.huanxink.msys.managesys.utils.exl.ExportExcelUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 11:19
 */
public abstract class BasicAction<T, ID> {

    protected final Logger log = LoggerFactory.getLogger(this.getClass());

    protected final static String PAGE_NUM = "pageNo";
    protected final static String PAGE_SIZE = "pageSize";
    protected final static String DEFAULT_PAGE_SIZE = "20";
    protected final static String DEFAULT_PAGE_NUM = "0";

    protected abstract CommonActionFunctionDo getConcreteFunction();

    /**
     * 获取List页面的URL
     * 为空默认为 join/list
     * 一般为list
     *
     * @return
     */
    protected abstract String listUrl();

    @Autowired
    private EnterpriseService enterpriseService;
    @Autowired
    private EnterpriseQualificationService enterpriseQualificationService;

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        CustomDateEditor custDateEditor = new CustomDateEditor(DateHelper.DF_YYYY_MM_DD_FORMAT, true);
        binder.registerCustomEditor(Date.class, custDateEditor);
    }

    @GetMapping("list")
    public String list(@RequestParam Map param,
                       @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                       @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                       ModelMap modelMap) {
        log.info("request list page param: {}", param.toString());
        modelMap.putAll(param);
        CommonActionFunctionDo concreteData = getConcreteFunction();
        PageInfo pageInfo = concreteData.getConreteService().secherPage(param, pageno, pageSize);
        modelMap.put("pageInfo", pageInfo);
        String pagePath = concreteData.getConretePath() + "list";
        log.info("response list page path: {}", pagePath);
        return pagePath;
    }

    @GetMapping("join/list")
    public String joinList(@RequestParam Map param,
                           @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                           @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                           ModelMap modelMap) {
        log.info("request list page param: {}", param.toString());
        modelMap.putAll(param);
        CommonActionFunctionDo concreteData = getConcreteFunction();
        PageInfo pageInfo = concreteData.getConreteService().secherJoinPage(param, pageno, pageSize);
        modelMap.put("pageInfo", pageInfo);
        String pagePath = concreteData.getConretePath() + "joinlist";
        log.info("response list page path: {}", pagePath);
        return pagePath;
    }

    @PostMapping("create")
    public String createEntity(T entity) {
        getConcreteFunction().getConreteService().create(entity);
        return "redirect:" + listUrl();
    }

    @PostMapping("update")
    public String updateEntity(T entity) {
        getConcreteFunction().getConreteService().update(entity);
        return "redirect:" + listUrl();
    }

    @GetMapping("deleted")
    public String deleteEntity(@RequestParam ID id) {
        getConcreteFunction().getConreteService().delete(id);
        return "redirect:" + listUrl();
    }

    protected List<Enterprise> getEnterpriseList() {
        PageInfo<Enterprise> enterprisePage = this.enterpriseService.secherPage(Maps.newHashMap(), 0, Integer.MAX_VALUE);
        return enterprisePage.getList();
    }

    protected String extraEnterpriseList(Map param, Integer pageno, Integer pageSize,
                                         ModelMap modelMap) {
        log.info("request list page param: {}", param.toString());
        modelMap.putAll(param);
        CommonActionFunctionDo concreteFunction = getConcreteFunction();
        PageInfo pageInfo = concreteFunction.getConreteService().secherJoinPage(param, pageno, pageSize);
        modelMap.put("pageInfo", pageInfo);
        modelMap.put("enterpriseList", getEnterpriseList());
        modelMap.put("qLevelList", this.enterpriseQualificationService.secherLevel(param));//等级枚举值
        String pagePath = concreteFunction.getConretePath() + "joinlist";
        log.info("response list page path: {}", pagePath);
        return pagePath;
    }

    /**
     * 导出数据到excel
     *
     * @param companyName
     * @param qualificationType
     * @param qLevel
     * @return
     */
    protected void exportData(String companyName, String qualificationType, String qLevel, HttpServletResponse response) throws IOException {
        log.info("export data to excel:begin");
        CommonActionFunctionDo concreteFunction = getConcreteFunction();
        Map param = new HashMap<String,String>();
        param.put("companyName",companyName);
        param.put("qualificationType",qualificationType);
        param.put("qLevel",qLevel);
        PageInfo pageInfo = concreteFunction.getConreteService().secherJoinPage(param, 0, 0);
       List<EnterpriseQualificationDo> enterpriseQFDoList= pageInfo.getList();
        if (enterpriseQFDoList == null || enterpriseQFDoList.size() == 0) {
            response.setCharacterEncoding("UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<h1>没有符合条件的数据, 因此不导出！</h1>");
            printWriter.flush();
        } else {
            ExportExcel exportExcel = new ExportExcel("企业业绩数据",
                    new String[]{
                            "企业名称",
                            "项目编号",
                            "资质类别",
                            "等级",
                            "发证日期",
                            "有效日期"
                    }, enterpriseQFDoList.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
        log.info("export data to excel:end");

    }

   private Object[] convertArray(EnterpriseQualificationDo enterpriseQFDo) {
        Object[] obj = new Object[10];
        obj[0] =enterpriseQFDo.getEnterpriseName();
        obj[1] = enterpriseQFDo.getQualificationNo();
        obj[2] = enterpriseQFDo.getQualificationName();
        obj[3] = enterpriseQFDo.getQualificationLevel();
        obj[4] = DateHelper.convertDateIntoYYYYMMDDStr(enterpriseQFDo.getIssueTime());
        obj[5] = DateHelper.convertDateIntoYYYYMMDDStr(enterpriseQFDo.getValidTime());
        return obj;
    }

}

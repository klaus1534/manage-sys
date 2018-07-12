package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.EnterpriseEmployeeMapper;
import com.huanxink.msys.managesys.model.EnterpriseEmployee;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import com.huanxink.msys.managesys.service.BasicService;
import com.huanxink.msys.managesys.service.EnterpriseEmployeeService;
import com.huanxink.msys.managesys.utils.DateHelper;
import com.huanxink.msys.managesys.utils.exl.ExportExcel;
import com.huanxink.msys.managesys.utils.exl.ExportExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 14:44
 */
@Service
public class EnterpriseEmployeeServiceImpl extends BasicServiceImpl<EnterpriseEmployee, Integer, EnterpriseEmployeeDo>
        implements EnterpriseEmployeeService {

    @Autowired
    private EnterpriseEmployeeMapper enterpriseEmployeeMapper;

    @Override
    protected BasicMapper<EnterpriseEmployee, Integer, EnterpriseEmployeeDo> getBasicMapper() {
        return enterpriseEmployeeMapper;
    }

    /**
     * 导出数据到excel
     * @param companyName
     * @param employeeName
     * @param employeeType
     * @param response
     * @throws IOException
     */
    public void exportData(String companyName, String employeeName,String employeeType, HttpServletResponse response) throws IOException {
        log.info("export data to excel:begin");
       // CommonActionFunctionDo concreteFunction = getConcreteFunction();
        Map param = new HashMap<String,String>();
        param.put("companyName",companyName);
        param.put("employeeName",employeeName);
        param.put("employeeType",employeeType);
        PageInfo pageInfo =super.secherJoinPage(param, 0, 0);
        List<EnterpriseEmployeeDo> enterpriseEmployees= pageInfo.getList();
        if (enterpriseEmployees == null || enterpriseEmployees.size() == 0) {
            response.setCharacterEncoding("UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<h1>没有符合条件的数据, 因此不导出！</h1>");
            printWriter.flush();
        } else {
            ExportExcel exportExcel = new ExportExcel("企业业绩数据",
                    new String[]{
                            "企业名称",
                            "姓名",
                            "性别",
                            "证件号码",
                            "人员类别",
                            "证书编号"
                    }, enterpriseEmployees.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
        log.info("export data to excel:end");

    }

    private Object[] convertArray(EnterpriseEmployeeDo employee) {
        Object[] obj = new Object[10];
        obj[0] =employee.getEnterpriseName();
        obj[1] = employee.getEmpName();
        obj[2] = employee.getEmpSex();
        obj[3] = employee.getEmpIdno();
        obj[4] = employee.getEmpType();
        obj[5] = employee.getEmpQulificationNo();
        return obj;
    }

}

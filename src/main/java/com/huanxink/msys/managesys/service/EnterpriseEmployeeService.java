package com.huanxink.msys.managesys.service;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.model.EnterpriseEmployee;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import com.huanxink.msys.managesys.model.dto.EnterpriseQualificationDo;
import com.huanxink.msys.managesys.utils.DateHelper;
import com.huanxink.msys.managesys.utils.exl.ExportExcel;
import com.huanxink.msys.managesys.utils.exl.ExportExcelUtil;

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
 * @date 2018/6/10 14:36
 */
public interface EnterpriseEmployeeService extends BasicService<EnterpriseEmployee, Integer, EnterpriseEmployeeDo> {
    /**
     * 导出数据到excel
     * @param companyName
     * @param employeeName
     * @param employeeType
     * @param response
     * @throws IOException
     */
     void exportData(String companyName, String employeeName,String employeeType, HttpServletResponse response) throws IOException;


}

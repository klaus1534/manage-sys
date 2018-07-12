package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ProContractMapper;
import com.huanxink.msys.managesys.model.ProContract;
import com.huanxink.msys.managesys.model.dto.EnterpriseEmployeeDo;
import com.huanxink.msys.managesys.model.dto.ProContractDo;
import com.huanxink.msys.managesys.service.ProContractService;
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
 * @date 2018/6/10 15:12
 */
@Service
public class ProContractServiceImpl extends BasicServiceImpl<ProContract, Integer, ProContractDo>
        implements ProContractService {

    @Autowired
    private ProContractMapper proContractMapper;

    @Override
    protected BasicMapper<ProContract, Integer, ProContractDo> getBasicMapper() {
        return proContractMapper;
    }

    /**
     * 导出数据到excel
     * @param companyName
     * @param proName
     * @param proNo
     * @param proContractNo
     * @param contractAmountStart
     * @param contractAmountEnd
     * @param contractSignDateStart
     * @param contractSignDateEnd
     * @param response
     * @throws IOException
     */
    public void exportData(String companyName,String proName,String proNo,String proContractNo,String contractAmountStart,String contractAmountEnd,String contractSignDateStart,String contractSignDateEnd, HttpServletResponse response) throws IOException {
        log.info("export data to excel:begin");
        Map param = new HashMap<String,String>();
        param.put("companyName",companyName);
        param.put("proName",proName);
        param.put("proNo",proNo);
        param.put("proContractNo",proContractNo);
        param.put("contractAmountStart",contractAmountStart);
        param.put("contractAmountEnd",contractAmountEnd);
        param.put("contractSignDateStart",contractSignDateStart);
        param.put("contractSignDateEnd",contractSignDateEnd);

        PageInfo pageInfo =super.secherJoinPage(param, 0, 0);
        List<ProContractDo> proContractDos= pageInfo.getList();
        if (proContractDos == null || proContractDos.size() == 0) {
            response.setCharacterEncoding("UTF-8");
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<h1>没有符合条件的数据, 因此不导出！</h1>");
            printWriter.flush();
        } else {
            ExportExcel exportExcel = new ExportExcel("企业合同备案数据",
                    new String[]{
                            "企业名称",
                            "项目名称",
                            "项目编号",
                            "合同备案号",
                            "签订日期",
                            "建设规模",
                            "合同金额万元",
                            "承包单位名称"
                    }, proContractDos.stream().map(this::convertArray).collect(Collectors.toList()));
            String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
            String headStr = "attachment; filename=\"" + fileName + "\"";
            response.setContentType("APPLICATION/x-msdowload");
            response.setHeader("Content-Disposition", headStr);
            ExportExcelUtil.exportExc(exportExcel, response.getOutputStream());

        }
        log.info("export data to excel:end");

    }

    private Object[] convertArray(ProContractDo proContractDo) {
        Object[] obj = new Object[8];
        obj[0] =proContractDo.getProEnterpriseName() ;
        obj[1] = proContractDo.getProjectName();
        obj[2] = proContractDo.getProjectNo();
        obj[3] = proContractDo.getProjectContractNo();
        obj[4] = DateHelper.convertDateIntoYYYYMMDDStr(proContractDo.getContractSignTime());
        obj[5] = proContractDo.getContractBuildScale();
        obj[6] = proContractDo.getContractBuildAmount();
        obj[7] = proContractDo.getTenderEnterpriseName();

        return obj;
    }
}

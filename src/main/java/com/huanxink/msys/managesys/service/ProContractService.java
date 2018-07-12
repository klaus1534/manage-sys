package com.huanxink.msys.managesys.service;

import com.huanxink.msys.managesys.model.ProContract;
import com.huanxink.msys.managesys.model.dto.ProContractDo;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 15:11
 */
public interface ProContractService extends BasicService<ProContract, Integer, ProContractDo> {

    void exportData(String companyName,String proName,String proNo,String proContractNo,String contractAmountStart,String contractAmountEnd,String contractSignDateStart,String contractSignDateEnd, HttpServletResponse response) throws IOException;
}

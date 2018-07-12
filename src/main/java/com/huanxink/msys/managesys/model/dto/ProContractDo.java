package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.model.ProContract;
import lombok.Data;

/**
 * 企业基础资料
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 15:32
 */
@Data
public class ProContractDo extends ProContract {

    private String proEnterpriseName;

    private String tenderEnterpriseName;

}

package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.model.ProTender;
import lombok.Data;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/10 15:32
 */
@Data
public class ProTenderDo extends ProTender {

    private String proEnterpriseName;

    private String tenderEnterpriseName;
}

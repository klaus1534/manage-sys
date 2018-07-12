package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.model.ProBuild;
import lombok.Data;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/10 15:32
 */
@Data
public class ProBuildDo extends ProBuild {
    private String proEnterpriseName;

    private String buildEnterpriseName;
}

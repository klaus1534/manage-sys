package com.huanxink.msys.managesys.model.dto;

import com.huanxink.msys.managesys.service.BasicService;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 11:28
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommonActionFunctionDo {

    private BasicService conreteService;

    private String conretePath;
}

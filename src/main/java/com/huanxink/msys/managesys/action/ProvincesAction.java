package com.huanxink.msys.managesys.action;

import com.huanxink.msys.managesys.model.Province;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/6 15:58
 */
@Controller
@RequestMapping("/provinces/")
public class ProvincesAction extends BasicAction<Province, Integer> {

    @Autowired
    private ProvinceService provinceService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.provinceService)
                .conretePath("provinces/")
                .build();
    }

    @Override
    protected String listUrl() {
        return "list";
    }
}

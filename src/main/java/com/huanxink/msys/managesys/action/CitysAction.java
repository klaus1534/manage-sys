package com.huanxink.msys.managesys.action;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.huanxink.msys.managesys.model.City;
import com.huanxink.msys.managesys.model.Province;
import com.huanxink.msys.managesys.model.dto.CommonActionFunctionDo;
import com.huanxink.msys.managesys.service.CityService;
import com.huanxink.msys.managesys.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/6 15:57
 */
@Controller
@RequestMapping("/citys/")
public class CitysAction extends BasicAction<City, Integer> {

    private static final String ROOT_PAGE_PATH = "citys/";

    @Autowired
    private CityService cityService;
    @Autowired
    private ProvinceService provinceService;

    @Override
    protected CommonActionFunctionDo getConcreteFunction() {
        return CommonActionFunctionDo.builder()
                .conreteService(this.cityService)
                .conretePath(ROOT_PAGE_PATH)
                .build();
    }
    @Override
    protected String listUrl() {
        return "list";
    }
    @GetMapping("list")
    @Override
    public String list(@RequestParam Map param,
                       @RequestParam(value = PAGE_NUM, defaultValue = DEFAULT_PAGE_NUM) Integer pageno,
                       @RequestParam(value = PAGE_SIZE, defaultValue = DEFAULT_PAGE_SIZE) Integer pageSize,
                       ModelMap modelMap) {
        modelMap.putAll(param);
        PageInfo pageInfo = this.cityService.secherPage(param, pageno, pageSize);
        PageInfo<Province> provincePage = this.provinceService.secherPage(Maps.newHashMap(), 0, Integer.MAX_VALUE);

        modelMap.put("pageInfo", pageInfo);
        modelMap.put("provinceList", provincePage.getList());
        String pagePath = ROOT_PAGE_PATH + "list";
        log.info("response list page path: {}", pagePath);
        return pagePath;
    }


}

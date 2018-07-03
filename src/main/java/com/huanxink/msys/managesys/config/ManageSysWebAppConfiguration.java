package com.huanxink.msys.managesys.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/6 17:22
 */
@Configuration
public class ManageSysWebAppConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    private ReqLogInterceptor reqLogInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(reqLogInterceptor).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}

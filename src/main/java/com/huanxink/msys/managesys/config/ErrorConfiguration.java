package com.huanxink.msys.managesys.config;

import com.huanxink.msys.managesys.model.constants.ManageSysConstants;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

/**
 * 错误页面配置
 *
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/7 13:00
 */
@Configuration
public class ErrorConfiguration implements EmbeddedServletContainerCustomizer {

    @Override
    public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
        configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, ManageSysConstants.BAD_REQ_URI));
        configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, ManageSysConstants.ACCESS_DENY_URI));
        configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, ManageSysConstants.NOT_FOUND_URI));
        configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, ManageSysConstants.INTERNAL_ERROR_URI));
    }
}

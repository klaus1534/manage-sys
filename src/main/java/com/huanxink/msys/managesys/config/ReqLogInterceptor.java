package com.huanxink.msys.managesys.config;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/6 17:25
 */
@Slf4j
@Component
public class ReqLogInterceptor implements HandlerInterceptor {

    private final ThreadLocal<Long> threadLocal = new ThreadLocal<>();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("=====================================================");
        log.info("req url: {} port:{}", request.getRequestURI(), request.getServerPort());
        log.info("req param: {}", JSON.toJSONString(request.getParameterMap()));
        threadLocal.set(System.currentTimeMillis());
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Double deltaTime = (System.currentTimeMillis() - threadLocal.get())/1000d;
        log.info("completed req  time cost: {} s", deltaTime);
        log.info("=====================================================");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

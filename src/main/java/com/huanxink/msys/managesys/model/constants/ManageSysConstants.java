package com.huanxink.msys.managesys.model.constants;

import com.google.common.collect.Lists;
import com.huanxink.msys.managesys.model.Province;

import java.util.List;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/7 13:06
 */
public final class ManageSysConstants {

    public static final String BAD_REQ_URI = "/error/400";
    public static final String NOT_FOUND_URI = "/error/404";
    public static final String ACCESS_DENY_URI = "/error/403";
    public static final String INTERNAL_ERROR_URI = "/error/500";
    public static final String ADMIN_ROLE_KEY = "ROLE_ADMIN";

    public static final List<Province> address = Lists.newArrayList();

}

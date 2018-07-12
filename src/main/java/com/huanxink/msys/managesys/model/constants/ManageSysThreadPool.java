package com.huanxink.msys.managesys.model.constants;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/11 20:42
 */
public final class ManageSysThreadPool {

    private static ExecutorService COMMON_POOL = null;

    public static synchronized ExecutorService getCommonPool() {
        if (COMMON_POOL == null) {
            ThreadPoolExecutor poolExecutor = new ThreadPoolExecutor(20, 20, 60L,
                    TimeUnit.SECONDS, new LinkedBlockingDeque<>());
            poolExecutor.allowCoreThreadTimeOut(true);
            COMMON_POOL = poolExecutor;
        }
        return COMMON_POOL;
    }

}

package com.huanxink.msys.managesys.utils.exl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

/**
 * @author
 * @project manage-sys
 * @date 2018/6/6 16:28
 */
@Slf4j
public class TestExportExcelUtil {

    @Test
    public void testExportData() throws Exception {
        ExportExcel exportExcel = new ExportExcel("test excel file export",
                new String[]{
                        "姓名", "年齡"
                },
                Lists.newArrayList(
                        new Object[]{"allen", 12},
                        new Object[]{"bob", 123}
                ));
        ExportExcelUtil.exportExc(exportExcel,
                new FileOutputStream(new File("E:\\test.xls")));//\noahwm\cache
    }

    @Test
    public void testBuildMap() {
        Map temp = ImmutableMap.of("name", "test", "age", 12);
        log.info("the build temp map: {}", temp);
    }
}

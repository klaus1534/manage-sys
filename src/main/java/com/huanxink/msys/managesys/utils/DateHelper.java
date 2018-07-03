package com.huanxink.msys.managesys.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/6 20:44
 */
public final class DateHelper {

    public static final String DF_YYYY_MM_DD = "yyyy-MM-dd";

    private static final String DF_YYYY_MM_DD_HH = "yyyy-MM-dd hh:mm:ss";

    public static final String DF_YYYYMMDD_HHMMSS = "yyyyMMdd hh:mm:ss";

    public static final String DF_YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    public static final String DATE_DD = "dd";

    public static final String DF_MM = "MM";

    public static final String DF_YYYYMMDD = "yyyyMMdd";

    public static final DateFormat DF_YYYY_MM_DD_FORMAT = new SimpleDateFormat(DF_YYYY_MM_DD);

    public static String convertDateIntoYYYYMMDD_HHMMStr(Date date) {
        return convertDateIntoDisplayStr(date, DF_YYYY_MM_DD_HH_MM_SS);
    }

    public static String convertDateIntoYYYYMMDDStr(Date date) {
        return convertDateIntoDisplayStr(date, DF_YYYY_MM_DD);
    }

    public static String convertDateIntoDisplayStr(Date date, String format) {
        String dateStr = null;
        if (format == null) {
            format = DF_YYYY_MM_DD;
        }
        SimpleDateFormat dtFormater = new SimpleDateFormat();
        dtFormater.applyPattern(format);
        if (date != null) {
            dateStr = dtFormater.format(date);
        }
        return dateStr;
    }


}

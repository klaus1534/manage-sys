<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2018/7/4
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导出</title>
</head>
<body>
    <%@ page contentType="application/vnd.ms-excel" language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%@page import="com.huanxink.msys.managesys.service.ExportExcalService"%>
    <%@page import="java.io.OutputStream"%>
    <%@ page import="com.huanxink.msys.managesys.service.impl.ExportExcalServiceImpl" %>
    <%
       /* String czNum = request.getParameter("czNum");
        String czId = request.getParameter("czId");
        String czName = request.getParameter("czName");
        String beginIssue = request.getParameter("beginIssue");
        String endIssue = request.getParameter("endIssue");
        String pageNum = request.getParameter("pageNum");*/
        response.resetBuffer();
        response.setHeader("Content-Disposition", "attachment;filename="+ new String(czName.getBytes("UTF-8"), "iso8859-1")+".xls");//指定下载的文件名
        response.setContentType("application/vnd.ms-excel");
        try{
            ExportExcalService exportExcal = new ExportExcalServiceImpl();
            exportExcal.export(response.getOutputStream().toString());
        }catch(Exception ex){
            ex.printStackTrace();
        }

    %>

</body>
</html>

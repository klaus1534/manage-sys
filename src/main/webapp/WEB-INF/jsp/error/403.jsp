<%--
  Created by IntelliJ IDEA.
  User: Alen
  Date: 2016/12/12
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HTTP-403</title>
    <%@include file="../common/include.jsp" %>
    <link href="${ctx}/static/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">HTTP-403</h1>
    <div class="table-responsive">
        <div class="text-center">
            <p class="text-center">
                <a href="/bulletin">
                    <img src="${ctx}/static/images/sad-man.jpg"
                         class="img-responsive img-circle sad-man-icon" alt="a sad emoji">
                </a>
                <h2>禁止访问,权限不足. 请联系管理员开通权限!!!</h2>
            </p>
        </div>
    </div>
</div>
</body>
</html>
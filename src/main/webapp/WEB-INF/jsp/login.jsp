<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>企业管理系统</title>
    <%--set ctx var value--%>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="${ctx}/static/plugin/bootstrap/css/bootstrap.min.css">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" href="${ctx}/static/plugin/bootstrap/ext/ie10-viewport-bug-workaround.css" >
    <link rel="stylesheet" href="${ctx}/static/css/login.css" >
    <!-- JavaScript -->
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/plugin/bootstrap/js/bootstrap.min.js" ></script>
</head>

<body>
<div id="login-page">
  <div class="container">
    <form class="form-signin" id="loginForm" action="/login" method="post" >
    	<h2 class="form-signin-heading">请登录</h2>
    	<label for="j_username" class="sr-only">用户名</label>
        <input type="text" id="j_username" name='username' class="form-control" placeholder="用户名" autofocus>
        <label for="j_password" class="sr-only">密码</label>
        <input type="password" id="j_password" name='password' class="form-control" placeholder="密码">
        <c:if test="${error != null}">
            <div class="alert alert-warning alert-danger alert-dismissable" role="alert">
                <button type="button" class="close" data-dismisss="alert" aria-label="close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <strong>错误</strong> 用户名或密码错误, 请核对后重试.
            </div>
        </c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit"><i class="fa"></i>登  录</button>
    </form>
  </div>
</div>

</body>
</html>

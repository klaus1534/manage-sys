<%--
  Created by IntelliJ IDEA.
  User: fjj13103
  Date: 2018/6/5
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="${ctx}/static/plugin/accordion.js"></script>
<script>
    $(function(){
        $(".nav").accordion({
            //accordion: true,
            speed: 500,
            closedSign: '<i class="glyphicon glyphicon-chevron-right"></i>',
            openedSign: '<i class="glyphicon glyphicon-chevron-down"></i>'
        });
    });
</script>
<style>
    ul.nav ul {display: none;padding-left:0;list-style:none}
    ul.nav ul li{border-bottom:1px solid #eee;}
    ul.nav li a{color:#666;}
    ul.nav li a:hover {background-color:#428bca;color:white;}
    ul.nav ul li a { display: block;padding: 10px 10px 10px 30px;background-color: #fff;color:#333;text-decoration: none;}
    ul.nav ul li a:hover {background-color:#eff0f1;color:#666;}
    ul.nav ul ul li a {color:silver; padding-left: 40px;}
    ul.nav ul ul li a:hover { background-color:#D3CEB8; color:#675C7C;}
    ul.nav span{float:right;}
</style>

<ul class="nav nav-sidebar">

    <c:forEach items="${menuList}" var="menu">
        <li>
            <a href="${menu.menuPath}">${menu.menuName}</a>
            <ul>
                <c:forEach items="${menu.subMenuList}" var="submenu">
                    <li>
                        <a href="${submenu.menuPath}?menuIn=true" target="mainFrame">${submenu.menuName}</a>
                    </li>
                </c:forEach>
            </ul>
        </li>
    </c:forEach>

    <%--<li><a href="#">公告管理</a>
        <ul>
            <li><a href="${ctx}/error/todo" target="mainFrame">公告列表</a></li>
        </ul>
    </li>
    <li><a href="#">企业管理</a>
        <ul>
            <li><a href="${ctx}/enterprise/list" target="mainFrame">企业基础资料</a></li>
            <li><a href="${ctx}/enterprise/qualification/join/list" target="mainFrame">企业业绩维护</a></li>
            <li><a href="${ctx}/enterprise/employee/join/list" target="mainFrame">企业职称状态</a></li>
            <li><a href="${ctx}/pro/contract/join/list" target="mainFrame">合同信息</a></li>
            <li><a href="${ctx}/pro/tender/join/list" target="mainFrame">招标信息</a></li>
            <li><a href="${ctx}/pro/build/join/list" target="mainFrame">施工许可</a></li>
            <li><a href="${ctx}/pro/completed/join/list" target="mainFrame">竣工信息</a></li>
        </ul>
    </li>
    <li><a href="#">企业查询</a>
        <ul>
            <li><a href="${ctx}/company/perform/list" target="mainFrame">企业业绩查询</a></li>
        </ul>
    </li>
    <li><a href="#">基础资料管理</a>
        <ul>
            <li><a href="${ctx}/provinces/list" target="mainFrame">省份资料维护</a></li>
            <li><a href="${ctx}/citys/list" target="mainFrame">市级资料维护</a></li>
            <li><a href="${ctx}/area/list" target="mainFrame">区域资料维护</a></li>
            &lt;%&ndash;<li><a href="${ctx}/zizhileibie/list" target="mainFrame">资质类型维护</a></li>&ndash;%&gt;
            &lt;%&ndash;<li><a href="${ctx}/zizhidengji/list" target="mainFrame">资质等级维护</a></li>&ndash;%&gt;
        </ul>
    </li>
    <li><a href="#">用户信息管理</a>
        <ul>
            <li><a href="${ctx}/sys/user/list" target="mainFrame">用户管理</a></li>
            <li><a href="${ctx}/error/todo" target="mainFrame">角色管理</a></li>
            <li><a href="${ctx}/error/todo" target="mainFrame">权限管理</a></li>
        </ul>
    </li>
    <li><a href="#">数据管理</a>
        <ul>
            <li><a href="${ctx}/error/todo" target="mainFrame">数据抓取</a></li>
        </ul>
    </li>--%>
</ul>

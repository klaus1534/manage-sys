<%--
  Created by IntelliJ IDEA.
  User: Alen
  Date: 2018/06/12
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">用户列表</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <div class="form-inline">
            <div class="row">
                <div class="form-group">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#createModal">
                        添加用户
                    </button>
                    <%--<a href="${ctx}/manage/goods/create" class="btn btn-success">
                        <span class="glyphicon glyphicon-plus"/>
                    </a>--%>
                </div>
            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>是否冻结</th>
                    <th>是否可用</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.id}</td>
                        <td>${content.username}</td>
                        <td>${content.email}</td>
                        <td>
                            <c:choose>
                                <c:when test="${content.locked}">冻结</c:when>
                                <c:otherwise>正常</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${content.enabled}">可用</c:when>
                                <c:otherwise>不可用</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a role="button" data-toggle="modal" data-target="#createModal" data-whatever='${content.toJSONString()}'>
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            &nabla;
                            <a href="deleted?id=${content.id}"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%@include file="../../common/page.jsp" %>
        </div>
    </form>
</div>
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLable">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="post" id="editEntityForm">
                <%--modal dialog header start--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="closeModal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="createModalLable">添加用户</h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名:</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id" id="id">
                            <input type="text" class="form-control" id="username" name="username" required placeholder="输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" required placeholder="输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="repassword" class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="repassword" name="repassword" required placeholder="重复密码确认">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" required placeholder="输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roles" class="col-sm-2 control-label">权限:</label>
                        <div class="col-sm-10">
                            <div class="checkbox" id="roles">
                                <c:forEach items="${roleList}" var="role">
                                    <label><input type="checkbox" name="roles" value="${role.id}">${role.roleName} </label>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <%--modal dialog body Start--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
                <%--modal dialog body End--%>
            </form>
        </div>
    </div>
</div>
<script type="application/javascript">
    $('#createModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);// Button that triggered the modal
        var extraData = button.data('whatever'); // Extract info from data-* attributes
        var modal = $(this);
        if (extraData == null && extraData == undefined) {
            modal.find('.modal-title').html('添加用户');
            modal.find('#editEntityForm').attr('action', 'create');
            modal.find('.checkbox').parent().parent().addClass('sr-only');
            modal.find('input[type=password]').removeAttr('disabled').parent().parent()
                .removeClass('sr-only');
            modal.find('input[type=text], input[type=password]').val('');
        } else {
            modal.find('.modal-title').html('编辑用户');
            modal.find('#editEntityForm').attr('action', 'updatedo');
            modal.find('input[type=password]').attr('disabled', 'disabled').parent().parent()
                .addClass('sr-only');
            modal.find('.checkbox').parent().parent().removeClass('sr-only');
            Object.keys(extraData).forEach(function (key) {
                modal.find('#' + key).val(extraData[key]);
            });
        }
    });
</script>
</body>
</html>
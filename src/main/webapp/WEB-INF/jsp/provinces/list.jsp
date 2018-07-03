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
    <title>省份资料维护</title>
    <%@include file="../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">省份资料维护</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <div class="form-inline">
            <div class="row">
                <div class="form-group">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#createModal">
                        添加省份
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
                    <th>省份名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.id}</td>
                        <td>${content.provinceName}</td>
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
            <%@include file="../common/page.jsp" %>
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
                    <h4 class="modal-title" id="createModalLable">添加省份</h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="provinceName" class="col-sm-2 control-label">省份名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="provinceName" name="provinceName" required placeholder="输入省份名">
                            <input type="hidden" name="id" id="id">
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
            modal.find('.modal-title').html('添加省份');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', 'create');
        } else {
            modal.find('.modal-title').html('编辑省份');
            modal.find('#editEntityForm').attr('action', 'update');
            Object.keys(extraData).forEach(function (key) {
                modal.find('#' + key).val(extraData[key]);
            })
        }
    });
</script>
</body>
</html>
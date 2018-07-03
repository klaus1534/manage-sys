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
    <title>菜单列表</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">菜单列表</h1>
    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#createRootModal">
        添加大菜单
    </button>
    <h2></h2>
    <div class="panel-group" id="menuList" role="tablist" aria-multiselectable="true">
        <c:forEach items="${menuList}" var="menu">
            <div class="panel panel-default">
            <a role="button" data-toggle="collapse" data-parent="#menuList"
                href="#collapse${menu.id}" aria-expanded="true" aria-controls="collapse${menu.id}">
                <div class="panel-heading" role="tab" id="heading${menu.id}">
                    <h4 class="panel-title">
                        ${menu.menuName}
                    </h4>
                </div>
            </a>

                <div id="collapse${menu.id}" class="panel-collapse collapse" role="tabpanel"
                        aria-labelledby="heading${menu.id}">
                    <div class="panel-body">
                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#createSubModal" data-whatever="${menu.menuName}|${menu.id}">
                            添加子菜单
                        </button>
                        <h2></h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>菜单名</th>
                                        <th>路径</th>
                                        <th>序号</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${menu.subMenuList}" var="content">
                                    <tr>
                                        <td>${content.id}</td>
                                        <td>${content.menuName}</td>
                                        <td>${content.menuPath}</td>
                                        <td>${content.orderno}</td>
                                        <td>
                                            <a role="button" data-toggle="modal" data-target="#createSubModal" data-whatever='${content.toJSONString()}' data-parent="${menu.menuName}">
                                                 <span class="glyphicon glyphicon-pencil"></span>
                                            </a>
                                            &nabla;
                                            <a href="#"><span class="glyphicon glyphicon-trash"></span></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--创建根目录--%>
<div class="modal fade" id="createRootModal" tabindex="-1" role="dialog" aria-labelledby="createModalLable">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="post" id="editEntityForm">
                <%--modal dialog header start--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="closeModal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="createRootModalLable">添加大菜单</h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="menuName" class="col-sm-2 control-label">菜单名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="menuName" name="menuName" required placeholder="菜单名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="menuPath" class="col-sm-2 control-label">访问URL:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="menuPath" name="menuPath" readonly value="#">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="parentId" class="col-sm-2 control-label">父菜单:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="parentId" name="parentId" readonly placeholder="父菜单">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="orderno" class="col-sm-2 control-label">显示序号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="orderno" name="orderno" required placeholder="显示序号">
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
<div class="modal fade" id="createSubModal" tabindex="-1" role="dialog" aria-labelledby="createModalLable">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal"method="post" id="editSubEntityForm">
                <%--modal dialog header start--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="closeModal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="createSubModalLable">添加子菜单</h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="subMenuName" class="col-sm-2 control-label">菜单名:</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id" value="" id="id">
                            <input type="text" class="form-control" id="subMenuName" required name="menuName" placeholder="菜单名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subMenuPath" class="col-sm-2 control-label">访问URL:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="subMenuPath" required name="menuPath" placeholder="访问URL">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subParentId" class="col-sm-2 control-label">父菜单:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="subParentName" readonly placeholder="父菜单">
                            <input type="hidden" id="subParentId" name="parentId" readonly placeholder="父菜单">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subOrderno" class="col-sm-2 control-label">显示序号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="subOrderno" name="orderno" required placeholder="显示序号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roles" class="col-sm-2 control-label">授权角色:</label>
                        <div class="col-sm-10">
                            <div class="checkbox" id="roles">
                                <c:forEach items="${roleList}" var="role">
                                    <label><input type="checkbox" name="roles" value="${role.id}">${role.roleName}</label>
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
    $('#createSubModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);// Button that triggered the modal
        var extraData = button.data('whatever'); // Extract info from data-* attributes
        var parentInfo = button.data('parent');
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        if (parentInfo ==null || parentInfo==undefined){
            // 新增子菜单
            let split = extraData.split('|');
            $('#editSubEntityForm').attr('action', 'create');
            modal.find('.modal-title').text('添加子菜单');
            modal.find('input[type=checkbox]').attr('disabled', 'disabled');
            modal.find('.checkbox').parent().parent().addClass('sr-only');
            modal.find('input[type=text], input[type=hidden]').val('');
            modal.find('#subParentName').val(split[0]);
            modal.find('#subParentId').val(split[1]);
        } else {
            // 更新子菜单
            $('#editSubEntityForm').attr('action', 'update');
            modal.find('.modal-title').html('编辑子菜单');
            modal.find('input[type=checkbox]').removeAttr('disabled');
            modal.find('.checkbox').parent().parent().removeClass('sr-only');
            modal.find('#subParentName').val(parentInfo);
            Object.keys(extraData).forEach(function (key) {
                modal.find('input[name='+key+']').val(extraData[key]);
            });
        }
    });
</script>
</body>
</html>
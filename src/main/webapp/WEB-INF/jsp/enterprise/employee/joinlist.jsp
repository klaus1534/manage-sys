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
    <title>企业人员信息</title>
    <%@include file="../../common/include.jsp" %>
    <style>
        .list{
            table-layout: fixed;
        }
        .list tr td{
            word-break: break-all;
        }
        #searchForm .form-group{
            margin-right: 15px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">企业基础资料</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <div class="form-inline">
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="companyName">企业名称：</label>
                    <input type="text" class="form-control text-left" id="companyName" name="companyName" value="${companyName}">
                </div>
                <div class="form-group">
                    <label class="control-label text-right" for="employeeName">人员姓名：</label>
                    <input type="text" class="form-control text-left" id="employeeName" name="employeeName" value="${employeeName}">
                </div>

                <div class="form-group">
                    <label class="control-label text-right" for="employeeType">人员类别：</label>
                    <input type="text" class="form-control text-left" id="employeeType" name="employeeType" value="${employeeType}">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-sm">查询</button>
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createModal">
                        添加人员信息
                    </button>
                    <a href="exportData?companyName=${companyName}&employeeName=${employeeName}&employeeType=${employeeType}" id="toGuestListExcelId" target="_blank"  class="button button-primary button-small">导出到Excel</a>
                </div>
            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <table class="list table table-bordered table-hover">
                <thead>
                <tr>
                    <th >企业名称</th>
                    <th >姓名</th>
                    <th >性别</th>
                    <th >证件号码</th>
                    <th>人员类别</th>
                    <th>证书编号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.enterpriseName}</td>
                        <td>${content.empName}</td>
                        <td>${content.empSex}</td>
                        <td>${content.empIdno}</td>
                        <td>${content.empType}</td>
                        <td>${content.empQulificationNo}</td>
                        <td>
                            <a role="button" data-toggle="modal" data-target="#createModal" data-whatever='${content.toJSONString()}'>
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            &nabla;&nabla;
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
                    <h4 class="modal-title" id="createModalLable"></h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="enterpriseId" class="col-sm-2 control-label">企业名称:</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id" id="id">
                            <select class="selectpicker form-control show-tick" id="enterpriseId"
                                    name="enterpriseId" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName" name="empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empSex" class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empSex" name="empSex">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empIdno" class="col-sm-2 control-label">证件号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empIdno" name="empIdno">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empType" class="col-sm-2 control-label">人员类型:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empType" name="empType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empQulificationNo" class="col-sm-2 control-label">证书编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empQulificationNo" name="empQulificationNo">
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
            modal.find('.modal-title').html('添加人员信息');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑人员信息');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                modal.find('#' + key).val(extraData[key]);
            })
        }
    });
</script>
</body>
</html>
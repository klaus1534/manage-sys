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
    <title>施工信息</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">施工信息</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <div class="form-inline">
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="companyName">企业名称:</label>
                    <input type="text" class="form-control text-left" id="companyName" name="companyName" value="${companyName}">
                </div>
                <div class="form-group">
                    <label class="control-label text-right" for="proName">项目名称:</label>
                    <input type="text" class="form-control text-left" id="proName" name="proName" value="${proName}">
                </div>
            </div>
            <h2></h2>
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="proAmount">项目金额</label>
                    <div class="input-group" id="proAmount">
                        <input type="text" class="form-control" id="proAmtStart" name="proAmtStart" value="${proAmtStart}">
                        <div class="input-group-addon">-</div>
                        <input type="text" class="form-control" id="proAmtEnd" name="proAmtEnd" value="${proAmtEnd}">
                    </div>
                </div>
            </div>
            <h2></h2>
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="proDuration">项目工期</label>
                    <div class="input-group" id="proDuration">
                        <input type="text" class="form-control" id="proDurationStart" name="proDurationStart" value="${proDurationStart}">
                        <div class="input-group-addon">-</div>
                        <input type="text" class="form-control" id="proDurationEnd" name="proDurationEnd" value="${proDurationEnd}">
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">查询</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
                        添加施工项目
                    </button>
                </div>
            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>企业名称</th>
                    <th>项目名称</th>
                    <th>项目编号</th>
                    <th>施工许可编号</th>
                    <th>合同金额</th>
                    <th>合同工期</th>
                    <th>建设规模</th>
                    <th>施工面积平方米</th>
                    <th>施工单位</th>
                    <th>项目负责人</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.proEnterpriseName}</td>
                        <td>${content.projectName}</td>
                        <td>${content.projectNo}</td>
                        <td>${content.projectBuildNo}</td>
                        <td>${content.projectContractAmount}</td>
                        <td>${content.projectContractDuration}</td>
                        <td>${content.buildScale}</td>
                        <td>${content.buildArea}</td>
                        <td>${content.buildEnterpriseName}</td>
                        <td>${content.buildMan}</td>
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
                        <label for="projectEnterId" class="col-sm-2 control-label">企业名称:</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id" id="id">
                            <select class="selectpicker form-control show-tick" id="projectEnterId"
                                    name="projectEnterId" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectName" class="col-sm-2 control-label">项目名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectName" name="projectName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectNo" class="col-sm-2 control-label">项目编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectNo" name="projectNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectBuildNo" class="col-sm-2 control-label">施工许可编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectBuildNo" name="projectBuildNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectContractAmount" class="col-sm-2 control-label">合同金额:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="projectContractAmount" name="projectContractAmount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectContractDuration" class="col-sm-2 control-label">合同工期:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="projectContractDuration" name="projectContractDuration">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="buildScale" class="col-sm-2 control-label">建设规模:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="buildScale" name="buildScale">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="buildArea" class="col-sm-2 control-label">施工面积平方米:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="buildArea" name="buildArea">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="buildEnterId" class="col-sm-2 control-label">施工企业:</label>
                        <div class="col-sm-10">
                            <select class="selectpicker form-control show-tick" id="buildEnterId"
                                    name="buildEnterId" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="buildMan" class="col-sm-2 control-label">负责人:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="buildMan" name="buildMan">
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
            modal.find('.modal-title').html('添加施工项目');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑施工项目');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                modal.find('input[name=' + key + ']').val(extraData[key]);
            });
        }
    });
</script>
</body>
</html>
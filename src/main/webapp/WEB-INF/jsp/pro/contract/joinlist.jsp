<%--
  Created by IntelliJ IDEA.
  User: Alen
  Date: 2016/12/12
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.huanxink.msys.managesys.utils.DateHelper" %>
<html>
<head>
    <title>合同备案</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">合同备案</h1>
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
                    <label class="control-label text-right" for="contractSignDate">签订时间</label>
                    <div class="input-group" id="contractSignDate">
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="contractSignDateStart" readonly value="${contractSignDateStart}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        -
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="contractSignDateEnd" readonly value="${contractSignDateEnd}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">查询</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
                        添加合同备案
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
                    <th>合同备案号</th>
                    <th>签订日期</th>
                    <th>建设规模</th>
                    <th>合同金额万元</th>
                    <th>承包单位名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.proEnterpriseName}</td>
                        <td>${content.projectName}</td>
                        <td>${content.projectNo}</td>
                        <td>${content.projectContractNo}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.contractSignTime)}</td>
                        <td>${content.contractBuildScale}</td>
                        <td>${content.contractBuildAmount}</td>
                        <td>${content.tenderEnterpriseName}</td>
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
                        <label for="projectContractNo" class="col-sm-2 control-label">合同备案号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectContractNo" name="projectContractNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contractSignTime" class="col-sm-2 control-label">签订日期:</label>
                        <div class="col-sm-10">
                            <div class="date form_datetime input-group">
                                <input type="text" class="form-control" id="contractSignTime" name="contractSignTime" readonly>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contractBuildScale" class="col-sm-2 control-label">建设规模:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="contractBuildScale" name="contractBuildScale">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contractBuildAmount" class="col-sm-2 control-label">合同金额万元:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="contractBuildAmount" name="contractBuildAmount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderEnterId" class="col-sm-2 control-label">承建单位:</label>
                        <div class="col-sm-10">
                            <select class="selectpicker form-control show-tick" id="tenderEnterId"
                                    name="tenderEnterId" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
                            </select>
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
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        minView: 'month',
        format:'yyyy-mm-dd',
        autoclose:true,
        todayBtn:true,
    }).on('hide', function (event) {
        event.preventDefault();
        event.stopPropagation();
    }).on('show', function (event) {
        event.preventDefault();
        event.stopPropagation();
    });
    $('#createModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);// Button that triggered the modal
        var extraData = button.data('whatever'); // Extract info from data-* attributes
        var modal = $(this);
        if (extraData == null && extraData == undefined) {
            modal.find('.modal-title').html('添加合同备案');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑合同备案');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                if (key == 'contractSignTime' && extraData[key] > 0) {
                    modal.find('input[name=' + key + ']').val(msys.formatDate(extraData[key]));
                } else {
                    modal.find('input[name=' + key + ']').val(extraData[key]);
                }
            });
        }
    });
</script>
</body>
</html>
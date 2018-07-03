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
    <title>项目信息查询</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">项目信息查询</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <%--tab 搜索框--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#enterpise" aria-controls="enterpise" role="tab" data-toggle="tab">企业</a>
                    </li>
                    <li role="presentation">
                        <a href="#qualification" aria-controls="qualification" role="tab" data-toggle="tab">资质</a>
                    </li>
                    <li role="presentation">
                        <a href="#employee" aria-controls="employee" role="tab" data-toggle="tab">人员</a>
                    </li>
                    <li role="presentation">
                        <a href="#project" aria-controls="project" role="tab" data-toggle="tab">工程项目</a>
                    </li>
                </ul>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="enterpise">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="enterpriseOption"
                                       value="${enterpriseOption}" placeholder="请输入企业名称">
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="qualification">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="qualificationOption"
                                       value="${qualificationOption}" placeholder="输入企业资质类型/等级">
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="employee">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="employeeOption" value="${employeeOption}"
                                       placeholder="输入人员姓名/人员类别/证书编号">
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="project">
                        <div class="row">
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="projectOption" value="${projectOption}"
                                       placeholder="输入项目名称/项目规模/项目金额/项目合同类型">
                            </div>
                        </div>
                        <h3></h3>
                        <div class="row">
                            <div class="col-sm-10">
                                <a class="controlConditionKey" data-toggle="#extraCondition" data-data="show">
                                    <label for="extraCondition" class="control-label"><i
                                            class="glyphicon glyphicon-plus"></i> 增加条件</label>
                                </a>
                            </div>
                        </div>
                        <h2></h2>
                        <div id="extraCondition" class="hidden">
                            <div class="row">
                                <label class="control-label col-sm-2 text-right" for="tenderShootTime">中标时间</label>
                                <div class="form-inline col-sm-8" id="tenderShootTime">
                                    <div class="input-group date form_datetime">
                                        <input type="text" class="form-control" name="shootTimeStart" readonly
                                               value="${shootTimeStart}" placeholder="请输入最早时间">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-remove"></i></span>
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                    -
                                    <div class="input-group date form_datetime">
                                        <input type="text" class="form-control" name="shootTimeEnd" readonly
                                               value="${shootTimeEnd}" placeholder="请输入最晚时间">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-remove"></i></span>
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                            <h2></h2>
                            <div class="row">
                                <label class="control-label text-right col-sm-2" for="tenderAmt">金额</label>
                                <div class="col-sm-8 form-inline" id="tenderAmt">
                                    <input type="text" class="form-control" name="tenderAmtStart"
                                           value="${tenderAmtStart}" placeholder="输入最小金额">
                                    -
                                    <input type="text" class="form-control" name="tenderAmtEnd" value="${tenderAmtEnd}"
                                           placeholder="输入最大金额">
                                </div>
                            </div>
                            <h2></h2>
                            <div class="row">
                                <label class="control-label text-right col-sm-2" for="projectScale">项目规模</label>
                                <div class="col-sm-8 form-inline" id="projectScale">
                                    <input type="text" class="form-control" name="projectScaleStart"
                                           value="${projectScaleStart}" placeholder="输入最小值">
                                    -
                                    <input type="text" class="form-control" name="projectScaleEnd"
                                           value="${projectScaleStart}" placeholder="输入最大值">
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2></h2>
                    <div class="row">
                        <button type="submit" class="btn btn-primary">查询</button>
                        <button type="button" class="btn btn-primary" id="exportData">汇出</button>
                    </div>
                </div>
            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <c:if test="${empty pageInfo.getList()}">
                <div class="jumbotron">
                    <p>没有符合条件的数据</p>
                </div>
            </c:if>
            <c:if test="${not empty pageInfo.getList()}">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>企业名称</th>
                        <th>项目名称</th>
                        <th>项目编号</th>
                        <th>招投标编号</th>
                        <th>招标类型</th>
                        <th>中标时间</th>
                        <th>建设规模</th>
                        <th>中标金额</th>
                        <th>面积平方米</th>
                        <th>项目负责人</th>
                        <td>查看详情</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.getList()}" var="content">
                        <tr>
                            <td>${content.proEnterpriseName}</td>
                            <td>${content.projectName}</td>
                            <td>${content.projectNo}</td>
                            <td>${content.projectTenderNo}</td>
                            <td>${content.projectType}</td>
                            <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.tenderShootDate)}</td>
                            <td>${content.buildScale}</td>
                            <td>${content.tenderAmount}</td>
                            <td>${content.tenderBuildArea}</td>
                            <td>${content.tenderMan}</td>
                            <td>
                                <a href="/enterprise/employee/join/list">企业人员信息</a>
                                <a href="/enterprise/employee/join/list">企业资质信息</a>
                                <a href="/enterprise/employee/join/list">项目合同信息</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%@include file="../../common/page.jsp" %>
            </c:if>
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
                    <h4 class="modal-title" id="createModalLable">项目招标信息</h4>
                </div>
                <%--modal dialog header end--%>

                <%--modal dialog body start>--%>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="projectEnterId" class="col-sm-2 control-label">企业名称:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="projectEnterId" name="projectEnterId" required>
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectName" class="col-sm-2 control-label">项目信息:</label>
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
                        <label for="projectTenderNo" class="col-sm-2 control-label">招投标编码:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectTenderNo" name="projectTenderNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="projectType" class="col-sm-2 control-label">招标类型:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="projectType" name="projectType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderShootDate" class="col-sm-2 control-label">中标日期:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tenderShootDate" name="tenderShootDate">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderAmount" class="col-sm-2 control-label">中标金额:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tenderAmount" name="tenderAmount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="buildScale" class="col-sm-2 control-label">建设规模:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="buildScale" name="buildScale">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderBuildArea" class="col-sm-2 control-label">面积平方米:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="tenderBuildArea" name="tenderBuildArea">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderEnterId" class="col-sm-2 control-label">中标单位:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="tenderEnterId" name="tenderEnterId" required>
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderMan" class="col-sm-2 control-label">项目负责人:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tenderMan" name="tenderMan">
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
        language: 'zh-CN',
        minView: 'month',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
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
            modal.find('.modal-title').html('添加项目招标信息');
            modal.find('#editEntityForm').attr('action', 'create');
        } else {
            modal.find('.modal-title').html('编辑项目招标信息');
            modal.find('#editEntityForm').attr('action', 'update');
        }
    });
    $('#exportData').on('click', function () {
        document.searchForm.action = 'export';
        document.searchForm.submit();
        document.searchForm.action = '';
    });
    $('.controlConditionKey').on('click', function () {
        var targetStatus = $(this).attr('data-data');
        var targetObjId = $(this).attr('data-toggle');
        switch (targetStatus) {
            case 'show':
                $(this).attr('data-data', 'hide').html(`<label for="extraCondition" class="control-label"><i class="glyphicon glyphicon-minus"></i> 删除条件</label>`);
                $(targetObjId).removeClass('hidden');
                break;
            case 'hide':
                $(this).attr('data-data', 'show').html(`<label for="extraCondition" class="control-label"><i class="glyphicon glyphicon-plus"></i> 增加条件</label>`);
                $(targetObjId).addClass('hidden');
                $(targetObjId).find('input').val('')
                break;
        }
    });
</script>
</body>
</html>
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
    <title>项目招标信息</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">项目招标信息</h1>
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
                    <label class="control-label text-right" for="tenderType">招标类型</label>
                    <input type="text" class="form-control" id="tenderType" name="tenderType" value="${tenderType}">
                </div>
                <div class="form-group">
                    <label class="control-label text-right" for="tenderProAmt">项目金额</label>
                    <div class="input-group" id="tenderProAmt">
                        <input type="number" class="form-control" id="tenderProAmtStart" name="tenderProAmtStart" value="${tenderProAmtStart}">
                        <div class="input-group-addon">-</div>
                        <input type="number" class="form-control" id="tenderProAmtEnd" name="tenderProAmtEnd" value="${tenderProAmtEnd}">
                    </div>
                </div>
            </div>
            <h2></h2>
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="tenderShootTime">中标日期</label>
                    <div class="input-group" id="tenderShootTime">
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="tenderShootTimeStart" readonly value="${tenderShootTimeStart}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        -
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="tenderShootTimeEnd" readonly value="${tenderShootTimeEnd}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">查询</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
                        添加招标信息
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
                    <th>项目信息</th>
                    <th>项目编号</th>
                    <th>招投标编码</th>
                    <th>招标类型</th>
                    <th>中标日期</th>
                    <th>中标金额</th>
                    <th>建设规模</th>
                    <th>面积平方米</th>
                    <th>中标单位</th>
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
                        <td>${content.projectTenderNo}</td>
                        <td>${content.projectType}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.tenderShootDate)}</td>
                        <td>${content.tenderAmount}</td>
                        <td>${content.buildScale}</td>
                        <td>${content.tenderBuildArea}</td>
                        <td>${content.tenderEnterpriseName}</td>
                        <td>${content.tenderMan}</td>
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
                    <h4 class="modal-title" id="createModalLable">项目招标信息</h4>
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
                            <div class="input-group date form_datetime">
                                <input type="text" class="form-control" id="tenderShootDate" name="tenderShootDate" readonly value="${tenderShootDate}">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tenderAmount" class="col-sm-2 control-label">中标金额:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="tenderAmount" name="tenderAmount">
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
                            <select class="selectpicker form-control show-tick" id="tenderEnterId"
                                    name="tenderEnterId" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
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
            modal.find('.modal-title').html('添加项目招标信息');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑项目招标信息');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                modal.find('input[name=' + key + ']').val(extraData[key]);
            });
        }
    });
</script>
</body>
</html>
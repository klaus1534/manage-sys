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
    <title>竣工备案信息</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">竣工备案信息</h1>
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
                    <label class="control-label text-right" for="buildAmt">工程造价</label>
                    <div class="input-group" id="buildAmt">
                        <input type="number" class="form-control" id="buildAmtStart" name="buildAmtStart" value="${buildAmtStart}">
                        <div class="input-group-addon">-</div>
                        <input type="number" class="form-control" id="buildAmtEnd" name="buildAmtEnd" value="${buildAmtEnd}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label text-right" for="buildScale">建设规模</label>
                    <input type="text" class="form-control" id="buildScale" name="buildScale" value="${buildScale}">
                </div>
            </div>
            <h2></h2>
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="completedTime">竣工时间</label>
                    <div class="input-group" id="completedTime">
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="completedTimeStart" readonly value="${completedTimeStart}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        -
                        <div class="input-group date form_datetime">
                            <input type="text" class="form-control" name="completedTimeEnd" readonly value="${completedTimeEnd}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
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
                    <th>竣工编号</th>
                    <th>实际造价万元</th>
                    <th>实际面积平方米</th>
                    <th>实际建设规模</th>
                    <th>实际开工日期</th>
                    <th>实际竣工日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.proEnterpriseName}</td>
                        <td>${content.projectName}</td>
                        <td>${content.projectNo}</td>
                        <td>${content.projectCompletedNo}</td>
                        <td>${content.realBuildAmount}</td>
                        <td>${content.realBuildArea}</td>
                        <td>${content.realBuildScale}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.realStartTime)}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.realCompletedTime)}</td>
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
                        <label for="enterpriseNameInput" class="col-sm-2 control-label">企业名称:</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id" id="id">
                            <select class="selectpicker form-control show-tick" id="enterpriseNameInput"
                                    name="enterpriseName" required data-live-search="true">
                                <option value="">请选择</option>
                                <c:forEach items="${enterpriseList}" var="enterprise">
                                    <option value="${enterprise.id}">${enterprise.enterpriseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qualificationNo" class="col-sm-2 control-label">项目名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationNo" name="qualificationNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qualificationName" class="col-sm-2 control-label">项目编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationName" name="qualificationName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qualificationLevel" class="col-sm-2 control-label">竣工编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationLevel" name="qualificationLevel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realBuildAmount" class="col-sm-2 control-label">实际造价万元:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="realBuildAmount" name="realBuildAmount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realBuildArea" class="col-sm-2 control-label">实际面积平方米:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="realBuildArea" name="realBuildArea">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realBuildScale" class="col-sm-2 control-label">实际建设规模:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="realBuildScale" name="realBuildScale">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realStartTime" class="col-sm-2 control-label">实际开工日期:</label>
                        <div class="col-sm-10">
                            <div class="date form_datetime input-group">
                                <input type="text" class="form-control" id="realStartTime" name="realStartTime" readonly>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realCompletedTime" class="col-sm-2 control-label">实际竣工日期:</label>
                        <div class="col-sm-10">
                            <div class="date form_datetime input-group">
                                <input type="text" class="form-control" id="realCompletedTime" name="realCompletedTime" readonly>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
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
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        minView: 'month',
        format:'yyyy-mm-dd',
        autoclose:true,
        todayBtn:true,
        startDate: $('#realStartTime').val()
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
            modal.find('.modal-title').html('添加竣工备案');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑竣工备案');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                modal.find('input[name=' + key + ']').val(extraData[key]);
            });
        }
    });
</script>
</body>
</html>
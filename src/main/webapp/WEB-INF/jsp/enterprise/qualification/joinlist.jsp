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
    <title>企业资质信息</title>
    <%@include file="../../common/include.jsp" %>
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">企业资质信息</h1>
    <form name="searchForm" id="searchForm" role="form" method="get">
        <div class="form-inline">
            <div class="row">
                <div class="form-group">
                    <label class="control-label text-right" for="companyName">企业名称:</label>
                    <input type="text" class="form-control text-left" id="companyName" name="companyName" value="${companyName}">
                </div>
                <div class="form-group">
                    <label class="control-label text-right" for="qualificationType">资质类别:</label>
                    <input type="text" class="form-control text-left" id="qualificationType" name="qualificationType" value="${qualificationType}">
                </div>
                <div class="form-group">
                    <label for="qLevel" class="col-sm-2 control-label">等级:</label>
                    <div class="col-sm-9">
                        <select class="selectpicker form-control show-tick" id="qLevel"
                                name="qLevel"  >
                            <option value="${qLevel}">${qLevel}</option>
                            <c:forEach items="${qLevelList}" var="qLevel">
                            <option value="${qLevel.qualificationLevel}">${qLevel.qualificationLevel}</option>
                        </c:forEach>
                        </select>
                    </div>
            </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">查询</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
                        企业资质信息
                    </button>
                  <%--<button type="button" id="toGuestListExcelId" class="btn btn-primary" action="exportDate?tableDate="+${pageInfo.getList()}" >
                      导出到Excel </button>--%>
                  <%--  <a href="javascript:void(0);" id="toGuestListExcelId" target="_blank" onclick="toGuestListExcel()" class="button button-primary button-small">导出到Excel</a>--%>
                   <%-- <button type="button"   class="button button-primary button-small"></button>--%>
                    <a href="exportData?companyName=${companyName}&qualificationType=${qualificationType}&qLevel=${qLevel}" id="toGuestListExcelId" target="_blank"  class="button button-primary button-small">导出到Excel</a>

                </div>
            </div>
            <div class="row">

            </div>
        </div>
        <h2></h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>企业名称</th>
                    <th>证书编号</th>
                    <th>资质类别</th>
                    <th>等级</th>
                    <th>发证日期</th>
                    <th>有效日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.getList()}" var="content">
                    <tr>
                        <td>${content.enterpriseName}</td>
                        <td>${content.qualificationNo}</td>
                        <td>${content.qualificationName}</td>
                        <td>${content.qualificationLevel}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.issueTime)}</td>
                        <td>${DateHelper.convertDateIntoYYYYMMDDStr(content.validTime)}</td>
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
                        <label for="qualificationNo" class="col-sm-2 control-label">证书边编号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationNo" name="qualificationNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qualificationName" class="col-sm-2 control-label">资质类别:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationName" name="qualificationName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qualificationLevel" class="col-sm-2 control-label">等级:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="qualificationLevel" name="qualificationLevel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="issueTime" class="col-sm-2 control-label">发证日期:</label>
                        <div class="col-sm-10">
                            <div class="date form_datetime input-group">
                                <input type="text" class="form-control" id="issueTime" name="issueTime" readonly>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"></i></span>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="validTime" class="col-sm-2 control-label">有效日期:</label>
                        <div class="col-sm-10">
                            <div class="date form_datetime input-group">
                                <input type="text" class="form-control" id="validTime" name="validTime" readonly>
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
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
        startDate: $('#issueTime').val()
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
            modal.find('.modal-title').html('添加资质');
            modal.find('input').val('');
            modal.find('#editEntityForm').attr('action', '../create');
        } else {
            modal.find('.modal-title').html('编辑资质');
            modal.find('#editEntityForm').attr('action', '../update');
            Object.keys(extraData).forEach(function (key) {
                if ((key == 'issueTime' || key == 'validTime')
                    && extraData[key] > 0) {
                    var tempDate = new Date(extraData[key]);
                    var formatDate = tempDate.getFullYear() + '-';
                    formatDate += tempDate.getMonth() > 8 ? (tempDate.getMonth() + 1) + '-'
                        : ('0' + (tempDate.getMonth() + 1)) + '-';
                    formatDate += tempDate.getDate() > 9 ? tempDate.getDate()
                        : '0' + tempDate.getDate();
                    modal.find('#' + key).val(formatDate);
                } else {
                    modal.find('#' + key).val(extraData[key]);
                }
            })

        }
    });
    /* 导出到Excel */
  /*  function toGuestListExcel(){
       /!* var curpagenum = $('#contentGroupOrderTable').getGridParam('page');
        $("#page").val(curpagenum);*!/
        $("#toGuestListExcelId").attr("action","/pro/tender/export?pageInfo="+$("#pageInfo").val()
            /!*+"&nativePlace="+$("#nativePlace").val()*!/);
    }*/



</script>
</body>
</html>
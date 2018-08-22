<%--jstl--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--end--%>

<%--set ctx value--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%--end--%>

<%--icon--%>
<%--<link href="${ctx}/static/shenma.ico" rel="icon">--%>
<%--end--%>
<style>
    .form-group{
        font-size: 13px;

    }
    .form-group label{
        font-weight: normal!important;
        display: inline-block;
        height:28px;
        line-height: 28px;
        padding: 0;
    }
    .form-group .form-control{
        width: 180px!important;
        height: 28px;
        line-height: 28px;
    }
    .form-group .form-control.half{
        width: 80px!important;
    }
    .form-group .line{
        display: inline-block;
        height: 28px;
        line-height: 28px;
        width:20px;
        text-align: center;
    }
    .form-group .selectpicker.form-control{
        width: 0px!important;
    }
    .form-group .btn{
        height:28px;
        line-height: 1;
    }
    .row{
        padding:5px 15px;
    }
    .table{
        margin-top: 20px;
    }

</style>
<%--bootstrap--%>
<link rel="stylesheet" href="${ctx}/static/plugin/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/static/plugin/bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${ctx}/static/plugin/bootstrap-select/css/bootstrap-select.min.css">

<%--jquery--%>
<script src="${ctx}/static/js/jquery.min.js"></script>
<%--end--%>

<script src="${ctx}/static/plugin/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
<script src="${ctx}/static/plugin/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="${ctx}/static/plugin/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8" ></script>
<script src="${ctx}/static/plugin/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${ctx}/static/js/common.js" charset="UTF-8"></script>
<%--end--%>


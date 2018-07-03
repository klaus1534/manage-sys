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


<%--
  Created by IntelliJ IDEA.
  User: Alen
  Date: 2016/12/18
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" name="pageNo" id="pageNo" , value="${pageNo}">
<script type="text/javascript">

    function gotoPage(n) {
        $("#pageNo").val(n);
        document.searchForm.submit();
    }

    function clearPage() {
        document.searchForm[page].value = 1;
    }

</script>
<%--分页--%>
<div class="col-sm-2">总条数：${pageInfo.total}</div>
<div class="col-sm-10">
    <ul class="pagination pull-right">
        <li><a href="javascript:gotoPage(1)">首页</a></li>
        <c:if test="${pageInfo.prePage > 0 }">
            <li><a href="javascript:gotoPage(${pageInfo.prePage})"><i class="fa-angle-double-left"></i>上一页</a></li>
        </c:if>
        <c:if test="${pageInfo.pages <= 5 }">
            <c:forEach begin="1" end="${pageInfo.pages }" var="currPage">
                <li <c:if test="${currPage eq pageInfo.pageNum}"> class="active" </c:if>>
                    <a href="javascript:gotoPage(${currPage})">${currPage }</a></li>
            </c:forEach>
        </c:if>
        <c:if test="${pageInfo.pages > 5}">
            <c:set var="delta" value="${pageInfo.pageNum%5}"/>
            <c:forEach begin="${pageInfo.pageNum-delta eq 0 ? 1: pageInfo.pageNum-delta}"
                       end="${pageInfo.pageNum+5-delta > pageInfo.pages ? pageInfo.pages : pageInfo.pageNum+5-delta}"
                       var="currPage">
                <li <c:if test="${currPage eq pageInfo.pageNum}"> class="active" </c:if>>
                    <a href="javascript:gotoPage(${currPage})">${currPage }</a>
                </li>
            </c:forEach>
        </c:if>
        <c:if test="${pageInfo.nextPage > 0 }">
            <li><a href="javascript:gotoPage(${pageInfo.nextPage})">下一页 <i class="fa-angle-double-right"></i></a></li>
        </c:if>
        <li><a href="javascript:gotoPage(${pageInfo.pages})">尾页</a></li>
    </ul>
</div>
<%--end--%>

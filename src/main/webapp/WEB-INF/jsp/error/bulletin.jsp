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
    <title>公告</title>
    <%@include file="../common/include.jsp" %>
    <link href="${ctx}/static/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <h1 class="page-header">公告栏</h1>
    <div class="table-responsive">
        <%--主页欢迎信息--%>
        <div class="form-group">
            <div class="text-left">
                <p>
                <h3>欢迎 ${userDetails.username} 使用企业管理系统</h3></p>
                <br/>
                <p><h4>当前登入IP: ${pageContext.request.getHeader("X-Forwarded-For")==null ?
                    pageContext.request.getRemoteAddr():pageContext.request.getHeader("X-Forwarded-For")}</h4></p>

                <p><h4>当前系统时间：${currentTime}</h4></p>
            </div>
        </div>
        <br>
        <%--折叠搜索框demo--%>
        <div class="panel-group sr-only" id="searchParamAccordion" role="tablist" aria-multiselectable="true">
            <form id="searchForm" name="searchForm" method="post">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#searchParamAccordion"
                               href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                条件#1
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                         aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="companyName" class="col-sm-2">公司名称:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="companyName" id="companyName">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#searchParamAccordion"
                               href="#collapseTwo" aria-expanded="true" aria-controls="headingTwo">
                                条件#2
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="companyRank" class="col-sm-2">公司等级:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="companyRank" id="companyRank">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#searchParamAccordion"
                               href="#collapseThree" aria-expanded="true" aria-controls="headingThree">
                                条件#3
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="companyType" class="col-sm-2">公司类别:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="companyType" id="companyType">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="form-group">
                    <div class="col-sm-10">
                        <button class="btn btn-primary" type="submit">查询</button>
                        <button class="btn btn-default" type="button">导出数据</button>
                    </div>
                </div>
                <%--<div class="panel panel-default">
                    <div class="panel-body">
                    </div>
                </div>--%>
            </form>
        </div>
        <%--End--%>

        <br>
        <%--tab 搜索框--%>
        <div class="panel panel-default sr-only">
            <div class="panel-heading">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a>
                    </li>
                    <li role="presentation">
                        <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">profile</a>
                    </li>
                    <li role="presentation">
                        <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">messages</a>
                    </li>
                    <li role="presentation">
                        <a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">settings</a>
                    </li>
                </ul>
            </div>
            <div class="panel-body">
                <form class="horizontal">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="home">
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="profile">
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="messages">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="messages">
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="settings">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="settings">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    var jsonStr = `{"name": "allen", "age":12}`;
    let jsonObj = JSON.parse(jsonStr);
    console.log(jsonStr);
    console.log(jsonObj);
</script>
</body>
</html>
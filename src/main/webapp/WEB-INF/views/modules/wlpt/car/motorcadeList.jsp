<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>车队管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/wlpt/motorcade/">车队列表</a></li>
    <shiro:hasPermission name="wlpt:motorcade:edit">
        <li><a href="${ctx}/wlpt/motorcade/form">车队添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="motorcade" action="${ctx}/wlpt/motorcade/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>车队名称：</label>
            <form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>车队名称</th>
        <th>更新时间</th>
        <shiro:hasPermission name="wlpt:motorcade:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="motorcade">
        <tr>
            <td><a href="${ctx}/wlpt/motorcade/form?id=${motorcade.id}">
                    ${motorcade.name}
            </a></td>
            <td>
                <fmt:formatDate value="${motorcade.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <shiro:hasPermission name="wlpt:motorcade:edit">
                <td>
                    <a href="${ctx}/wlpt/motorcade/form?id=${motorcade.id}">修改</a>
                    <a href="${ctx}/wlpt/motorcade/delete?id=${motorcade.id}"
                       onclick="return confirmx('确认要删除该车队吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=2"/>

<div class="page-container">

    <div class="space12">
        <div class="span3 sidebar-content ">
            <jsp:include page="memberProfileMenu.jsp?t=2"/>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>我的提问</div>
                            <div class="tools">
                                <a href="/member/askInput" class="add" title="我要提问"></a>
                            </div>
                        </div>

                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>问题</th>
                                    <th class="hidden-480">提问者</th>
                                    <th class="hidden-480">提问时间</th>
                                    <th class="hidden-480">关注数</th>
                                    <th class="hidden-480">解决状态</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td><a href="/detail?id=${item.id}">${item.title}</a></td>
                                        <td class="hidden-480">${item.member.name}</td>
                                        <td class="hidden-480">
                                            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>
                                        <td class="hidden-480">${item.concerns}</td>
                                        <td class="center hidden-480">
                                            <c:choose>
                                                <c:when test="${item.status == 0}">
                                                    未解决
                                                </c:when>
                                                <c:when test="${item.status == 1}">
                                                    已解决
                                                </c:when>
                                                <c:otherwise>
                                                    未解决
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <jsp:include page="pagination.jsp"/>

                </div>

            </div>

        </div>
    </div>

</div>


<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
    });

</script>

</body>
</html>

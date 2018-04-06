<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>学习视频</title>
    <jsp:include page="resources.jsp" flush="true"/>


</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <jsp:include page="header.jsp"/>


    <!--悬浮搜索框-->
    <jsp:include page="search.jsp" flush="true"/>


    <div class="clear"></div>
</div>


<jsp:include page="nva.jsp"/>

    <%--最新解答--%>
    <div class="shopMainbg">
    <div class="shopMain" id="shopmain">
        <div class="am-container ">
            <div class="shopTitle ">
                <h4>学习视频</h4>
            </div>
        </div>
        <table class="table am-g am-g-fixed">
            <thead>

            </thead>
            <tbody>
                <c:forEach items="${list}" var="item">
                    <tr>
                        <td><a href="/video/detail?id=${item.id}">${item.title}</a></td>
                        <td style="text-align: right"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <jsp:include page="pagination.jsp"/>
    </div>
</div>


    <div class="clear "></div>
    <jsp:include page="footer.jsp"/>
</div>

</body>

</html>
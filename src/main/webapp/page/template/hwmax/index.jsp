<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>C课程答疑平台</title>
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
                <h4>最新解答</h4>
                <h3>丰富人们的沟通与生活</h3>
                <span class="more ">
                    <a class="more-link " href="/list?status=1">查看更多</a>
                </span>
            </div>
        </div>
        <table class="table am-g am-g-fixed">
            <thead>
            <%--<tr>--%>
                <%--<th scope="col">问题名称</th>--%>
                <%--<th scope="col">提问者</th>--%>
                <%--<th scope="col">解答时间</th>--%>
            <%--</tr>--%>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="item">
                    <tr>
                        <td><a href="/detail?id=${item.id}">${item.title}</a></td>
                        <td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

    <%--学习视频--%>

<div class="shopMain" id="shopmain">
    <div class="am-container ">
        <div class="shopTitle ">
            <h4>学习视频</h4>
            <h3>看看大家都在学什么</h3>
            <span class="more ">
                    <a class="more-link " href="/video/list">查看更多</a>
                        </span>
        </div>
    </div>

    <div class="am-g am-g-fixed floodOne ">
        <c:forEach items="${videos}" var="item">
            <div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
                <a href="/video/detail?id=${item.id}">
                    <img src="/image/video.jpg ">
                    <div class="outer-con ">
                        <div class="title ">
                                ${item.title}
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>



    <div class="clear "></div>
    <jsp:include page="footer.jsp"/>

</div>


        <!--引导 -->

        <!--菜单 -->
        <script>
            window.jQuery || document.write('<script src="/js/jquery-1.10.1.min.js "><\/script>');
        </script>
        <!--<script type="text/javascript " src="../basic/js/quick_links.js "></script>-->
</body>

</html>
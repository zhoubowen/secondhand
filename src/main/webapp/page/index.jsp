<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=${param.status == 1 ? 1 : 0}" flush="true"/>
<div class="page-container row-fluid">

    <div class="span12 blog-page">

        <div class="row-fluid">


            <div class="span12 article-block">

                <div class="row-fluid search-forms search-default">
                    <form class="form-search" action="/">
                        <div class="chat-form">
                            <div class="input-cont">
                                <input type="text" name="title" placeholder="Search..." class="m-wrap" />
                            </div>
                            <button type="submit" class="btn green">Search &nbsp; <i class="m-icon-swapright m-icon-white"></i></button>
                        </div>
                    </form>

                </div>

                <h1></h1>

                <c:forEach items="${list}" var="item">
                    <div class="row-fluid">

                        <div class="span12 blog-article">

                            <h4><a href="/detail?id=${item.id}">${item.title}</a></h4>
                            <div class="blog-img blog-tag-data">

                                <ul class="unstyled inline">
                                    <li><i class="icon-calendar"></i> <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>
                                    <li><i class="icon-comments"></i> <a href="/member/info?memberId=${item.createBy}&type=1">${item.member.name}</a></li>
                                    <li><i class="icon-heart" title="关注数"></i>${item.concerns}</li>
                                </ul>

                            </div>

                        </div>

                    </div>
                </c:forEach>

            </div>

        </div>


        <%--分页--%>
        <jsp:include page="pagination.jsp"/>

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

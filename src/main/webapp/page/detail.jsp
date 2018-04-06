<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed page-full-width">

<div class="header navbar navbar-inverse navbar-fixed-top">
    <jsp:include page="nav.jsp?m=${ask.status == 1 ? 1 : 0}"/>
</div>


<div class="page-container row-fluid">

    <div class="span12 blog-page">

        <div class="row-fluid">

            <div class="span12 article-block">
                <h1></h1>
                    <div class="row-fluid">
                        <div class="span12 blog-article">
                            <h4>${ask.title}</h4>
                            <c:choose>
                                <c:when test="${concern}">
                                    <a class="btn green mini" href="javascript:;">已关注</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn green mini" href="/concern/add?askId=${ask.id}">关注此问题</a>
                                </c:otherwise>
                            </c:choose>

                            <div class="blog-img blog-tag-data">
                                <ul class="unstyled inline">
                                    <li><i class="icon-calendar"></i> <fmt:formatDate value="${ask.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>
                                    <li><i class="icon-comments"></i> <a href="/member/info?memberId=${ask.createBy}&type=1">${ask.member.name}</a></li>
                                    <li><i class="icon-heart" title="关注数"></i>${ask.concerns}</li>
                                </ul>
                            </div>
                            <p>
                                &nbsp;&nbsp;${ask.descript}

                            </p>

                            <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <hr>
                            <div class="media">
                                <h4>问题回复</h4>


                                <c:if test="${empty commentList}">
                                    暂无回复!
                                </c:if>
                              
                                <c:forEach items="${commentList}" var="item">
                                    <div class="media-body">
                                        <p>${item.content} </p>
                                        <h5 class="media-heading">${item.memberName} <span><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                            <c:if test="${ask.createBy == sessionScope.memberId} && ${ask.status == 0}">
                                                / <a href="/askResolve?id=${ask.id}&status=1">标记解决</a></span></h5>
                                            </c:if>
                                        <hr>
                                    </div>
                                </c:forEach>
                            </div>


                            <c:if test="${ask.createBy != sessionScope.memberId}">
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                <div class="post-comment">
                                    <h4>我要回答</h4>
                                    <input type="hidden" name="askId" value="${ask.id}" />
                                    <textarea class="span10 m-wrap" rows="5" name="content"></textarea>
                                    <p><button class="btn blue" type="submit" onclick="addComment()">提交</button></p>
                                </div>
                            </c:if>

                        </div>

                    </div>
            </div>

        </div>

    </div>

</div>

<%@include file="footer.jsp"%>

<script>
    function addComment() {
        $.post(
                "/comment/add",
                {
                    articleId: $("input[name=askId]").val(),
                    content : $("textarea[name=content]").val()
                },
                function(result){
                    if(result.success){
                        window.location.reload();
                    }
                    console.log(result);

                }
        );
    }
</script>
</body>
</html>

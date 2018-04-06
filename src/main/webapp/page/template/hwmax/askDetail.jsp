<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>${ask.title}</title>
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
                <h4>${ask.title}</h4>
            </div>
        </div>
        <table class="table am-g am-g-fixed">
            <thead>

            </thead>
            <tbody>
                <tr>
                    <td>
                        <ul class="unstyled inline">
                            <li><i class="icon-calendar"></i> <fmt:formatDate value="${ask.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></li>
                            <li><i class="icon-comments"></i> <a href="/member/info?memberId=${ask.createBy}&type=1">${ask.member.name}</a></li>
                            <li><i class="icon-heart" title="关注数"></i>${ask.concerns}</li>
                        </ul>
                        <c:choose>
                            <c:when test="${concern}">
                                <a class="btn green mini" href="javascript:;">已关注</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn green mini" href="/concern/add?askId=${ask.id}">关注此问题</a>
                            </c:otherwise>
                        </c:choose>
                        <p>&nbsp;</p>
                        ${ask.descript}
                    </td>
                </tr>
            </tbody>
        </table>



                <div class="shopMainbg">
            <div class="shopMain" id="shopmain">
                <div class="am-container ">
                    <div class="shopTitle ">
                        <h4>${ask.status == 1 ? '问题回复' : '我要回复'}</h4>
                    </div>
                </div>
                <table class="table am-g am-g-fixed">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <c:choose>
                                <c:when test="${ask.status == 1}">
                                    ${comment.content}
                                 </c:when>
                                 <c:otherwise>
                                     <c:if test="${ask.createBy != sessionScope.memberId}">
                                         <input type="hidden" name="askId" value="${ask.id}" />
                                         <textarea class="span10 m-wrap" rows="5" name="content"></textarea>
                                         <p><button class="btn blue" type="submit" onclick="addComment()">提交</button></p>
                                     </c:if>
                                 </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </div>

            <div class="clear "></div>
            <jsp:include page="footer.jsp"/>
        </div>

</body>

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
                        window.location.href = "/list?status=1";
                    }
                    console.log(result);

                }
        );
    }

</script>
</html>
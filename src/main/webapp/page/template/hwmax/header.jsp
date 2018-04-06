
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="a-header" style="background-color:#f4f4f4">
    <div class="am-container header">

        <ul class="message-r">


        </ul>
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <c:choose>
                        <c:when test="${sessionScope.memberId == null}">
                            <a  href="/member/loginInput">登录/注册</a>
                        </c:when>
                        <c:otherwise>

                                <a href="/member/info">
                                        ${sessionScope.name}
                                </a>
                            <a href="/member/logout">注销</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </ul>
    </div>
</div>


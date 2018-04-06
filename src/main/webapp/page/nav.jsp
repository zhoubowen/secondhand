<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="header navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <div class="brand">
                <img src="/image/logo.png" alt="logo" />
            </div>

            <div class="navbar hor-menu hidden-phone hidden-tablet">
                <div class="navbar-inner">
                    <ul class="nav">
                        <li class="${param.m == 0 ? 'active' : ''}">
                            <a href="/?status=0">
                                <span class="${param.m == 0 ? 'selected' : ''}"></span>
                                未解决
                            </a>
                        </li>

                        <li class="${param.m == 1 ? 'active' : ''}">
                            <a href="/?status=1">
                                <span class="${param.m == 1 ? 'selected' : ''}"></span>
                                已解决
                            </a>
                        </li>


                        <li class="${param.m == 2 ? 'active' : ''}">
                            <a href="/member/info">
                                <span class="${param.m == 2 ? 'selected' : ''}"></span>
                                个人中心
                            </a>
                        </li>

                    </ul>

                </div>

            </div>

            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <img src="/image/menu-toggler.png" alt="" />
            </a>


            <ul class="nav pull-right">
                <c:choose>
                    <c:when test="${sessionScope.memberId == null}">
                        <li><a  href="/member/loginInput">登录/注册</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#">
                                ${sessionScope.name}
                            </a>
                        </li>
                        <li><a href="/member/logout">注销</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>

        </div>

    </div>

</div>

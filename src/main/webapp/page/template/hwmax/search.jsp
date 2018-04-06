<%--
  Created by IntelliJ IDEA.
  User: zbw
  Date: 2018/4/6
  Time: 下午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav white">

    <div class="logoBig">
        <li><img src="/image/logo-new.png" /></li>
    </div>

    <div class="search-item" style="margin-left: 0px; margin-top: 40px; float: right;">
        <form method="post" action="/list">
            <span style="color: #888">搜索：</span>
            <input type="text" name="title">
            <input type="hidden" name="status" value="${param.status}">
            <input type="submit" name="search-submit" value="搜索">
        </form>
    </div>
</div>


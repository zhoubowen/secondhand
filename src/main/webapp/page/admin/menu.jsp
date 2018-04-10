<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-sidebar nav-collapse collapse">
    <ul class="page-sidebar-menu">
        <li>
            <div class="sidebar-toggler hidden-phone"></div>
        </li>

        <li class="start active ">
            <a href="javascript:;">
                <i class="icon-cogs"></i>
                <span class="title">系统功能</span>
                <span class="selected"></span>
            </a>
            <ul class="sub-menu">
                <li class="${param.m == 0 ? 'active' : '' }"><a href="/admin/goods/index">商品管理</a></li>
                <li class="${param.m == 1 ? 'active' : '' }"><a href="/admin/ask/index?status=0">问题管理</a></li>
                <li class="${param.m == 2 ? 'active' : '' }"><a href="/admin/video/index">教学视频管理</a></li>
                <li class="${param.m == 3 ? 'active' : '' }"><a href="/admin/member/index?roleType=2">学生管理</a></li>
                <li class="${param.m == 4 ? 'active' : '' }"><a href="/admin/member/index?roleType=1">教师管理</a></li>
            </ul>
        </li>


    </ul>

</div>


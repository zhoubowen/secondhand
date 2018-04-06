<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zbw
  Date: 2018/4/4
  Time: 下午11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="ver-inline-menu tabbable margin-bottom-25">
    <li class="${param.t == 1 ? 'active' : ''}"><a href="#tab_1" data-toggle="tab" onclick="doInfo(1)"><i class="icon-group"></i> 个人信息</a></li>
    <c:if test="${sessionScope.roleType == 2}">
        <li class="${param.t == 2 ? 'active' : ''}"><a href="#tab_2" data-toggle="tab" onclick="doInfo(2)"><i class="icon-leaf"></i> 我的提问</a></li>
    </c:if>
    <%--<li class="${param.t == 3 ? 'active' : ''}"><a href="#tab_3" data-toggle="tab" onclick="doInfo(3)"><i class="icon-info-sign"></i> 招商投资信息</a></li>--%>
    <%--<li class="${param.t == 4 ? 'active' : ''}"><a href="#tab_4" data-toggle="tab" onclick="doInfo(4)"><i class="icon-tasks"></i> 收到的留言</a></li>--%>
</ul>

<script>
    function doInfo(i) {
        switch(i)
        {
            case 1:
                window.location.href = "/member/info";
                break;
            case 2:
                window.location.href = "/member/askList";
                break;
            case 3:
                window.location.href = "/member/supply?type=1";
                break;
            case 4:
                window.location.href = "/comment/list";
                break;
            default:
                window.location.href = "/member/info?type=0";
        }
    }
</script>
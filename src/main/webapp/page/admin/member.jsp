
<%--学生,教师管理列表--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=${param.roleType == 1 ? 4 : 3 }" flush="true"/>

    <div class="page-content">

        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">系统功能</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="/admin/member/index">${param.roleType == 1 ? "教师" : "学生" }信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">${param.roleType == 1 ? "教师" : "学生" }列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption"><i class="icon-globe"></i>${param.roleType == 1 ? "教师" : "学生" }列表</div>
                        </div>

                        <div class="portlet-body">
                            <%--<a class="btn green" href="/admin/member/input?roleType=${param.roleType}">添加</a>--%>
                            <%--<hr/>--%>
                            <div class="tabbable tabbable-custom">
                                <ul class="nav nav-tabs">
                                    <li class="${param.status == 1 ? 'active' : ''}"><a href="/admin/member/index?roleType=2&status=1">审核通过</a></li>
                                    <li class="${param.status == 0 ? 'active' : ''}"><a href="/admin/member/index?roleType=2&status=0">待审核</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>姓名</th>
                                                <th class="hidden-480">班级</th>
                                                <th class="hidden-480">专业</th>
                                                <th class="hidden-480">宿舍</th>
                                                <th class="hidden-480">学费</th>
                                                <th class="hidden-480">学籍</th>
                                                <th class="hidden-480">联系电话</th>
                                                <th >操作</th>
                                            </tr>

                                            </thead>

                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <tr class="odd gradeX">
                                                    <td>${item.name}</td>
                                                    <td>${item.clazzDic.dicValue}</td>
                                                    <td>${item.majorDic.dicValue}</td>
                                                    <td>${item.dormitoryDic.dicValue}</td>
                                                    <td class="hidden-480">${item.tuition}</td>
                                                    <td class="hidden-480">${item.schoolNo}</td>
                                                    <td class="hidden-480">${item.phone}</td>
                                                    <td >
                                                        <a class="btn red" data-toggle = "modal" data-id= "${item.id}" data-target="#static">删除</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <%@include file="pagination.jsp"%>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<div id="static" class="modal hide fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-body">
        <p>是否确定删除?</p>
    </div>
    <form id="modelDeleteForm" action="/admin/member/delete" method="post">
        <input type="hidden" name="memberId">
        <input type="hidden" name="roleType" value="${param.roleType}">
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">否</button>
            <button type="button" data-dismiss="modal" class="btn green" onclick="doDelete()">是</button>
        </div>
    </form>
</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
        $('#static').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var memberId = btnThis.data("id");
            $(this).find('input[name=memberId]').val(memberId);
        });

    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>

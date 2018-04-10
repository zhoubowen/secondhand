<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=0" flush="true"/>

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
                            <a href="/admin/member/index">商品管理</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">商品列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>商品列表
                            </div>
                        </div>

                        <div class="portlet-body">

                            <div class="tabbable tabbable-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="/admin/goods/index">全部</a></li>
                                    <li class="${param.status == 1 ? 'active' : ''}"><a href="/admin/goods/index?deleted=1">已删除</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>商品标题</th>
                                                <th class="hidden-480">描述</th>
                                                <th class="hidden-480">发布人</th>
                                                <th class="hidden-480">发布时间</th>
                                                <th class="hidden-480">价格</th>
                                                <th class="hidden-480">浏览数</th>
                                                <th >操作</th>
                                            </tr>

                                            </thead>

                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <tr class="odd gradeX">
                                                    <td>${item.title}</td>
                                                    <td>${item.description}</td>
                                                    <td class="hidden-480">${item.member.name}</td>
                                                    <td class="hidden-480">
                                                        <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                    <td class="hidden-480">${item.price}</td>
                                                    <td class="hidden-480">${item.views}</td>
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
    <form id="modelDeleteForm" action="/admin/ask/update" method="post">
        <input type="hidden" name="id">
        <input type="hidden" name="deleted" value="1">
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
            $(this).find('input[name=id]').val(memberId);
        });
    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>

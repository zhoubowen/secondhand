<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=2" flush="true"/>

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
                            <a href="/admin/member/index">教学视频管理</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">教学视频列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>教学视频列表
                            </div>
                        </div>

                        <div class="portlet-body">

                            <a class="btn green" href="/admin/video/input">添加视频</a>

                            <hr/>

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>视频标题</th>
                                    <th class="hidden-480">简介</th>
                                    <th class="hidden-480">查看</th>
                                    <th class="hidden-480">发布时间</th>
                                    <th >操作</th>
                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <tr class="odd gradeX">
                                        <td>${item.title}</td>
                                        <td class="hidden-480">${item.descript}</td>
                                        <td class="center hidden-480">
                                            <a class=" btn blue btn-large" data-toggle="modal" data-url="${item.url}" href="#long">查看</a>
                                        </td>
                                        <td class="hidden-480">
                                            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>

                                        <td >
                                            <a class="btn red" data-toggle = "modal" data-id= "${item.id}" data-target="#static">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

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
    <form id="modelDeleteForm" action="/admin/video/delete" method="post">
        <input type="hidden" name="id">
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">否</button>
            <button type="button" data-dismiss="modal" class="btn green" onclick="doDelete()">是</button>
        </div>
    </form>
</div>



<div id="long" class="modal hide fade" tabindex="-1" data-replace="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h3>视频播放</h3>
    </div>
    <div class="modal-body">
        <video id="video_comp" src="" controls="controls" width="100%">
            your browser does not support the video tag
        </video>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn">关闭</button>
    </div>

</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();

        $('#static').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var videoId = btnThis.data("id");
            $(this).find('input[name=id]').val(videoId);
        });

        $('#long').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var url = btnThis.data("url");
            $(this).find('#video_comp').attr("src", url);
        });
    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>

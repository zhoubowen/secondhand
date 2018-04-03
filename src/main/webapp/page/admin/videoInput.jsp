<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                        <li><a href="#">添加教学视频</a></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>添加教学视频</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/video/save" class="form-horizontal" method="post">

                                <div class="control-group">
                                    <label class="control-label">标题</label>
                                    <div class="controls">
                                        <input type="text" name="title" class="span6 m-wrap" value="${member.account}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">描述</label>
                                    <div class="controls">
                                        <textarea name="descript"></textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">上传视频</label>
                                    <div class="controls">
                                        <input id="video-url" type="hidden" name="url">
                                        <span id="video-url-view"></span>
                                        <input type="button" id="ke-upload-button" value="上传视频" />
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn blue">保存</button>
                                    <a class="btn" href="javascript:history.go(-1)">返回</a>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();


        KindEditor.ready(function(K) {
            var uploadbutton = K.uploadbutton({
                button : K('#ke-upload-button')[0],
                url : '/upload/uploadForEditor',
                afterUpload : function(data) {
                    console.log(data)
                    if (data.error === 0) {
                        $("#video-url").val(data.url);
                        $("#video-url-view").text(data.url);
                    } else {
                        alert(data.message);
                    }
                }
            });
            uploadbutton.fileBox.change(function(e) {
                uploadbutton.submit();
            });
        });

    });

</script>
</body>
</html>

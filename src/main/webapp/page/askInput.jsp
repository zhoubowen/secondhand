<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=2"/>

<div class="page-container">

    <div class="space12">
        <div class="span3 sidebar-content ">
            <jsp:include page="memberProfileMenu.jsp?t=2"/>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>我要提问</div>
                        </div>

                        <div class="portlet-body form">

                            <form action="/member/askSave" class="form-horizontal" method="post">

                                <div class="control-group">
                                    <label class="control-label">标题</label>
                                    <div class="controls">
                                        <input type="text" name="title" class="span6 m-wrap" value="">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">描述</label>
                                    <div class="controls">
                                        <textarea id="editor_id" name="descript" style="width:90%;height:300px;">
                                        </textarea>
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

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();

        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id', {
                uploadJson : '/upload/uploadForEditor',
                fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                filePostName : 'file'
            });

        });

    });
    
</script>

</body>
</html>

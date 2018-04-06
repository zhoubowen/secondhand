<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=2"/>

<div class="page-container">

    <div class="space12">
        <div class="span3 sidebar-content ">
            <jsp:include page="memberProfileMenu.jsp?t=1"/>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>个人信息修改</div>
                        </div>

                        <div class="portlet-body form">

                            <form action="/member/memberSave" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${member.id}"/>

                                <div class="control-group">
                                    <label class="control-label">昵称</label>
                                    <div class="controls">
                                        <input type="text" name="name" class="span6 m-wrap" value="${member.name}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">邮箱</label>
                                    <div class="controls">
                                        <input type="text" name="email" class="span6 m-wrap" value="${member.email}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">手机号码</label>
                                    <div class="controls">
                                        <input type="text" name="phone" class="span6 m-wrap" value="${member.phone}">
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
    
    function doInfo(i) {
        switch(i)
        {
            case 1:
                window.location.href = "/member/info";
                break;
            case 2:
                window.location.href = "/member/supply?type=0";
                break;
            case 3:
                window.location.href = "/member/supply?type=1";
                break;
            case 4:
                window.location.href = "/comment/list";
                break;
            default:
                window.location.href = "/member/supply?type=0";
        }
    }
</script>

</body>
</html>

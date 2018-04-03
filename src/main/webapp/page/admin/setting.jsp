<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                            <a href="/admin/member/index">系统设置</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">提问阈值设置</a></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>提问阈值设置</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/setting/update" class="form-horizontal" method="post">
                                <input type="hidden" name="id" class="span6 m-wrap" value="${setting.id}">

                                <div class="control-group">
                                    <label class="control-label">提问阈值</label>
                                    <div class="controls">
                                        <input type="text" name="sValue" class="span6 m-wrap" value="${setting.sValue}">
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
    });

</script>
</body>
</html>

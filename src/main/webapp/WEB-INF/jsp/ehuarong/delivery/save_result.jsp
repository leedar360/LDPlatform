<%--
  Created by IntelliJ IDEA.
  User: wp
  Date: 2018-04-04
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">

    <!-- jsp文件头和头部 -->
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="static/ace/css/colorbox.css"/>
    <%@ include file="../../system/index/top.jsp" %>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="hr hr-18 dotted hr-double"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <div id="zhongxin" style="padding-top: 13px;">
                            <div class="well well-sm">

                                <table style="width:50%" id="table_report" class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;" id="FILEPATHn">上传成功条数:</td>
                                        <td style="padding-top: 20px;">${successed}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="hr hr-16 hr-dotted"></div>
                            <div>
                                <ul class="ace-thumbnails clearfix" id="imgList">
                                    <!-- #section:pages/gallery -->
                                    <li style="display: none;">
                                        <a href="" data-rel="colorbox">
                                            <img width="150" height="150" alt="150x150" src=""/>
                                        </a>
                                    </li>
                                </ul>
                            </div><!-- PAGE CONTENT ENDS -->

                            <div class="hr hr-18 dotted hr-double"></div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->


    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<script src="static/ace/js/jquery.colorbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    $(function () {
        //上传
        $('#excel').ace_file_input({
            no_file: '请选择EXCEL ...',
            btn_choose: '选择',
            btn_change: '更改',
            droppable: false,
            onchange: null,
            thumbnail: false, //| true | large
            whitelist: 'xls|xls',
            blacklist: 'gif|png|jpg|jpeg'
            //onchange:''
        });
    });

    //保存
    function save() {
        if ($("#excel").val() == "" || document.getElementById("excel").files[0] == '请选择xls格式的文件') {

            $("#excel").tips({
                side: 3,
                msg: '请选择文件',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }

    function fileType(obj) {
        var fileType = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
        if (fileType != '.xls') {
            $("#excel").tips({
                side: 3,
                msg: '请上传xls格式的文件',
                bg: '#AE81FF',
                time: 3
            });
            $("#excel").val('');
            document.getElementById("excel").files[0] = '请选择xls格式的文件';
        }
    }
</script>


</body>
</html>
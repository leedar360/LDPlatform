<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css"/>
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp" %>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css"/>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">

						<!-- 检索  -->
						<form action="purchase/list.do" method="post" name="Form" id="Form">
							<table style="margin-top:5px;">
								<tr>
									<td>
										<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input"
												   id="nav-search-input" autocomplete="off" name="keywords"
												   value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
										</div>
									</td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="lastStart"
																		 id="lastStart" value="" type="text"
																		 data-date-format="yyyy-mm-dd" readonly="readonly"
																		 style="width:88px;" placeholder="开始日期" title="开始日期"/>
									</td>
									<td style="padding-left:2px;"><input class="span10 date-picker" name="lastEnd" name="lastEnd"
																		 value="" type="text" data-date-format="yyyy-mm-dd"
																		 readonly="readonly" style="width:88px;"
																		 placeholder="结束日期" title="结束日期"/></td>
									<td style="vertical-align:top;padding-left:2px;">
										<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择"
												style="vertical-align:top;width: 120px;">
											<option value=""></option>
											<option value="">全部</option>
											<option value="">1</option>
											<option value="">2</option>
										</select>
									</td>
									<!-- 商品编码 -->
									<td>
										<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入商品编码" class="nav-search-input"
												   id="nav-EXTGOOD_ID-input" autocomplete="off" name="EXTGOOD_ID"
												   value="${pd.EXTGOOD_ID }" placeholder="这里输入商品编码"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
										</div>
									</td>
									<!-- 商品编码  -->
									<c:if test="${QX.cha == 1 }">
										<td style="vertical-align:top;padding-left:2px">
											<a class="btn btn-light btn-xs" onclick="tosearch();" title="检索">
												<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>
											</a>
										</td>
									</c:if>
									<c:if test="${QX.toExcel == 1 }">
										<td style="vertical-align:top;padding-left:2px;">
											<a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL">
												<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i>
											</a>
										</td>
									</c:if>
									<c:if test="${QX.toExcel == 1 }">
										<td style="vertical-align:top;padding-left:2px;">
											<input type="hidden" name="selectIds">
											<a class="btn btn-light btn-xs" onclick="toPurchase();" title="采购">
												<i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i>
											</a>
										</td>
									</c:if>
								</tr>
							</table>
							<!-- 检索  -->

							<table id="simple-table" class="table table-striped table-bordered table-hover"
								   style="margin-top:5px;">
								<thead>
								<tr>
									<th class="center" style="width:35px;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox"/><span
												class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">订单编号</th>
									<th class="center">订单数量</th>
									<th class="center">商品编码</th>
									<th class="center">发件人</th>
									<th class="center">发件电话</th>
									<th class="center">收件人</th>
									<th class="center">收件电话</th>
									<th class="center" style="width:20px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">收件地址</th>
									<th class="center">快递公司</th>
									<th class="center">快递单号</th>
									<th class="center">商品售价单价</th>
									<th class="center">商品售价总价</th>
									<th class="center">商品采购单价</th>
									<th class="center">商品采购总价</th>
									<th class="center">所属平台id</th>
									<th class="center">供应商id</th>
									<th class="center">供应商email</th>
									<th class="center">创建时间</th>
									<th class="center">备注</th>
									<th class="center">商品编号</th>
								</tr>
								</thead>

								<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
										<c:if test="${QX.cha == 1 }">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<tr>
													<td class='center'>
														<label class="pos-rel"><input type='checkbox' name='ids'
																					  value="${var.ORDERINFO_ID}"
																					  class="ace"/><span
																class="lbl"></span></label>
													</td>
													<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class='center'>${var.ODER_ID}</td>
													<td class='center'>${var.GOODNUM}</td>
													<td class='center'>${var.EXTGOOD_ID}</td>
													<td class='center'>${var.SELLNAME}</td>
													<td class='center'>${var.SELLPHONE}</td>
													<td class='center'>${var.RECNAME}</td>
													<td class='center'>${var.RECPHONE}</td>
													<td class='center'>${var.RECADDRESS}</td>
													<td class='center'>${var.EXPRESS}</td>
													<td class='center'>${var.EXPRESSNO}</td>
													<td class='center'>${var.SELLPRICE}</td>
													<td class='center'>${var.SELLTOTALPRICE}</td>
													<td class='center'>${var.PURCHASEPRICE}</td>
													<td class='center'>${var.PURCHASETOTALPRICE}</td>
													<td class='center'>${var.PLATFORMID}</td>
													<td class='center'>${var.SUPPLIER_ID}</td>
													<td class='center'>${var.SUPPLIER_EMAIL}</td>
													<td class='center'>${var.CREATETIME}</td>
													<td class='center'>${var.REMARK}</td>
													<td class='center'>${var.EXTGOOD_ID}</td>
												</tr>

											</c:forEach>
										</c:if>
										<c:if test="${QX.cha == 0 }">
											<tr>
												<td colspan="100" class="center">您无权查看</td>
											</tr>
										</c:if>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<div class="page-header position-relative">
								<table style="width:100%;">
									<tr>
										<td style="vertical-align:top;">
											<div class="pagination"
												 style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
										</td>
									</tr>
								</table>
							</div>
						</form>

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
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());//关闭加载状态
    //检索
    function tosearch() {
        top.jzts();
        $("#Form").submit();
    }

    $(function () {

        //日期框
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        });

        //下拉框
        if (!ace.vars['touch']) {
            $('.chosen-select').chosen({allow_single_deselect: true});
            $(window)
                .off('resize.chosen')
                .on('resize.chosen', function () {
                    $('.chosen-select').each(function () {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    });
                }).trigger('resize.chosen');
            $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                if (event_name != 'sidebar_collapsed') return;
                $('.chosen-select').each(function () {
                    var $this = $(this);
                    $this.next().css({'width': $this.parent().width()});
                });
            });
            $('#chosen-multiple-style .btn').on('click', function (e) {
                var target = $(this).find('input[type=radio]');
                var which = parseInt(target.val());
                if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                else $('#form-field-select-4').removeClass('tag-input-style');
            });
        }


        //复选框全选控制
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
            var th_checked = this.checked;//checkbox inside "TH" table header
            $(this).closest('table').find('tbody > tr').each(function () {
                var row = this;
                if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });
    });

    //批量操作
    function makeAll(msg) {
        bootbox.confirm(msg, function (result) {
            if (result) {
                var str = '';
                for (var i = 0; i < document.getElementsByName('ids').length; i++) {
                    if (document.getElementsByName('ids')[i].checked) {
                        if (str == '') str += document.getElementsByName('ids')[i].value;
                        else str += ',' + document.getElementsByName('ids')[i].value;
                    }
                }
                if (str == '') {
                    bootbox.dialog({
                        message: "<span class='bigger-110'>您没有选择任何内容!</span>",
                        buttons:
                            {"button": {"label": "确定", "className": "btn-sm btn-success"}}
                    });
                    $("#zcheckbox").tips({
                        side: 1,
                        msg: '点这里全选',
                        bg: '#AE81FF',
                        time: 8
                    });
                    return;
                } else {
                    if (msg == '确定要删除选中的数据吗?') {
                        top.jzts();
                        $.ajax({
                            type: "POST",
                            url: '<%=basePath%>orderinfo/deleteAll.do?tm=' + new Date().getTime(),
                            data: {DATA_IDS: str},
                            dataType: 'json',
                            //beforeSend: validateData,
                            cache: false,
                            success: function (data) {
                                $.each(data.list, function (i, list) {
                                    tosearch();
                                });
                            }
                        });
                    }
                }
            }
        });
    };

    //导出excel
    function toExcel() {
        window.location.href = '<%=basePath%>orderinfo/excel.do';
    }

    //采购
	function toPurchase() {
        var str = '';
        for (var i = 0; i < document.getElementsByName('ids').length; i++) {
            if (document.getElementsByName('ids')[i].checked) {
                if (str == '') str += document.getElementsByName('ids')[i].value;
                else str += ',' + document.getElementsByName('ids')[i].value;
            }
        }
        if (str == '') {
            bootbox.dialog({
                message: "<span class='bigger-110'>您没有选择任何内容!</span>",
                buttons:
                    {"button": {"label": "确定", "className": "btn-sm btn-success"}}
            });
            $("#zcheckbox").tips({
                side: 1,
                msg: '点这里全选',
                bg: '#AE81FF',
                time: 8
            });
            return;
        } else {
            top.jzts();
            $('#selectIds').val(str);
            $("#Form").attr('action',"purchase/toPurchase.do");
            $("#Form").submit();
        }
	}
</script>


</body>
</html>
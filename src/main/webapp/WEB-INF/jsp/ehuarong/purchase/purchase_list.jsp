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

									<!-- 商品编码 -->
									<td>
										<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入商品编码" class="nav-search-input"
												   id="nav-search-input" autocomplete="off" name="keywords"
												   value="${pd.keywords }" placeholder="这里输入商品编码，订单编号"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
										</div>
									</td>
									<!-- 商品编码  -->
									<c:if test="${QX.cha == 1 }">
										<td style="vertical-align: middle;padding-left:2px">&nbsp;&nbsp;
											<a class="btn btn-light btn-xs" onclick="tosearch();" title="检索">
												<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue">检索</i>
											</a>&nbsp;&nbsp;
										</td>

										<td style="vertical-align:middle;padding-left:2px;">
											<input type="hidden" name="selectIds">
											<a class="btn btn-mini btn-success" onclick="toPurchase()" title="采购">
												按商品采购
											</a>   <FONT color="red"> Note: 按照 订单编号 或者 平台商品编号 搜索结果统一采购</FONT>
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
									<th class="center" colspan="2">收件信息</th>
									<th class="center">商品售价单价</th>
									<th class="center">所属平台</th>
									<th class="center">平台商品编号</th>
									<th class="center">平台商品描述</th>
									<th class="center">操作</th>
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
													<td class='center'><textarea readonly>收件人：${var.RECNAME}
电话：${var.RECPHONE}</textarea></td>
                                                    <td class='center'><textarea readonly>地址：${var.RECADDRESS}</textarea></td>
													<td class='center'>${var.SELLPRICE}</td>
													<td class='center'>${var.PLATFORMID}</td>
													<td class='center'>${var.EXTGOOD_ID}</td>
													<td class='center'><textarea readonly>${var.EXTGOODS_NAME}</textarea></td>
													<td class="center">
														<c:if test="${QX.edit != 1 && QX.del != 1 }">
															<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
														</c:if>
														<div class="hidden-sm hidden-xs btn-group">
															<c:if test="${QX.edit == 1 }">
																<a class="btn btn-xs btn-success" title="向供应商采购" onclick="toOrderItemPurchase('${var.ORDERINFO_ID}');">
																	采购该单
																</a>&nbsp;
																<a class="btn btn-xs btn-success" title="向第三方平台临时采购（淘宝、京东等）" onclick="purchase_other_edit('${var.ORDERINFO_ID}');">
																	临采该单
																</a><br>
                                                                <a class="btn btn-xs btn-danger" title="转不发货" onclick="no_purchase_action('${var.ORDERINFO_ID}', '${var.ODER_ID}');">
                                                                    转不发货
                                                                </a>
															</c:if>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																	<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																</button>

																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<c:if test="${QX.edit == 1 }">
																		<li>
																			<a style="cursor:pointer;" onclick="toOrderItemPurchase('${var.ORDERINFO_ID}');" class="tooltip-success" data-rel="tooltip" title="采购">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																			</a>
																		</li>
																	</c:if>
																</ul>
															</div>
														</div>
													</td>
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

    //单个订单采购
    function toOrderItemPurchase(Id) {
        top.jzts();
        var diag = new top.Dialog();
        diag.Drag = true;
        diag.Title = "采购";
        diag.URL = '<%=basePath%>purchase/toPurchase.do?selectIds='+Id;
        diag.Width = 800;
        diag.Height = 600;
        diag.Modal = true;				//有无遮罩窗口
        diag.ShowMaxButton = true;	//最大化按钮
        diag.ShowMinButton = true;		//最小化按钮
        diag.CancelEvent = function () { //关闭事件
            if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
                if ('${page.currentPage}' == '0') {
                    tosearch();
                } else {
                    tosearch();
                }
            }
            diag.close();
        };
        diag.show();
    }

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


    //其他平台采购修改
    function purchase_other_edit(Id){
        top.jzts();
        var diag = new top.Dialog();
        diag.Drag=true;
        diag.Title ="编辑";
        diag.URL = '<%=basePath%>purchase/goPurchase_other.do?ORDERINFO_ID='+Id;
        diag.Width = 800;
        diag.Height = 600;
        diag.Modal = true;				//有无遮罩窗口
        diag. ShowMaxButton = true;	//最大化按钮
        diag.ShowMinButton = true;		//最小化按钮
        diag.CancelEvent = function(){ //关闭事件
            if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                tosearch();
            }
            diag.close();
        };
        diag.show();
    }


    //转不发货
    function no_purchase_action(Id,orderID){

        bootbox.confirm("确定对 "+orderID+" 转不发货处理吗? 确定后将在《订单信息管理》管理该订单", function (result) {
            if (result) {
                top.jzts();
                var url = "<%=basePath%>purchase/goNo_purchase_action.do?ORDERINFO_ID=" + Id + "&tm=" + new Date().getTime();;
                $.get(url, function (data) {
                    tosearch();
                });
            }
        });

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
            var diag = new top.Dialog();
            diag.Drag = true;
            diag.Title = "采购";
            diag.URL = '<%=basePath%>purchase/toPurchase.do?selectIds='+str;
            diag.Width = 800;
            diag.Height = 600;
            diag.Modal = true;				//有无遮罩窗口
            diag.ShowMaxButton = true;	//最大化按钮
            diag.ShowMinButton = true;		//最小化按钮
            diag.CancelEvent = function () { //关闭事件
                if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
                    if ('${page.currentPage}' == '0') {
                        tosearch();
                    } else {
                        tosearch();
                    }
                }
                diag.close();
            };
            diag.show();

            //top.jzts();
            //$('#selectIds').val(str);
            //$("#Form").attr('action',"purchase/toPurchase.do");
            //$("#Form").submit();
        }
	}
</script>


</body>
</html>
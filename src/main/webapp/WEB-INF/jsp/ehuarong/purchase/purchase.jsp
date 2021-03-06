<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<div id="zhongxin" style="padding-top: 13px;">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">

						<!-- 检索  -->
						<form action="purchase/toPurchase.do" method="post" name="Form" id="Form">
							<input type="hidden" name="selectOrderIds" id="selectOrderIds" value="${selectIds}">
							<table style="margin-top:5px;">
								<tr>
									<td>
										<div class="nav-search">
											<span class="input-icon">
												<input type="text" placeholder="这里输入商品名称搜索 支持模糊搜索" class="nav-search-input" id="nav-search-input" autocomplete="off" name="goodName" value="${pd.goodName}" />
												<i class="ace-icon fa fa-search nav-search-icon"></i>
											</span>
										</div>
									</td>

									<c:if test="${QX.cha == 1 }">
									<td style="vertical-align:middle;padding-left:2px">
										<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索">
											<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue">检索</i>
										</a>
									</td>


									<td style="vertical-align:middle;padding-left:2px">
										<a class="btn btn-mini btn-success" onclick="makeAll('确定对选中的商品供应商采购吗?');" title="采购" >确定采购
										</a>
									</td>
									</c:if>

								</tr>
							</table>
						<!-- 检索  -->

						<!-- 当前采购信息  -->
							<table id="table_report1" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
									<td>${orderinfopd.ODER_ID}</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">订单数量:</td>
									<td>${orderinfopd.GOODNUM}</td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">发件人:</td>
									<td>${orderinfopd.SELLNAME}</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">发件电话:</td>
									<td>${orderinfopd.SELLPHONE}</td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
									<td>${orderinfopd.EXTGOOD_ID}</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
									<td>${orderinfopd.EXTGOODS_NAME}</td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">收件人:</td>
									<td>${orderinfopd.RECNAME}</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">收件电话:</td>
									<td>${orderinfopd.RECPHONE}</td>
								</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">售价单价:</td>
									<td ><B>${orderinfopd.SELLPRICE}</B></td>
									<td style="width:75px;text-align: right;padding-top: 13px;">收件地址:</td>
									<td >${orderinfopd.RECADDRESS}</td>
								</tr>
							</table>

							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">

									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">供应商id</th>
									<th class="center">供应商</th>
									<th class="center">供应价格</th>
									<th class="center">商品名称</th>
									<th class="center">单位</th>
									<th class="center">规格</th>
									<th class="center">说明</th>
									<th class="center">备注</th>
									<th class="center">有效时间start</th>
									<th class="center">有效时间end</th>
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
												<label class="pos-rel"><input type='radio' name='ids' value="${var.SUPLYGOODINFO_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.SUPPLIER_ID}</td>
											<td class='center'>${var.SUPPLIERNAME}</td>
											<td class='center'>${var.SUPLYPRICE}</td>
											<td class='center'><B>${var.GOODNAME}</B></td>
											<td class='center'>${var.UNIT}</td>
											<td class='center'>${var.SPEC}</td>
											<td class='center'><textarea readonly>${var.MEMO}</textarea></td>
											<td class='center'>${var.REMARK}</td>
											<td class='center'>${var.STARTTIME}</td>
											<td class='center'>${var.ENDTIME}</td>

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
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
							<table style="width:100%; align-content: center">
								<tr>

								</tr>
							</table>
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	</div>
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
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
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var count = 0;
					var selectOrderIds = $("#selectOrderIds").val();
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					      count ++;
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
					    if(count > 1){
                            bootbox.dialog({
                                message: "<span class='bigger-110'>您选中多个商品供应商!</span>",
                                buttons:
                                    { "button":{ "label":"确定", "className":"btn-sm btn-success"}}
                            });
						}

						if(msg == '确定对选中的商品供应商采购吗?'){
							//top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>purchase/purchase.do',
						    	data: {DATA_IDS:str, SELECT_ORDER_ID:selectOrderIds},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
								    //alert(data['msg']);
									 $.each(data.list, function(i, list){
									     //alert(list);
                                         //alert(list[msg]);
                                         bootbox.alert("采购成功", function(){
											 document.getElementById('zhongxin').style.display = 'none';
											 top.Dialog.close();
                                             //window.parent.frames.mainFrame.location.reload();
                                             window.parent.frames.mainFrame.location.href='<%=basePath%>purchase/list.do';
										 });

									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>suplygoodinfo/excel.do';
		}
	</script>


</body>
</html>
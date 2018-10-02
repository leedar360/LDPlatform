<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="purchase/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDERINFO_ID" id="ORDERINFO_ID" value="${pd.ORDERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report1" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td>${pd.ODER_ID}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单数量:</td>
								<td>${pd.GOODNUM}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发件人:</td>
								<td>${pd.SELLNAME}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">发件电话:</td>
								<td>${pd.SELLPHONE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
								<td>${pd.EXTGOOD_ID}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
								<td>${pd.EXTGOODS_NAME}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件人:</td>
								<td>${pd.RECNAME}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件电话:</td>
								<td>${pd.RECPHONE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">售价单价:</td>
								<td ><B>${pd.SELLPRICE}</B></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件地址:</td>
								<td >${pd.RECADDRESS}</td>
							</tr>
							</table>

							<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品采购单价:</td>
								<td><input type="number" name="PURCHASEPRICE" id="PURCHASEPRICE" value="" maxlength="32" placeholder="这里输入商品采购单价" title="商品采购单价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属平台:</td>
								<td>${pd.PLATFORMID}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商 :</td>
								<td>
									<input type="text" name="SUPPLIERNAME" id="SUPPLIERNAME" value="" maxlength="255" placeholder="这里输入供应商名称" title="供应商" style="width:98%;"/>
									<input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID" value="other"/>
									<input type="hidden" name="SUPPLIER_EMAIL" id="SUPPLIER_EMAIL" value="otheremail"/>
									<input type="hidden" name="GOODNUM" id="GOODNUM" value="${pd.GOODNUM}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><textarea rows="" cols="" name="REMARK" id="REMARK"   placeholder="这里输入备注，采购单号请写入此处" title="备注" style="width:98%;">${pd.REMARK}</textarea></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<input type="hidden" name="status" id="status" value="2" />
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){

			if($("#EXPRESS").val()==""){
				$("#EXPRESS").tips({
					side:3,
		            msg:'请输入快递公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPRESS").focus();
			return false;
			}
			if($("#EXPRESSNO").val()==""){
				$("#EXPRESSNO").tips({
					side:3,
		            msg:'请输入快递单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPRESSNO").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>
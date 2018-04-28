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
					
					<form action="orderinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDERINFO_ID" id="ORDERINFO_ID" value="${pd.ORDERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td><input type="text" name="ODER_ID" id="ODER_ID" value="${pd.ODER_ID}" maxlength="255" placeholder="这里输入订单编号" title="订单编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
								<td><input type="text" name="EXTGOOD_ID" id="REMARK" value="${pd.EXTGOOD_ID}" maxlength="255" placeholder="这里输入商品编号" title="商品编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="商品状态：1 - 待采购；2 - 待发货" title="商品状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单数量:</td>
								<td><input type="text" name="GOODNUM" id="GOODNUM" value="${pd.GOODNUM}" maxlength="255" placeholder="这里输入订单数量" title="订单数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">采购商品描述:</td>
								<td><input type="text" name="EXTGOODS_NAME" id="EXTGOODS_NAME" value="${pd.EXTGOODS_NAME}" maxlength="255" placeholder="这里输入快递公司" title="快递公司" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发件人:</td>
								<td><input type="text" name="SELLNAME" id="SELLNAME" value="${pd.SELLNAME}" maxlength="255" placeholder="这里输入发件人" title="发件人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发件电话:</td>
								<td><input type="text" name="SELLPHONE" id="SELLPHONE" value="${pd.SELLPHONE}" maxlength="255" placeholder="这里输入发件电话" title="发件电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件人:</td>
								<td><input type="text" name="RECNAME" id="RECNAME" value="${pd.RECNAME}" maxlength="255" placeholder="这里输入收件人" title="收件人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件电话:</td>
								<td><input type="text" name="RECPHONE" id="RECPHONE" value="${pd.RECPHONE}" maxlength="255" placeholder="这里输入收件电话" title="收件电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">收件地址:</td>
								<td><input type="text" name="RECADDRESS" id="RECADDRESS" value="${pd.RECADDRESS}" maxlength="255" placeholder="这里输入收件地址" title="收件地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递公司:</td>
								<td><input type="text" name="EXPRESS" id="EXPRESS" value="${pd.EXPRESS}" maxlength="255" placeholder="这里输入快递公司" title="快递公司" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">快递单号:</td>
								<td><input type="text" name="EXPRESSNO" id="EXPRESSNO" value="${pd.EXPRESSNO}" maxlength="255" placeholder="这里输入快递单号" title="快递单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品售价单价:</td>
								<td><input type="number" name="SELLPRICE" id="SELLPRICE" value="${pd.SELLPRICE}" maxlength="32" placeholder="这里输入商品售价单价" title="商品售价单价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品售价总价:</td>
								<td><input type="number" name="SELLTOTALPRICE" id="SELLTOTALPRICE" value="${pd.SELLTOTALPRICE}" maxlength="32" placeholder="这里输入商品售价总价" title="商品售价总价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品采购单价:</td>
								<td><input type="number" name="PURCHASEPRICE" id="PURCHASEPRICE" value="${pd.PURCHASEPRICE}" maxlength="32" placeholder="这里输入商品采购单价" title="商品采购单价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品采购总价:</td>
								<td><input type="number" name="PURCHASETOTALPRICE" id="PURCHASETOTALPRICE" value="${pd.PURCHASETOTALPRICE}" maxlength="32" placeholder="这里输入商品采购总价" title="商品采购总价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属平台id:</td>
								<td><input type="text" name="PLATFORMID" id="PLATFORMID" value="${pd.PLATFORMID}" maxlength="255" placeholder="这里输入所属平台id" title="所属平台id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商id :</td>
								<td><input type="text" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}" maxlength="255" placeholder="这里输入供应商id " title="供应商id " style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商email:</td>
								<td><input type="text" name="SUPPLIER_EMAIL" id="SUPPLIER_EMAIL" value="${pd.SUPPLIER_EMAIL}" maxlength="255" placeholder="这里输入供应商email" title="供应商email" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="text-align: center;" colspan="10">
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
			if($("#ODER_ID").val()==""){
				$("#ODER_ID").tips({
					side:3,
		            msg:'请输入订单编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ODER_ID").focus();
			return false;
			}
			if($("#GOODNUM").val()==""){
				$("#GOODNUM").tips({
					side:3,
		            msg:'请输入订单数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODNUM").focus();
			return false;
			}
			if($("#SELLNAME").val()==""){
				$("#SELLNAME").tips({
					side:3,
		            msg:'请输入发件人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLNAME").focus();
			return false;
			}
			if($("#SELLPHONE").val()==""){
				$("#SELLPHONE").tips({
					side:3,
		            msg:'请输入发件电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLPHONE").focus();
			return false;
			}
			if($("#RECNAME").val()==""){
				$("#RECNAME").tips({
					side:3,
		            msg:'请输入收件人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECNAME").focus();
			return false;
			}
			if($("#RECPHONE").val()==""){
				$("#RECPHONE").tips({
					side:3,
		            msg:'请输入收件电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECPHONE").focus();
			return false;
			}
			if($("#RECADDRESS").val()==""){
				$("#RECADDRESS").tips({
					side:3,
		            msg:'请输入收件地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RECADDRESS").focus();
			return false;
			}
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
			if($("#SELLPRICE").val()==""){
				$("#SELLPRICE").tips({
					side:3,
		            msg:'请输入商品售价单价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLPRICE").focus();
			return false;
			}
			if($("#SELLTOTALPRICE").val()==""){
				$("#SELLTOTALPRICE").tips({
					side:3,
		            msg:'请输入商品售价总价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELLTOTALPRICE").focus();
			return false;
			}
			if($("#PURCHASEPRICE").val()==""){
				$("#PURCHASEPRICE").tips({
					side:3,
		            msg:'请输入商品采购单价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PURCHASEPRICE").focus();
			return false;
			}
			if($("#PURCHASETOTALPRICE").val()==""){
				$("#PURCHASETOTALPRICE").tips({
					side:3,
		            msg:'请输入商品采购总价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PURCHASETOTALPRICE").focus();
			return false;
			}
			if($("#PLATFORMID").val()==""){
				$("#PLATFORMID").tips({
					side:3,
		            msg:'请输入所属平台id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PLATFORMID").focus();
			return false;
			}
			if($("#SUPPLIER_ID").val()==""){
				$("#SUPPLIER_ID").tips({
					side:3,
		            msg:'请输入供应商id ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_ID").focus();
			return false;
			}
			if($("#SUPPLIER_EMAIL").val()==""){
				$("#SUPPLIER_EMAIL").tips({
					side:3,
		            msg:'请输入供应商email',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_EMAIL").focus();
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
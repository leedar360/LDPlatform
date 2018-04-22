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
					
					<form action="supplierinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUPPLIERINFO_ID" id="SUPPLIERINFO_ID" value="${pd.SUPPLIERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商id:</td>
								<td><input type="text" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}" maxlength="255" readonly title="供应商id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商名称:</td>
								<td><input type="text" name="SUPPLIERNAME" id="SUPPLIERNAME" value="${pd.SUPPLIERNAME}" maxlength="255" placeholder="这里输入供应商名称" title="供应商名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="CONTACT" id="CONTACT" value="${pd.CONTACT}" maxlength="255" placeholder="这里输入联系人" title="联系人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">email:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="255" placeholder="这里输入email" title="email" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入联系地址" title="联系地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开户银行:</td>
								<td><input type="text" name="BANK" id="BANK" value="${pd.BANK}" maxlength="255" placeholder="这里输入开户银行" title="开户银行" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行账号:</td>
								<td><input type="text" name="BANKNO" id="BANKNO" value="${pd.BANKNO}" maxlength="255" placeholder="这里输入银行账号" title="银行账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信:</td>
								<td><input type="text" name="WEIXIN" id="WEIXIN" value="${pd.WEIXIN}" maxlength="255" placeholder="这里输入微信" title="微信" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支付宝:</td>
								<td><input type="text" name="ZHIFUBAO" id="ZHIFUBAO" value="${pd.ZHIFUBAO}" maxlength="255" placeholder="这里输入支付宝" title="支付宝" style="width:98%;"/></td>
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
			if($("#SUPPLIER_ID").val()==""){
				$("#SUPPLIER_ID").tips({
					side:3,
		            msg:'请输入供应商id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIER_ID").focus();
			return false;
			}
			if($("#SUPPLIERNAME").val()==""){
				$("#SUPPLIERNAME").tips({
					side:3,
		            msg:'请输入供应商名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIERNAME").focus();
			return false;
			}
			if($("#CONTACT").val()==""){
				$("#CONTACT").tips({
					side:3,
		            msg:'请输入联系人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入email',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入联系地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#BANK").val()==""){
				$("#BANK").tips({
					side:3,
		            msg:'请输入开户银行',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANK").focus();
			return false;
			}
			if($("#BANKNO").val()==""){
				$("#BANKNO").tips({
					side:3,
		            msg:'请输入银行账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKNO").focus();
			return false;
			}
			if($("#WEIXIN").val()==""){
				$("#WEIXIN").tips({
					side:3,
		            msg:'请输入微信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WEIXIN").focus();
			return false;
			}
			if($("#ZHIFUBAO").val()==""){
				$("#ZHIFUBAO").tips({
					side:3,
		            msg:'请输入支付宝',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ZHIFUBAO").focus();
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
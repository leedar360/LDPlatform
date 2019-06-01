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
					
					<form action="bankinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="BANKINFO_ID" id="BANKINFO_ID" value="${pd.BANKINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户口名称:</td>
								<td><input type="text" name="ACCOUNTNAME" id="ACCOUNTNAME" value="${pd.ACCOUNTNAME}" maxlength="255" placeholder="这里输入户口名称" title="户口名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户口名称缩写:</td>
								<td><input type="text" name="ACCOUNTNAME_ABBRE" id="ACCOUNTNAME_ABBRE" value="${pd.ACCOUNTNAME_ABBRE}" maxlength="255" placeholder="这里输入户口名称缩写" title="户口名称缩写" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属银行名称:</td>
								<td><input type="text" name="BANKNAME" id="BANKNAME" value="${pd.BANKNAME}" maxlength="255" placeholder="这里输入所属银行名称" title="所属银行名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行账号:</td>
								<td><input type="text" name="BANKACCOUNT" id="BANKACCOUNT" value="${pd.BANKACCOUNT}" maxlength="255" placeholder="这里输入银行账号" title="银行账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址:</td>
								<td><input type="text" name="BANKADDRESS" id="BANKADDRESS" value="${pd.BANKADDRESS}" maxlength="255" placeholder="这里输入银行地址" title="银行地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行swiftcode:</td>
								<td><input type="text" name="SWIFTCODE" id="SWIFTCODE" value="${pd.SWIFTCODE}" maxlength="255" placeholder="这里输入银行swiftcode" title="银行swiftcode" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" maxlength="100" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司地址:</td>
								<td><input type="text" name="COMPANYADDRESS" id="COMPANYADDRESS" value="${pd.COMPANYADDRESS}" maxlength="255" placeholder="这里输入公司地址" title="公司地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注说明:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注说明" title="备注说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行id:</td>
								<td><input type="text" name="BANK_ID" id="BANK_ID" value="${pd.BANK_ID}" maxlength="255" placeholder="这里输入银行id" title="银行id" style="width:98%;"/></td>
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
			if($("#ACCOUNTNAME").val()==""){
				$("#ACCOUNTNAME").tips({
					side:3,
		            msg:'请输入户口名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCOUNTNAME").focus();
			return false;
			}
			if($("#ACCOUNTNAME_ABBRE").val()==""){
				$("#ACCOUNTNAME_ABBRE").tips({
					side:3,
		            msg:'请输入户口名称缩写',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCOUNTNAME_ABBRE").focus();
			return false;
			}
			if($("#BANKNAME").val()==""){
				$("#BANKNAME").tips({
					side:3,
		            msg:'请输入所属银行名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKNAME").focus();
			return false;
			}
			if($("#BANKACCOUNT").val()==""){
				$("#BANKACCOUNT").tips({
					side:3,
		            msg:'请输入银行账号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKACCOUNT").focus();
			return false;
			}
			if($("#BANKADDRESS").val()==""){
				$("#BANKADDRESS").tips({
					side:3,
		            msg:'请输入银行地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS").focus();
			return false;
			}
			if($("#SWIFTCODE").val()==""){
				$("#SWIFTCODE").tips({
					side:3,
		            msg:'请输入银行swiftcode',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SWIFTCODE").focus();
			return false;
			}
			if($("#CREATETIME").val()==""){
				$("#CREATETIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATETIME").focus();
			return false;
			}
			if($("#COMPANYADDRESS").val()==""){
				$("#COMPANYADDRESS").tips({
					side:3,
		            msg:'请输入公司地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANYADDRESS").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#BANK_ID").val()==""){
				$("#BANK_ID").tips({
					side:3,
		            msg:'请输入银行id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANK_ID").focus();
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
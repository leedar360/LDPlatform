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
					
					<form action="supplierldhkinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUPPLIERINFO_ID" id="SUPPLIERINFO_ID" value="${pd.SUPPLIERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商ID:</td>
								<td><input type="text" name="SUPPLIER_ID" id="SUPPLIER_ID" value="${pd.SUPPLIER_ID}" maxlength="255" placeholder="这里输入供应商ID" title="供应商ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商名称:</td>
								<td><input type="text" name="SUPPLIERNAME" id="SUPPLIERNAME" value="${pd.SUPPLIERNAME}" maxlength="255" placeholder="这里输入供应商名称" title="供应商名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商名称缩写:</td>
								<td><input type="text" name="SUPPLIERNAME_ABBRE" id="SUPPLIERNAME_ABBRE" value="${pd.SUPPLIERNAME_ABBRE}" maxlength="255" placeholder="这里输入供应商名称缩写" title="供应商名称缩写" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行名称:</td>
								<td><input type="text" name="BANKNAME" id="BANKNAME" value="${pd.BANKNAME}" maxlength="255" placeholder="这里输入银行名称" title="银行名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行账号:</td>
								<td><input type="text" name="BANKACCOUNT" id="BANKACCOUNT" value="${pd.BANKACCOUNT}" maxlength="255" placeholder="这里输入银行账号" title="银行账号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址1:</td>
								<td><input type="text" name="BANKADDRESS1" id="BANKADDRESS1" value="${pd.BANKADDRESS1}" maxlength="255" placeholder="这里输入银行地址1" title="银行地址1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址2:</td>
								<td><input type="text" name="BANKADDRESS2" id="BANKADDRESS2" value="${pd.BANKADDRESS2}" maxlength="255" placeholder="这里输入银行地址2" title="银行地址2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址3:</td>
								<td><input type="text" name="BANKADDRESS3" id="BANKADDRESS3" value="${pd.BANKADDRESS3}" maxlength="255" placeholder="这里输入银行地址3" title="银行地址3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行swiftcode:</td>
								<td><input type="text" name="SWIFTCODE" id="SWIFTCODE" value="${pd.SWIFTCODE}" maxlength="255" placeholder="这里输入银行swiftcode" title="银行swiftcode" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司登记地址:</td>
								<td><input type="text" name="ADDRESS1" id="ADDRESS1" value="${pd.ADDRESS1}" maxlength="255" placeholder="这里输入公司登记地址" title="公司登记地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司登记地址2:</td>
								<td><input type="text" name="ADDRESS2" id="ADDRESS2" value="${pd.ADDRESS2}" maxlength="255" placeholder="这里输入公司登记地址2" title="公司登记地址2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司登记地址3:</td>
								<td><input type="text" name="ADDRESS3" id="ADDRESS3" value="${pd.ADDRESS3}" maxlength="255" placeholder="这里输入公司登记地址3" title="公司登记地址3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人1:</td>
								<td><input type="text" name="CONTACT1" id="CONTACT1" value="${pd.CONTACT1}" maxlength="255" placeholder="这里输入联系人1" title="联系人1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人2:</td>
								<td><input type="text" name="CONTACT2" id="CONTACT2" value="${pd.CONTACT2}" maxlength="255" placeholder="这里输入联系人2" title="联系人2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话1:</td>
								<td><input type="text" name="PHONE1" id="PHONE1" value="${pd.PHONE1}" maxlength="255" placeholder="这里输入联系电话1" title="联系电话1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话2:</td>
								<td><input type="text" name="PHONE2" id="PHONE2" value="${pd.PHONE2}" maxlength="255" placeholder="这里输入联系电话2" title="联系电话2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">email1:</td>
								<td><input type="text" name="EMAIL1" id="EMAIL1" value="${pd.EMAIL1}" maxlength="255" placeholder="这里输入email1" title="email1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">email2:</td>
								<td><input type="text" name="EMAIL2" id="EMAIL2" value="${pd.EMAIL2}" maxlength="255" placeholder="这里输入email2" title="email2" style="width:98%;"/></td>
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
		            msg:'请输入供应商ID',
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
			if($("#SUPPLIERNAME_ABBRE").val()==""){
				$("#SUPPLIERNAME_ABBRE").tips({
					side:3,
		            msg:'请输入供应商名称缩写',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPLIERNAME_ABBRE").focus();
			return false;
			}
			if($("#BANKNAME").val()==""){
				$("#BANKNAME").tips({
					side:3,
		            msg:'请输入银行名称',
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
			if($("#BANKADDRESS1").val()==""){
				$("#BANKADDRESS1").tips({
					side:3,
		            msg:'请输入银行地址1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS1").focus();
			return false;
			}
			if($("#BANKADDRESS2").val()==""){
				$("#BANKADDRESS2").tips({
					side:3,
		            msg:'请输入银行地址2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS2").focus();
			return false;
			}
			if($("#BANKADDRESS3").val()==""){
				$("#BANKADDRESS3").tips({
					side:3,
		            msg:'请输入银行地址3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS3").focus();
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
			if($("#ADDRESS1").val()==""){
				$("#ADDRESS1").tips({
					side:3,
		            msg:'请输入公司登记地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS1").focus();
			return false;
			}
			if($("#ADDRESS2").val()==""){
				$("#ADDRESS2").tips({
					side:3,
		            msg:'请输入公司登记地址2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS2").focus();
			return false;
			}
			if($("#ADDRESS3").val()==""){
				$("#ADDRESS3").tips({
					side:3,
		            msg:'请输入公司登记地址3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS3").focus();
			return false;
			}
			if($("#CONTACT1").val()==""){
				$("#CONTACT1").tips({
					side:3,
		            msg:'请输入联系人1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT1").focus();
			return false;
			}
			if($("#CONTACT2").val()==""){
				$("#CONTACT2").tips({
					side:3,
		            msg:'请输入联系人2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTACT2").focus();
			return false;
			}
			if($("#PHONE1").val()==""){
				$("#PHONE1").tips({
					side:3,
		            msg:'请输入联系电话1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE1").focus();
			return false;
			}
			if($("#PHONE2").val()==""){
				$("#PHONE2").tips({
					side:3,
		            msg:'请输入联系电话2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE2").focus();
			return false;
			}
			if($("#EMAIL1").val()==""){
				$("#EMAIL1").tips({
					side:3,
		            msg:'请输入email1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL1").focus();
			return false;
			}
			if($("#EMAIL2").val()==""){
				$("#EMAIL2").tips({
					side:3,
		            msg:'请输入email2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL2").focus();
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
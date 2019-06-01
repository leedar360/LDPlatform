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
					
					<form action="contractinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONTRACTINFO_ID" id="CONTRACTINFO_ID" value="${pd.CONTRACTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目ID:</td>
								<td><input type="text" name="PROJECTCODE" id="PROJECTCODE" value="${pd.PROJECTCODE}" maxlength="255" placeholder="这里输入项目ID" title="项目ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合同编号:</td>
								<td><input type="text" name="PONUMBER" id="PONUMBER" value="${pd.PONUMBER}" maxlength="255" placeholder="这里输入合同编号" title="合同编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">港币总金额:</td>
								<td><input type="number" name="HKD" id="HKD" value="${pd.HKD}" maxlength="32" placeholder="这里输入港币总金额" title="港币总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">人民币总金额:</td>
								<td><input type="number" name="CNY" id="CNY" value="${pd.CNY}" maxlength="32" placeholder="这里输入人民币总金额" title="人民币总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">美元总金额:</td>
								<td><input type="number" name="USD" id="USD" value="${pd.USD}" maxlength="32" placeholder="这里输入美元总金额" title="美元总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">其他货币:</td>
								<td><input type="number" name="OTHERCURRENCY" id="OTHERCURRENCY" value="${pd.OTHERCURRENCY}" maxlength="32" placeholder="这里输入其他货币" title="其他货币" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户ID:</td>
								<td><input type="text" name="CUSTOMERID" id="CUSTOMERID" value="${pd.CUSTOMERID}" maxlength="255" placeholder="这里输入客户ID" title="客户ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人1:</td>
								<td><input type="text" name="CONTACT1" id="CONTACT1" value="${pd.CONTACT1}" maxlength="50" placeholder="这里输入联系人1" title="联系人1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人2:</td>
								<td><input type="text" name="CONTACT2" id="CONTACT2" value="${pd.CONTACT2}" maxlength="50" placeholder="这里输入联系人2" title="联系人2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="PHONE1" id="PHONE1" value="${pd.PHONE1}" maxlength="50" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="PHONE2" id="PHONE2" value="${pd.PHONE2}" maxlength="50" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司名称:</td>
								<td><input type="text" name="COMPANYNAME" id="COMPANYNAME" value="${pd.COMPANYNAME}" maxlength="255" placeholder="这里输入公司名称" title="公司名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司名称缩写:</td>
								<td><input type="text" name="COMPANYNAME_ABBRE" id="COMPANYNAME_ABBRE" value="${pd.COMPANYNAME_ABBRE}" maxlength="255" placeholder="这里输入公司名称缩写" title="公司名称缩写" style="width:98%;"/></td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址:</td>
								<td><input type="text" name="BANKADDRESS1" id="BANKADDRESS1" value="${pd.BANKADDRESS1}" maxlength="255" placeholder="这里输入银行地址" title="银行地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址:</td>
								<td><input type="text" name="BANKADDRESS2" id="BANKADDRESS2" value="${pd.BANKADDRESS2}" maxlength="255" placeholder="这里输入银行地址" title="银行地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行地址:</td>
								<td><input type="text" name="BANKADDRESS3" id="BANKADDRESS3" value="${pd.BANKADDRESS3}" maxlength="255" placeholder="这里输入银行地址" title="银行地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">swiftcode:</td>
								<td><input type="text" name="SWIFTCODE" id="SWIFTCODE" value="${pd.SWIFTCODE}" maxlength="100" placeholder="这里输入swiftcode" title="swiftcode" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建日期:</td>
								<td><input class="span10 date-picker" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建日期" title="创建日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">计划执行时间:</td>
								<td><input class="span10 date-picker" name="PLANTIME" id="PLANTIME" value="${pd.PLANTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="计划执行时间" title="计划执行时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">remark:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入remark" title="remark" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户地址1:</td>
								<td><input type="text" name="CUSTOMERADDRESS1" id="CUSTOMERADDRESS1" value="${pd.CUSTOMERADDRESS1}" maxlength="255" placeholder="这里输入客户地址1" title="客户地址1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户地址:</td>
								<td><input type="text" name="CUSTOMERADDRESS2" id="CUSTOMERADDRESS2" value="${pd.CUSTOMERADDRESS2}" maxlength="255" placeholder="这里输入客户地址" title="客户地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户地址:</td>
								<td><input type="text" name="CUSTOMERADDRESS3" id="CUSTOMERADDRESS3" value="${pd.CUSTOMERADDRESS3}" maxlength="255" placeholder="这里输入客户地址" title="客户地址" style="width:98%;"/></td>
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
			if($("#PROJECTCODE").val()==""){
				$("#PROJECTCODE").tips({
					side:3,
		            msg:'请输入项目ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECTCODE").focus();
			return false;
			}
			if($("#PONUMBER").val()==""){
				$("#PONUMBER").tips({
					side:3,
		            msg:'请输入合同编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PONUMBER").focus();
			return false;
			}
			if($("#HKD").val()==""){
				$("#HKD").tips({
					side:3,
		            msg:'请输入港币总金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HKD").focus();
			return false;
			}
			if($("#CNY").val()==""){
				$("#CNY").tips({
					side:3,
		            msg:'请输入人民币总金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CNY").focus();
			return false;
			}
			if($("#USD").val()==""){
				$("#USD").tips({
					side:3,
		            msg:'请输入美元总金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USD").focus();
			return false;
			}
			if($("#OTHERCURRENCY").val()==""){
				$("#OTHERCURRENCY").tips({
					side:3,
		            msg:'请输入其他货币',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHERCURRENCY").focus();
			return false;
			}
			if($("#CUSTOMERID").val()==""){
				$("#CUSTOMERID").tips({
					side:3,
		            msg:'请输入客户ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMERID").focus();
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
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE1").focus();
			return false;
			}
			if($("#PHONE2").val()==""){
				$("#PHONE2").tips({
					side:3,
		            msg:'请输入联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE2").focus();
			return false;
			}
			if($("#COMPANYNAME").val()==""){
				$("#COMPANYNAME").tips({
					side:3,
		            msg:'请输入公司名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANYNAME").focus();
			return false;
			}
			if($("#COMPANYNAME_ABBRE").val()==""){
				$("#COMPANYNAME_ABBRE").tips({
					side:3,
		            msg:'请输入公司名称缩写',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANYNAME_ABBRE").focus();
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
		            msg:'请输入银行地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS1").focus();
			return false;
			}
			if($("#BANKADDRESS2").val()==""){
				$("#BANKADDRESS2").tips({
					side:3,
		            msg:'请输入银行地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS2").focus();
			return false;
			}
			if($("#BANKADDRESS3").val()==""){
				$("#BANKADDRESS3").tips({
					side:3,
		            msg:'请输入银行地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKADDRESS3").focus();
			return false;
			}
			if($("#SWIFTCODE").val()==""){
				$("#SWIFTCODE").tips({
					side:3,
		            msg:'请输入swiftcode',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SWIFTCODE").focus();
			return false;
			}
			if($("#CREATETIME").val()==""){
				$("#CREATETIME").tips({
					side:3,
		            msg:'请输入创建日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATETIME").focus();
			return false;
			}
			if($("#PLANTIME").val()==""){
				$("#PLANTIME").tips({
					side:3,
		            msg:'请输入计划执行时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PLANTIME").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入remark',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#CUSTOMERADDRESS1").val()==""){
				$("#CUSTOMERADDRESS1").tips({
					side:3,
		            msg:'请输入客户地址1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMERADDRESS1").focus();
			return false;
			}
			if($("#CUSTOMERADDRESS2").val()==""){
				$("#CUSTOMERADDRESS2").tips({
					side:3,
		            msg:'请输入客户地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMERADDRESS2").focus();
			return false;
			}
			if($("#CUSTOMERADDRESS3").val()==""){
				$("#CUSTOMERADDRESS3").tips({
					side:3,
		            msg:'请输入客户地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMERADDRESS3").focus();
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
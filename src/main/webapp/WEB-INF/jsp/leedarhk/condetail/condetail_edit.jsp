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
					
					<form action="condetail/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CONDETAIL_ID" id="CONDETAIL_ID" value="${pd.CONDETAIL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目code:</td>
								<td><input type="text" name="PROJECTCODE" id="PROJECTCODE" value="${pd.PROJECTCODE}" maxlength="255" placeholder="这里输入项目code" title="项目code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">合同编号:</td>
								<td><input type="text" name="PONUMBER" id="PONUMBER" value="${pd.PONUMBER}" maxlength="255" placeholder="这里输入合同编号" title="合同编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">子单排序:</td>
								<td><input type="text" name="DETAILORDER" id="DETAILORDER" value="${pd.DETAILORDER}" maxlength="10" placeholder="这里输入子单排序" title="子单排序" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">料号:</td>
								<td><input type="text" name="PARTNO" id="PARTNO" value="${pd.PARTNO}" maxlength="255" placeholder="这里输入料号" title="料号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">品牌:</td>
								<td><input type="text" name="MANUFACTURER" id="MANUFACTURER" value="${pd.MANUFACTURER}" maxlength="255" placeholder="这里输入品牌" title="品牌" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数量:</td>
								<td><input type="number" name="QTY" id="QTY" value="${pd.QTY}" maxlength="32" placeholder="这里输入数量" title="数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">美元单价:</td>
								<td><input type="number" name="UNITUSD" id="UNITUSD" value="${pd.UNITUSD}" maxlength="32" placeholder="这里输入美元单价" title="美元单价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单价人民币:</td>
								<td><input type="number" name="UNITCNY" id="UNITCNY" value="${pd.UNITCNY}" maxlength="32" placeholder="这里输入单价人民币" title="单价人民币" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单价港币:</td>
								<td><input type="number" name="UNITHKD" id="UNITHKD" value="${pd.UNITHKD}" maxlength="32" placeholder="这里输入单价港币" title="单价港币" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">包装形式:</td>
								<td><input type="text" name="PACKAGE" id="PACKAGE" value="${pd.PACKAGE}" maxlength="255" placeholder="这里输入包装形式" title="包装形式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">运输方式:</td>
								<td><input type="text" name="DELEVERYTYPE" id="DELEVERYTYPE" value="${pd.DELEVERYTYPE}" maxlength="255" placeholder="这里输入运输方式" title="运输方式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">说明:</td>
								<td><input type="text" name="NOTE" id="NOTE" value="${pd.NOTE}" maxlength="255" placeholder="这里输入说明" title="说明" style="width:98%;"/></td>
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
			if($("#PROJECTCODE").val()==""){
				$("#PROJECTCODE").tips({
					side:3,
		            msg:'请输入项目code',
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
			if($("#DETAILORDER").val()==""){
				$("#DETAILORDER").tips({
					side:3,
		            msg:'请输入子单排序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DETAILORDER").focus();
			return false;
			}
			if($("#PARTNO").val()==""){
				$("#PARTNO").tips({
					side:3,
		            msg:'请输入料号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARTNO").focus();
			return false;
			}
			if($("#MANUFACTURER").val()==""){
				$("#MANUFACTURER").tips({
					side:3,
		            msg:'请输入品牌',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MANUFACTURER").focus();
			return false;
			}
			if($("#QTY").val()==""){
				$("#QTY").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QTY").focus();
			return false;
			}
			if($("#UNITUSD").val()==""){
				$("#UNITUSD").tips({
					side:3,
		            msg:'请输入美元单价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNITUSD").focus();
			return false;
			}
			if($("#UNITCNY").val()==""){
				$("#UNITCNY").tips({
					side:3,
		            msg:'请输入单价人民币',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNITCNY").focus();
			return false;
			}
			if($("#UNITHKD").val()==""){
				$("#UNITHKD").tips({
					side:3,
		            msg:'请输入单价港币',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNITHKD").focus();
			return false;
			}
			if($("#PACKAGE").val()==""){
				$("#PACKAGE").tips({
					side:3,
		            msg:'请输入包装形式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PACKAGE").focus();
			return false;
			}
			if($("#DELEVERYTYPE").val()==""){
				$("#DELEVERYTYPE").tips({
					side:3,
		            msg:'请输入运输方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELEVERYTYPE").focus();
			return false;
			}
			if($("#NOTE").val()==""){
				$("#NOTE").tips({
					side:3,
		            msg:'请输入说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NOTE").focus();
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
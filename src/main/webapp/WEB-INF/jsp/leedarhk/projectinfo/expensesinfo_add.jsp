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
					
					<form action="projectinfo/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目code:</td>
								<td><input type="text" name="PROJECTCODE" id="PROJECTCODE" readonly="readonly" value="${pd.PROJECTCODE}" maxlength="255" placeholder="这里输入项目code" title="项目code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">支出名称:</td>
								<td><input type="text" name="EXPNAME" id="EXPNAME" value="" maxlength="255" placeholder="这里输入支出名称" title="支出名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">支出说明:</td>
								<td><input type="text" name="EXPNOTE" id="EXPNOTE" value="" maxlength="255" placeholder="这里输入支出说明" title="支出说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">计划开始日期:</td>
								<td><input class="span10 date-picker" name="HAPPENTIME" id="STARTTIME" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="事情发生日期" title="事情发生日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">计划结束日期:</td>
								<td><input class="span10 date-picker" name="EXETIME" id="ENDTIME" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="资金执行日期" title="资金执行日期" style="width:98%;"/></td>
							</tr>

							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
			if($("#EXPENSES_ID").val()==""){
				$("#EXPENSES_ID").tips({
					side:3,
		            msg:'请输入id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPENSES_ID").focus();
			return false;
			}
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
			if($("#EXPNAME").val()==""){
				$("#EXPNAME").tips({
					side:3,
		            msg:'请输入支出名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPNAME").focus();
			return false;
			}
			if($("#EXPNOTE").val()==""){
				$("#EXPNOTE").tips({
					side:3,
		            msg:'请输入支出说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPNOTE").focus();
			return false;
			}
			if($("#HAPPENTIME").val()==""){
				$("#HAPPENTIME").tips({
					side:3,
		            msg:'请输入事情发生日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HAPPENTIME").focus();
			return false;
			}
			if($("#HKD").val()==""){
				$("#HKD").tips({
					side:3,
		            msg:'请输入金额港币',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HKD").focus();
			return false;
			}
			if($("#CNY").val()==""){
				$("#CNY").tips({
					side:3,
		            msg:'请输入金额人民币',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CNY").focus();
			return false;
			}
			if($("#USD").val()==""){
				$("#USD").tips({
					side:3,
		            msg:'请输入美金',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USD").focus();
			return false;
			}
			if($("#EXETIME").val()==""){
				$("#EXETIME").tips({
					side:3,
		            msg:'请输入资金执行日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXETIME").focus();
			return false;
			}
			if($("#SUBMITPERSON").val()==""){
				$("#SUBMITPERSON").tips({
					side:3,
		            msg:'请输入提交人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBMITPERSON").focus();
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
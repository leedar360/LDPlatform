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
						<input type="hidden" name="PROJECTINFO_ID" id="PROJECTINFO_ID" value="${pd.PROJECTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目code:</td>
								<td><input type="text" name="PROJECTCODE" id="PROJECTCODE" value="${pd.PROJECTCODE}" maxlength="255" placeholder="这里输入项目code" title="项目code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td><input type="text" name="PROJECTNAME" id="PROJECTNAME" value="${pd.PROJECTNAME}" maxlength="255" placeholder="这里输入项目名称" title="项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目执行说明:</td>
								<td><input type="text" name="PROJECTNOTE" id="PROJECTNOTE" value="${pd.PROJECTNOTE}" maxlength="255" placeholder="这里输入项目执行说明" title="项目执行说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目执行时间:</td>
								<td><input class="span10 date-picker" name="STARTTIME" id="STARTTIME" value="${pd.STARTTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="项目执行时间" title="项目执行时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">执行结束时间:</td>
								<td><input class="span10 date-picker" name="ENDTIME" id="ENDTIME" value="${pd.ENDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="执行结束时间" title="执行结束时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">项目状态:</td>
								<td><input type="text" name="PROJECTSTATUS" id="PROJECTSTATUS" value="${pd.PROJECTSTATUS}" maxlength="50" placeholder="这里输入项目状态" title="项目状态" style="width:98%;"/></td>
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
			if($("#PROJECTNAME").val()==""){
				$("#PROJECTNAME").tips({
					side:3,
		            msg:'请输入项目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECTNAME").focus();
			return false;
			}
			if($("#PROJECTNOTE").val()==""){
				$("#PROJECTNOTE").tips({
					side:3,
		            msg:'请输入项目执行说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECTNOTE").focus();
			return false;
			}
			if($("#STARTTIME").val()==""){
				$("#STARTTIME").tips({
					side:3,
		            msg:'请输入项目执行时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STARTTIME").focus();
			return false;
			}
			if($("#ENDTIME").val()==""){
				$("#ENDTIME").tips({
					side:3,
		            msg:'请输入执行结束时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENDTIME").focus();
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
			if($("#PROJECTSTATUS").val()==""){
				$("#PROJECTSTATUS").tips({
					side:3,
		            msg:'请输入项目状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECTSTATUS").focus();
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
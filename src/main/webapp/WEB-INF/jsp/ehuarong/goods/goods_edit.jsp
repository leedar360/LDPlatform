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
					
					<form action="goods/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
								<td><input type="text" name="GOOD_ID" id="GOOD_ID" value="${pd.GOOD_ID}" maxlength="255" placeholder="这里输入商品编号" title="商品编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
								<td><input type="text" name="GOODNAME" id="GOODNAME" value="${pd.GOODNAME}" maxlength="255" placeholder="这里输入商品名称" title="商品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品单位:</td>
								<td><input type="text" name="GOODUNIT" id="GOODUNIT" value="${pd.GOODUNIT}" maxlength="255" placeholder="这里输入商品单位" title="商品单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品规格:</td>
								<td><input type="text" name="SPEC" id="SPEC" value="${pd.SPEC}" maxlength="255" placeholder="这里输入商品规格" title="商品规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品说明:</td>
								<td><input type="text" name="MEMO" id="MEMO" value="${pd.MEMO}" maxlength="255" placeholder="这里输入商品说明" title="商品说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品类别号:</td>
								<td><input type="text" name="GOODCATEGORYID" id="GOODCATEGORYID" value="${pd.GOODCATEGORYID}" maxlength="255" placeholder="这里输入商品类别号" title="商品类别号" style="width:98%;"/></td>
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
			if($("#GOOD_ID").val()==""){
				$("#GOOD_ID").tips({
					side:3,
		            msg:'请输入商品编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOOD_ID").focus();
			return false;
			}
			if($("#GOODNAME").val()==""){
				$("#GOODNAME").tips({
					side:3,
		            msg:'请输入商品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODNAME").focus();
			return false;
			}
			if($("#GOODUNIT").val()==""){
				$("#GOODUNIT").tips({
					side:3,
		            msg:'请输入商品单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODUNIT").focus();
			return false;
			}
			if($("#SPEC").val()==""){
				$("#SPEC").tips({
					side:3,
		            msg:'请输入商品规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPEC").focus();
			return false;
			}
			if($("#MEMO").val()==""){
				$("#MEMO").tips({
					side:3,
		            msg:'请输入商品说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMO").focus();
			return false;
			}
			if($("#GOODCATEGORYID").val()==""){
				$("#GOODCATEGORYID").tips({
					side:3,
		            msg:'请输入商品类别号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOODCATEGORYID").focus();
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
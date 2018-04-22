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
					
					<form action="suplygoodinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUPLYGOODINFO_ID" id="SUPLYGOODINFO_ID" value="${pd.SUPLYGOODINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商id:</td>
								<td><select class="chosen-select form-control" name="SUPPLIER_ID" id="SUPPLIER_ID" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<c:forEach items="${distinctSupplyId}" var="var" varStatus="vs">
										<option value="${var.SUPPLIER_ID}">${var.SUPPLIER_ID} | ${var.SUPPLIERNAME}</option>
									</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品编号:</td>
								<td><input type="text" name="GOOD_ID" id="GOOD_ID" value="${pd.GOOD_ID}" maxlength="255" placeholder="这里输入商品编号" title="商品编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品名称:</td>
								<td><input type="text" name="GOODNAME" id="GOODNAME" value="${pd.GOODNAME}" maxlength="255" placeholder="这里输入商品名称" title="商品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单位:</td>
								<td><input type="text" name="UNIT" id="UNIT" value="${pd.UNIT}" maxlength="255" placeholder="这里输入单位" title="单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">规格:</td>
								<td><input type="text" name="SPEC" id="SPEC" value="${pd.SPEC}" maxlength="255" placeholder="这里输入规格" title="规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">说明:</td>
								<td><input type="text" name="MEMO" id="MEMO" value="${pd.MEMO}" maxlength="255" placeholder="这里输入说明" title="说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">商品类别号:</td>
								<td><input type="text" name="CATEGORYID" id="CATEGORYID" value="${pd.CATEGORYID}" maxlength="255" placeholder="这里输入商品类别号" title="商品类别号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应价格:</td>
								<td><input type="number" name="SUPLYPRICE" id="SUPLYPRICE" value="${pd.SUPLYPRICE}" maxlength="32" placeholder="这里输入供应价格" title="供应价格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">有效时间start:</td>
								<td><input class="span10 date-picker" name="STARTTIME" id="STARTTIME" value="${pd.STARTTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="有效时间start" title="有效时间start" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">有效时间end:</td>
								<td><input class="span10 date-picker" name="ENDTIME" id="ENDTIME" value="${pd.ENDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="有效时间end" title="有效时间end" style="width:98%;"/></td>
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
			if($("#UNIT").val()==""){
				$("#UNIT").tips({
					side:3,
		            msg:'请输入单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT").focus();
			return false;
			}
			if($("#SPEC").val()==""){
				$("#SPEC").tips({
					side:3,
		            msg:'请输入规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPEC").focus();
			return false;
			}
			if($("#MEMO").val()==""){
				$("#MEMO").tips({
					side:3,
		            msg:'请输入说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMO").focus();
			return false;
			}
			if($("#CATEGORYID").val()==""){
				$("#CATEGORYID").tips({
					side:3,
		            msg:'请输入商品类别号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATEGORYID").focus();
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
			if($("#SUPLYPRICE").val()==""){
				$("#SUPLYPRICE").tips({
					side:3,
		            msg:'请输入供应价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPLYPRICE").focus();
			return false;
			}
			if($("#STARTTIME").val()==""){
				$("#STARTTIME").tips({
					side:3,
		            msg:'请输入有效时间start',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STARTTIME").focus();
			return false;
			}
			if($("#ENDTIME").val()==""){
				$("#ENDTIME").tips({
					side:3,
		            msg:'请输入有效时间end',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENDTIME").focus();
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
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户钱包管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wlpt/user/userPurse/">用户钱包列表</a></li>
		<li class="active"><a href="${ctx}/wlpt/user/userPurse/form?id=${userPurse.id}">用户钱包<shiro:hasPermission name="wlpt:user:userPurse:edit">${not empty userPurse.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="wlpt:user:userPurse:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="userPurse" action="${ctx}/wlpt/user/userPurse/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">外键，用户ID：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id" value="${userPurse.user.id}" labelName="user.name" labelValue="${userPurse.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">平台余额，账户余额：</label>
			<div class="controls">
				<form:input path="webbalance" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可用账户余额：</label>
			<div class="controls">
				<form:input path="availablebalance" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">冻结资金(运费冻结)：</label>
			<div class="controls">
				<form:input path="freezemoney" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">竞标押金（用户竞标交纳的保证金存在这个字段）：</label>
			<div class="controls">
				<form:input path="biddingmoney" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">保证金：</label>
			<div class="controls">
				<form:input path="guaranteemone" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">油气金额：</label>
			<div class="controls">
				<form:input path="petrolbalance" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">红包金额（活动获取）：</label>
			<div class="controls">
				<form:input path="redpacket" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户结算获得资金（预支付存到卓大账户）：</label>
			<div class="controls">
				<form:input path="settlemoney" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算状态：0可用1.冻结：</label>
			<div class="controls">
				<form:input path="settlestatus" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">保险：</label>
			<div class="controls">
				<form:input path="insurance" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">授信可用金额：</label>
			<div class="controls">
				<form:input path="creditmoney" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="wlpt:user:userPurse:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>企业认证</title>
<link rel="stylesheet" type="text/css"
	href="/static/modules/wlpt/front/css/global_mainbody.css">
<link rel="stylesheet" type="text/css"
	href="/static/modules/wlpt/front/css/personal.css">
<link rel="stylesheet" type="text/css"
	href="/static/modules/wlpt/front/css/top_menu.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/static/jquery-validation/1.11.0/jquery.validate.css">
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	width: 100%;
	margin: 0 auto;
	text-align: center;
	border: 1px solid #D6D3CE;
	font-family: "微软雅黑"
}

input[type="text"] {
	width: 40%;
	text-indent: 5px;
}

#idcardimgPreview li {
	float: left;
}

ol li img {
	height: 165px;
}
</style>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}
								});
			});
</script>
<script src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script
	src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/modules/wlpt/front/js/jquery.tips.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/modules/wlpt/front/js/jquery.valid.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/modules/wlpt/front/js/jquery.pcc.js"></script>
<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/modules/wlpt/front/js/msgbox.js"
	type="text/javascript"></script>
<script src="${ctxStatic }/jquery-select2/3.4/select2.min.js"
	type="text/javascript"></script>
</head>
<body>
	<p class="user_data">
		<img src="/static/images/wlptfront/line-left.png"><span
			class="title_blue">企业</span><span class="title_orange">认证</span><img
			src="${ctxStatic}/images/wlptfront/line-right.png">
	</p>
	<form:form id="inputForm" modelAttribute="userCompany"
		action="${wlpt}/wlpt/authentication/company_authentication"
		method="post" class="form-horizontal">
		<table class="user-infor" style="line-height: 40px;">
			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>公司名称:</td>
				<td class="user_infor_right"><form:input id="companyname"
						path="companyname" htmlEscape="false" maxlength="20"
						class="input-xlarge required" /></td>
			</tr>
			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>营业执照号:</td>
				<td class="user_infor_right"><form:input
						id="businesslicencenum" path="businesslicencenum"
						htmlEscape="false" maxlength="20" class="required" /></td>
			</tr>
			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>公司联系人:</td>
				<td class="user_infor_right"><form:input id="legalperson"
						path="legalperson" htmlEscape="false" maxlength="15"
						class="required" />
			</tr>
			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>手机号码:</td>
				<td class="user_infor_right"><form:input id="headermobile"
						path="headermobile" htmlEscape="false" maxlength="11"
						class="required" value="${userCompany.user.phone}" readonly="true"/></td>
			</tr>
			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>公司所在地:</td>
				<td class="user_infor_right"><form:input
						id="provinceCityDistrict" path="provinceCityDistrict"
						htmlEscape="false" maxlength="11" class="required" readonly="true" /></td>
			</tr>
			<tr>
				<td class="user_infor_left" style="vertical-align: text-top;"><span
					class="star_red">*</span>详细地址:</td>
				<td class="user_infor_right"><form:textarea id="companyaddress"
						path="companyaddress" style="margin-top: 5px" htmlEscape="false"
						rows="3" cols="50" maxlength="50" class="input-xxlarge required" /></td>
			</tr>

			<tr>
				<td class="user_infor_left"><span class="star_red">*</span>认证图片:</td>
				<td class="user_infor_right"><img
					src="/static/images/wlptfront/photo.png" class="photo_up"><span
					id="img">图片大小不超过2M，限上传1张，支持JPG、JPEG、PNG格式</span></td>
			</tr>



		</table>
		<div style="width: 100%; height: 260px;">
			<div style="width: 100%; float: left;">
				<div style="width: 67.5%; float: right;">
					<div class="controls" style="float: left;">
						<form:hidden id="businesslicencenumimg"
							path="usercompanypicture.businesslicencenumimg"
							htmlEscape="false" maxlength="255" class="input-xlarge" />
						<c:choose>
							<c:when
								test="${userCompany.user.userinfo.status==1||userCompany.user.userinfo.status==2}">
								<sys:ckfinder input="businesslicencenumimg" type="images"
									uploadPath="/userpicture" selectMultiple="false" maxWidth="165"
									maxHeight="165" readonly="true" />
							</c:when>
							<c:otherwise>
								<sys:ckfinder input="businesslicencenumimg" type="images"
									uploadPath="/userpicture" selectMultiple="false" maxWidth="165"
									maxHeight="165" btnName="上传营业执照" />
							</c:otherwise>
						</c:choose>
					</div>


					<div class="controls" style="float: left;">
						<form:hidden id="transportcardimg"
							path="usercompanypicture.transportcardimg" htmlEscape="false"
							maxlength="255" class="input-xlarge" />
						<c:choose>
							<c:when
								test="${userCompany.user.userinfo.status==1||userCompany.user.userinfo.status==2}">
								<sys:ckfinder input="transportcardimg" type="images"
									uploadPath="/userpicture" selectMultiple="false" maxWidth="165"
									maxHeight="165" readonly="true" />
							</c:when>
							<c:otherwise>
								<sys:ckfinder input="transportcardimg" type="images"
									uploadPath="/userpicture" selectMultiple="false" maxWidth="165"
									maxHeight="165" btnName="上传运输许可证" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<div style="float: right; width: 67.5%;">
				<div style="float: left;">
					<div class="controls">
						<form:hidden id="idcardimg" path="usercompanypicture.idcardimg"
							htmlEscape="false" maxlength="255" class="input-xlarge" />

						<c:choose>
							<c:when
								test="${userCompany.user.userinfo.status==1||userCompany.user.userinfo.status==2}">
								<sys:ckfinder input="idcardimg" type="images"
									uploadPath="/userpicture" selectMultiple="true" maxWidth="165"
									maxHeight="165" readonly="true" />
							</c:when>
							<c:otherwise>
								<sys:ckfinder input="idcardimg" type="images"
									uploadPath="/userpicture" selectMultiple="true" maxWidth="165"
									maxHeight="165" maxnumber="2" btnName="上传身份证正反面" />
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
		<div style="width: 100%; clear: both; height: 20px;"></div>


		<button type="button" class="btn btn-defalut btn-warning"
			onclick="save()" id="btn-warning">申请认证</button>
			<c:if test="${us.userinfo.status=='3' and not empty us}">
				<div style="width: 100%; clear: both; height: 20px;color: red;">
					您的上一次审核不通过,审核结果:${quality.certifycomment }
				</div>
			</c:if>
	</form:form>
	

	<script type="text/javascript">
		$(function() {
			window.save = function() {

				var isnul = true;
				isnul = isnul && $("#companyname").valid({
					methods : "required|isName"
				});
				isnul = isnul && $("#businesslicencenum").valid({
					methods : "required|isNumberOrLetter"
				});
				isnul = isnul && $("#legalperson").valid({
					methods : "required|isName"
				});
				isnul = isnul && $("#headermobile").valid({
					methods : "required|isPhone"
				});
				isnul = isnul && $("#provinceCityDistrict").valid({
					methods : "required"
				});
				isnul = isnul && $("#companyaddress").valid({
					methods : "required|string"
				});
				isnul = isnul && $("#businesslicencenumimg").valid({
					methods : "required"
				});
				isnul = isnul && $("#transportcardimg").valid({
					methods : "required"
				});
				isnul = isnul && $("#idcardimg").valid({
					methods : "required"
				});
				if ($("#businesslicencenumimg").val() == null
						|| $("#businesslicencenumimg").val() == ""
						|| $("#transportcardimg").val() == null
						|| $("#transportcardimg").val() == ""
						|| $("#idcardimg").val() == null
						|| $("#idcardimg").val() == "") {
					$.MsgBox.Alert("上传提示", "请上传完整图片");
					return false;
				}

				if (!isnul) {
					return false;
				}
				$("#btn-warning").attr("disabled", "disabled");
				$("#btn-warning").html("正在提交中...");
				$
						.ajax({
							cache : true,
							type : "POST",
							url : "${wlpt}/wlpt/authentication/company_authentication",
							data : $('#inputForm').serialize(),// 你的formid
							async : false,
							error : function(request) {
								$.MsgBox.Alert("系统提示", "数据异常,请联系平台人员");
							},
							success : function(data) {
								$.MsgBox.Alert("保存提示", data.message);
								window.location.href = "${wlpt}/wlpt/personal/authentication";

							}
						});
			}

			var status = '${userCompany.user.userinfo.status}';
			if (status == '1' || status == '2') {
				$("#companyname").attr("readonly", "true");
				$("#businesslicencenum").attr("readonly", "true");
				$("#legalperson").attr("readonly", "true");
				$("#headermobile").attr("readonly", "true");
				$("#provinceCityDistrict").attr("disabled", "disabled");
				$("#companyaddress").attr("readonly", "true");
				$("#btn-warning").html("已申请认证");
				$("#btn-warning").attr("disabled", "true");
				$("#btn-warning").css("background-color", "#ccc");
				$("#btn-warning").css("border-color", "#ccc");
			}

			//公司地址加载地址控件
			initAddress("#provinceCityDistrict");
			//設置地址插件
			function initAddress(id) {
				$(id).PCC({
					hasCounty : true,
					width : 360,
					height : 220,
					url : "${wlpt}/wlpt/chinaarea/getArea",
					closeIcon : "/static/images/close_hover.png",
					complete : function(data) {
						var str = "";
						if (data.province) {
							str += data.province.NAME + "";
							$(id).val(str);
						}
						if (data.city) {
							str += data.city.NAME + "";
							$(id).val(str);
						}
						if (data.county) {
							str += data.county.NAME + "";
							$(id).val(str);
						}
						if (str != "") {
							$(id).val(str);
						} else {
							$(id).val("");
						}

					}
				});
			}
		});
	</script>
</body>
</html>

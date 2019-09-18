<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Slider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('*');
</script>
<![endif]-->
</head>
<body>

	<div id="login_container">
		<form action="gj!userlogin"  method="post">
			<h1 align="center">
					<font color="red">${msg }</font>
				</h1>
			<div class="login_top pt15 pb20">
			
				<a href="index.jsp" class="r db mt40">返回首页&gt;&gt;</a> <img
					src="${pageContext.request.contextPath}/images/logo_login.gif"
					class="ml20" />
			</div>
			<div class="bordD7 login_bg mt10 clearfix">
				<div class="l login_l">
					<h2 class="clearfix">
						<img class="l"
							src="${pageContext.request.contextPath}/images/login_icon.gif" /><span
							class="f22 colBlue4 fofY l mt15 ml20">登录后您可以：</span>
					</h2>
					<ul class="f16 fofY lh30 mt25">
						<li>了解账户信息</li>
						<li>进行业务办理</li>
						<li>享受一站式平台服务</li>
					</ul>
				</div>
				<div class="r bordD7 login_r pr">
					<div class="login_r login_r_bg pa"></div>
					<div class="login_r pa">
						<h2 class="fwb colBlue4 f14 ti10">用户登录</h2>
						<div class="pt20 ml50 col333 mt15 pl20">
							<dl class="clearfix mb12">
								<dt class="f14">用户名</dt>
								<dd>
									<input name="user.name" id='uname'  class="login_input"  type="text"  placeholder="请输入用户名"  />
								</dd>
							</dl>
							<dl class="clearfix mb12">
								<dt class="f14">登录模式</dt>
								<dd>
									<select name="loginType" id="loginType">
										<option selected="" value="1">服务密码</option>
										<option value="2">动态密码</option>
									</select>
								</dd>
							</dl>
							<dl class="clearfix mb12">
								<dt class="f14">服务密码</dt>
								<dd class="clearfix">
									<input name="user.password" type="password" class="login_input mb12" />
								
									<p class="mt10 ml50 pl10">
										<input name="" type="checkbox" value="" checked="checked" onclick="ty()"
											class="mr5" />同意<a href="javascript:void(0);" target="_blank" class="colBlue2">业务办理协议</a>
									</p>
								</dd>
							</dl>
							<dl class="clearfix">
								<dt>&nbsp;</dt>
								<dd class="mt10">
									<a href="javascript:void(0);"><button style=""  id="tya" class="login_btn">登 录</button></a><a
										href="javascript:void(0);" class="colBlue ml40">忘记密码</a>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--底部-->
		<div class="blank10"></div>
		<div class="copyright">
			<span class="r"><a href="http://www.miibeian.gov.cn/"
				target="_blank"><img
					src="${pageContext.request.contextPath}/images/gongshang.jpg"
					class="l mt12" />京ICP备05002571号</a>|<a href="http://www.nm.10086.cn/"
				target="_blank">中国移动通信集团内蒙古有限公司版权所有</a></span><a href="javascript:void(0);">法律声明</a>
			| <a href="http://www.10086.cn/web_notice/contact/" target="_blank">联系我们</a>
			| <a href="http://www.10086.cn/support/channel/10086/"
				target="_blank">服务热线10086</a> | <a
				href="http://www.nm.10086.cn/sitemap/" target="_blank">网站地图</a> | <a
				href="http://job.10086.cn/" target="_blank">招聘信息</a> |
		</div>
		<!--底部end-->
	</div>
</body>
<script type="text/javascript">
	$("#logina").addClass('on');
	function ty(){
		if($("input[type='checkbox']").is(':checked')){
			$("#tya").attr("disabled",false);
		}else{
			$("#tya").attr("disabled",true);
		}
	}
	function test(){
		alert($("#uname").val());
	}
</script>
</html>
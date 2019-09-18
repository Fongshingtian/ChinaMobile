<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/layui.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!--页面布局  -->
	<div class="layui-layout layui-layout-admin">
		<!--头部位置  -->
		<div class="layui-header">
			<div class="layui-logo">
				<font color="white" size='5'>China Mobile</font>
			</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;">
					管理员
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">注销</a></li>
			</ul>
		</div>
		<!-- 左侧位置 -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="Ware.jsp" target="main">&nbsp;&nbsp;&nbsp;商品管理</a>
							</dd>
							<dd>
								<a href="Ware_Brand.jsp" target="main">&nbsp;&nbsp;&nbsp;商品品牌</a>
							</dd>
							<dd>
								<a href="Ware_Classify.jsp" target="main">&nbsp;&nbsp;&nbsp;商品分类</a>
							</dd>
							<dd>
								<a href="Ware_Color.jsp" target="main">&nbsp;&nbsp;&nbsp;商品颜色</a>
							</dd>
							<dd>
								<a href="User_Comment.jsp" target="main">&nbsp;&nbsp;&nbsp;用户评论</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a class="" href="javascript:;">优惠活动</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="Ware_Bargain.jsp" target="main">&nbsp;&nbsp;&nbsp;特惠专区</a>
							</dd>
							<dd>
								<a href="Ware_Flash_Sale.jsp" target="main">&nbsp;&nbsp;&nbsp;限时抢购</a>
							</dd>
							<dd>
								<a href="Ware_Group_Buying.jsp" target="main">&nbsp;&nbsp;&nbsp;团购管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">号码业务</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="Users.jsp" target="main">&nbsp;&nbsp;&nbsp;用户资料</a>
							</dd>
							<dd>
								<a href="Phone_Number.jsp" target="main">&nbsp;&nbsp;&nbsp;号码库表</a>
							</dd>
							<dd>
								<a href="Phone_Set_Meal.jsp" target="main">&nbsp;&nbsp;&nbsp;号码套餐</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">商城管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="Main_Order.jsp" target="main">&nbsp;&nbsp;&nbsp;订单管理</a>
							</dd>
							<dd>
								<a href="Notice.jsp" target="main">&nbsp;&nbsp;&nbsp;活动公告</a>
							</dd>
							<dd>
								<a href="Activity.jsp" target="main">&nbsp;&nbsp;&nbsp;活动专区</a>
							</dd>
							<dd>
								<a href="Advert.jsp" target="main">&nbsp;&nbsp;&nbsp;广告管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">其他管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="Rotation_Image.jsp" target="main">&nbsp;&nbsp;&nbsp;轮播图片</a>
							</dd>
							<dd>
								<a href="City.jsp" target="main">&nbsp;&nbsp;&nbsp;城市区域</a>
							</dd>
							<dd>
								<a href="Business_Hall.jsp" target="main">&nbsp;&nbsp;&nbsp;营业厅表</a>
							</dd>
							<dd>
								<a href="Manager.jsp" target="main">&nbsp;&nbsp;&nbsp;管理员表</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>
		<!--中心位置  -->
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe name='main' width="100%" height="100%" style="border: 0px"
				src="NewFile.jsp"> </iframe>
		</div>

		<!-- 底部位置 -->
		<div class="layui-footer footer footer-demo">
			2018 © China Mobile
			<div style="width: 400px; height: 400px;"
				class="load-container load1">
				<div class="loader">Loading...</div>
			</div>
		</div>
	</div>

	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('*');
</script>
<![endif]-->
</head>
<body>
<div id="container">
   <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where bordBN">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 优惠购机 &gt; 核对订单 &gt; 提交成功</div>
        <div class="yyzq_s chooseNo_s">
        	<h2 class="clearfix"><img src="${pageContext.request.contextPath}/images/yyzq_s.png" />恭喜，订单提交成功！</h2>
            <p class="f14 col000 lh30">您订单号为：<strong class="colR">${sad }</strong>  应付金额：<strong class="colR">${ssw }元</strong> 
若您在订单提交后成功后 24 小时内未完成支付，订单将自动取消。感谢您的支持！</p>
			<div class="mt10 clearfix"><a class="buy_btn r"  href="pro_payment.jsp">在线支付</a><a href="index.jsp" class="buy_btn r mr10">返回首页</a><a href="orderCheck.jsp" class="buy_btn r mr10">查看订单</a></div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
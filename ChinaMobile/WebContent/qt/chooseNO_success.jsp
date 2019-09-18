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
<div id="container">
    <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where bordBN">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; <a href="chooseNO.jsp">网上选号</a> &gt; 号码选择 &gt; 套餐选择 &gt; 核对订单 &gt; 提交成功</div>
        <div class="yyzq_s chooseNo_s">
        	<h2 class="clearfix"><img src="${pageContext.request.contextPath}/images/yyzq_s.png" />恭喜，订单提交成功！</h2>
            <p class="f14 col000 lh30">您订单号为：<strong class="colR">13721448483981147182</strong>  应付金额：<strong class="colR">￥100.0 元</strong> 支付方式： <strong class="colR">营业厅支付</strong><br />您可以在 24 小时之内到 <strong class="colR">呼和浩特市 新城区 自营_新城_呼伦南路旗舰店， 新城区呼伦南路3号</strong> 提取您的商品。<br />您的订单需要在营业厅提取商品时支付相应的费用。<br />
若您在订单提交后成功后 24 小时内未完成支付，订单将自动取消。感谢您的支持！</p>
			<div class="mt10 clearfix"><a class="buy_btn r"  href="chooseNO_payment.jsp">在线支付</a><a href="chooseNO.jsp" class="buy_btn r mr10">返回首页</a><a href="orderCheck.jsp" class="buy_btn r mr10">查看订单</a></div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
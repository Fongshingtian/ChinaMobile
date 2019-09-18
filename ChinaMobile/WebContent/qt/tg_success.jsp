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
  	<div class="blank10"></div>
    <div class="bord1"><img src="${pageContext.request.contextPath}/images/img/tg_tu.jpg" /></div>
    <div class="blank10"></div>
    <div class="bordCc">
    	<h2 class="fwb f14 ti10 tg_succ_3">购买仅需三步</h2>
        <ul class="tg_succ_bz tg_succ_bz_2 clearfix fwb f14 mt10 ml5">
        	<li class="first ti10">1.填写订单信息</li>
            <li class="tac colfff">2.参团预约完成</li>
            <li class="tac">3.选择网银支付</li>
        </ul>
        <div class="tg_succ">
        	<h3 class="clearfix fofY f30 tg_succ_t mt80"><img src="${pageContext.request.contextPath}/images/yyzq_s.png">恭喜，<span class="colBlue">参团成功！</span></h3>
            <h4 class="f14 lh30 bordBa0 mt25">您预约的订单号为：<strong class="colR">2012309324812</strong></h4>
            <p class="lh24 mt10"><strong class="colR">【注意】</strong><br />1、请记录您的<span class="colR">订单号</span>，此订单号为您查询订单的唯一凭证！<br /> 2、收到付款短信提示后请在<span class="colR">24小时内</span>完成支付，否则订单失效！<br /> 3、参团人数小于最少参团人数，团购活动将失败。</p>
            <div class="mt80 clearfix"><a class="buy_btn r" href="orderCheck.jsp">查看订单</a><a class="buy_btn r mr30" href="tg.jsp">返回首页</a></div>
            <div class="blank10"></div>
            <div class="blank10"></div>
            <div class="blank10"></div>
        </div>
    </div>
  </div>
  <div class="blank10"></div>
 <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
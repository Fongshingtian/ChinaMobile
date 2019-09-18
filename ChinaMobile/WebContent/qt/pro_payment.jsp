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
    	<div class="where bordBN"><strong class="colBlue2">您的位置：</strong> <a target="_blank" href="http://www.nm.10086.cn/">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 优惠购机 &gt; 信息填写 &gt; 提交成功 &gt; 网银支付</div>
        <div class="bordEb pl110 pr110 bgF7 pb20">
        	<h1 class="f30 tac colR fofY mt40 pt10">您已进入在线支付！</h1>
            <p class="lh30 f14 col000 pl20 mt20">您的订单号：<strong class="colR">2012309324812</strong><br />应付金额：<strong class="colR">￥199.0元</strong><br />支付方式：网上支付<br />请立即支付（请您在24小时内付清款项，如逾期未完成支付，订单会被自动取消）您的订购的商品预计将在支付成功后1-7天内送达。感谢您的支持！</p>
            <div class="bgFff7ec p20 mt40 bordOfc">
            	<p class="f14 col000">请选择在线支付的方式</p>
                <p class="mt5 f14 col000"><strong>网银支付</strong>  需开通网银</p>
                <div class="chooseNO_wy pl80 mt15">
                	<ul class="clearfix" id="bank_list">
                    	<li><input name="bank" type="radio" value="" checked="checked" /><img  class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank0.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank1.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank2.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank3.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank4.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank5.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank6.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank7.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank8.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank9.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank10.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank11.jpg"> </li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank12.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank13.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank14.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank15.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank16.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank17.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank18.jpg"></li>
                        <li><input name="bank" type="radio" value="" /><img class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank19.jpg"></li>
                    </ul>
                    <div class="blank10 mt15"></div>
                    <p class="clearfix mt40"><a class="buy_btn buy_btn2 l ml200" href="javascript:void(0);">确认支付方式</a></p>
                </div>
            </div>
            <div class="blank10"></div>
            <div class="blank10"></div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
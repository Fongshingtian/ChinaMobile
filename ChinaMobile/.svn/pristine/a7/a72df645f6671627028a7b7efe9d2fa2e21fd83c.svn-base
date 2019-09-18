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
    	<div class="where bordBN"><strong class="colBlue2">您的位置： </strong><a href="chooseNO.jsp">首页</a> &gt; 网银支付</div>
        <div class="bordEb p10">
        	<p class="lh24 mt10">请立即支付（请您在<span class="colR">24</span>小时内付清款项，如逾期未完成支付，订单会被自动取消）</p>
            <p class="lh24">付款成功后，请您到 <span class="colR">呼和浩特市新城区 呼伦南路营业厅 （呼和浩特市新城区呼伦南路3号）</span>提取您的商品</p>
            <div class="bgFff7ec p20 mt25">
            	<p>请选择在线支付的方式</p>
                <p class="mt5"><strong>网银支付</strong>  需开通网银</p>
                <div class="chooseNO_wy pl80">
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
                        <li class="more tac colBlue2 pt5 pl20 cup">更多银行<br /><img src="${pageContext.request.contextPath}/images/bank_more.gif" /></li>
                    </ul>
                    <div class="blank10 mt15"></div>
                    <p class="mt25"><strong class="f14">快捷支付</strong> 一步验证，无需网银！</p>
                    <ul class="clearfix">
                    	<li><input name="bank" type="radio" value="" /><img  class="bordE0" alt="" src="${pageContext.request.contextPath}/images/bank_zfb.jpg"></li>
                    </ul>
                    <p class="clearfix"><a class="buy_btn buy_btn2 l" href="javascript:void(0);">确认支付方式</a></p>
                </div>
            </div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>

<script type="text/javascript">
$(function(){
	
	//更多银行
	$("#bank_list li:gt(10)").not($("li.more")[0]).hide();
	$("#bank_list li.more").click(function(){
		$("#bank_list li:gt(10)").not($("li.more")[0]).show().end().end().find("li.more").hide();
	});
	
})
</script>
</body>
</html>
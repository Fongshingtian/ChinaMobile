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
<div id="container2">
  <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where bordBN">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; <a href="chooseNO.jsp">网上选号</a> &gt; 号码选择 &gt; 套餐选择 &gt; 核对订单 &gt; 提交失败</div>
        <div class="yyzq_s">
        	<h2 class="clearfix"><img src="${pageContext.request.contextPath}/images/yyzq_f.png" />抱歉，订单提交失败！</h2>
            <p class="f14 col000 lh30">您填写的订单信息有误，系统将在 <strong class="colR">5</strong> 秒后自动返回购号页面。</p>
			<div class="mt10 clearfix"><a href="chooseNO.jsp" class="buy_btn r">返回首页</a></div>
        </div>
  </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>

<script type="text/javascript">
$(function(){
	
	//倒数返回
	countDown();
	
	function countDown(){
	var i = 5;
	setInterval(function() {
		if( i<2 ){
			window.location.href="chooseNO.jsp";
		}else{
			i--;
			$("div.yyzq_s p strong.colR").html(i);
		};
	}, 1000)
}
	
})
</script>
</body>
</html>
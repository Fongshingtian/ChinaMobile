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
    	<div class="where bordBN"><strong class="colBlue2">您的位置： </strong><a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 订单查询登录</div>
        <form action="mmf!seldld" name="dd" method="post">
        <div class="bordEb clearfix p20">
        	<div class="l orderCheck_l bordRd3 ml5">
            	<ul class="pt20">
                	<li class="mb25 mt25"><strong class="f14 lh30">凭 证 类 型：</strong>
                    <select class="bordCc col555 orderCheck_sel" name="pricemin">
						<option value="订单号" selected="">订单号</option>
                    </select></li>
                    <li class="mb25"><strong class="f14 lh30">订单号:</strong><input type="text" class="bdHM bdHM2 bordCc f14 col555" id="ssw" name="ssw"></li>
                </ul>
                <p><a class="buy_btn r mt20" href="javascript:void(0);" onClick="re();">查&nbsp;&nbsp;询</a></p>
            </div>
            <div class="r f14 orderCheck_r lh30">
            	<p class="fwb colBlue">查询提示：</p>
				<p>请准确填写您的凭证信息</p>
            </div>
        </div>
        </form>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
$("#ordera").addClass('on');
function re(){
	var ssw=$("#ssw").val();
	if(ssw!=""){
	dd.submit();
	}else{
		alert("请输入单号");
	}
}
</script>
</html>
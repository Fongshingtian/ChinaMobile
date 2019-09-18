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
    	<div class="where bordBN"><strong class="colBlue2">您的位置： </strong><a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 订单详情</div>
        <div class="bordE0 clearfix">
        	<h2 class="fwb f14 colBlue2 orderCheck_info_t pl20">订单详情</h2>
            <div class="orderCheck_det">
            	<table class="orderCheck_det_tab1 col333">
                	<tr>
                    	<th width="12%">订单号</th>
                        <td width="38%">137889976588976321</td>
                        <th width="12%">下单时间</th>
                        <td width="38%">2013-06-05 15：20：28</td>
                    </tr>
                    <tr>
                    	<th>客户姓名</th>
                        <td>张三</td>
                        <th>联系电话</th>
                        <td>15661063801</td>
                    </tr>
					<tr>
                    	<th>支付方式</th>
                        <td>营业厅支付</td>
                        <th>配送方式</th>
                        <td>营业厅自取</td>
                    </tr>
                    <tr>
                    	<th>订单类型</th>
                        <td>网上选号（预约）</td>
                        <th>支付状态</th>
                        <td>未支付</td>
                    </tr>
                    <tr>
                    	<th>订单总金额</th>
                        <td class="fwb colR">￥100</td>
                        <th>订单状态</th>
                        <td class="fwb colR">订单作废</td>
                    </tr>
                </table>
                <div class="blank10"></div>
                <table class="orderCheck_det_tab2 mt25">
                	<tr class="f14">
                    	<th width="17%">品  牌</th>
                        <th width="49%">号  码</th>
                        <th width="17%">价  格</th>
                        <th width="17%">品  牌</th>
                    </tr>
                    <tr class="tac">
                    	<td class="pt10 pb10"><img width="85" src="${pageContext.request.contextPath}/images/img/orderCheck.gif" /></td>
                        <td>15754928888</td>
                        <td class="colR">￥100</td>
                        <td>全球通</td>
                    </tr>
                </table>
                <p class="mt25 clearfix orderCheck_invalid"><a class="buy_btn l" href="orderCheck_info.jsp">返&nbsp;&nbsp;回</a></p>
            </div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<!--头部-->
		<div class="h_top_bg">
	<div class="h_top"><strong class="r"><a href="javascript:void(0);">收藏网站</a></strong>您好，欢迎登录江西移动网上商城   <a href="login.jsp" id="dl">[登录]</a>  |   <a href="orderCheck_info.jsp">我的订单</a> |   <a href="orderCheck_info.jsp">我的收藏</a> | <a href="personalCenter.jsp">个人中心</a> </div>
</div>
	 <div id="header" class="header clearfix">
    	<div class="clearfix">
            <div class="r h_search">
                <div class="h_search1 ovh clearfix">
                    <input type="text" value="请输入关键字，例如：三星 7568" class="search_text l">
                    <a href="javascript:;" class="l" onclick="rew();"><img src="${pageContext.request.contextPath}/images/search_btn.gif"> </a>
                </div>
                <div class="h_searchHot">热门搜索: <a href="javascript:void(0);" class="colBlue">诺基亚N73</a><a href="javascript:void(0);">HTC 8X</a><a href="javascript:void(0);">联想A580</a><a href="javascript:void(0);">诺基亚820</a></div>
            </div>
            <div class="l"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/images/logo.gif" alt="中国移动" /></a></div>
            <div class="l h_place">
               
            </div>
        </div>
        <div class="menu clearfix">
        	<ul id="s">
            	<li><a href="index.jsp" id="indexa">门户首页</a></li>
                <li><a href="xjzx.jsp" id="xjzxa">选机中心</a></li>
				<li><a href="chooseNO.jsp" id="choosea">网上选号</a></li>
                <li><a href="thzq.jsp" id="thzqa">特惠专区</a></li>
				 <li><a href="tg.jsp" id="tga">团购</a></li>
                <li><a href="orderCheck.jsp" id="ordera">订单查询</a></li>
                <li><a href="javascript:void(0);" class="goCar" id="shopa" onclick="tz(${m.id});"><span class="pr"><img src="${pageContext.request.contextPath}/images/menu_car.png" /><em class="pa">0</em></span>去购物车结算</a></li>
                <li id="li6"><a href="login.jsp" class="login" id="logina" >登录</a></li>
            </ul>
        </div>
  </div>
  <!--头部END-->
  <script type="text/javascript">
	function tz(id){
  		window.location.href = 'mmf!toCar';
	}// style="display:none;"
	var sd="${m.id}";
	if(sd!=""){
		document.getElementById('li6').style.display = 'none';
		document.getElementById('dl').style.display = 'none';
		document.getElementById("dl").setAttribute("name", sd);
	}
	if(sd!=0){
		document.getElementById('li6').style.display = 'none';
		document.getElementById('dl').style.display = 'none';
		document.getElementById("dl").setAttribute("name", sd);
	}
	function rew(){
		window.location.href='xjzx.jsp';
	}
  </script>
</body>
</html>
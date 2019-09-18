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
  <jsp:include page="incluJS.jsp"></jsp:include>
  <div class="content">
  	<div class="blank10"></div>
    <div class="bord1"><img src="${pageContext.request.contextPath}/images/img/tg_tu.jpg" /></div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <h2 class="fwb f14">购买仅需三步</h2>
    <ul class="tg_succ_bz clearfix fwb f14 mt10">
        <li class="first colfff ti10">1.填写订单信息</li>
        <li class="tac">2.参团预约完成</li>
        <li class="tac">3.选择网银支付</li>
    </ul>
    <!--确定用户资料-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info">
    	<div class="f14 tg_info_t"><strong class="col000">客户资料</strong></div>
        <ul class="clearfix col000 pl20 pt10 tg_info_zl">
        	<li class="mb10"><label>客户姓名：<input type="text" class="bdHM bordCc" name=""></label></li>
            <li class="mb10"><label>联系电话：<input type="text" class="bdHM bordCc" name=""></label></li>
            <li class="mb10"><label>身份证号：<input type="text" class="bdHM bordCc" name=""></label></li>
            <li><a class="buy_btn buy_btn2 l ml130" href="javascript:void(0);">确定用户资料</a></li>
        </ul>
    </div><!--确定用户资料end-->
    <!--支付方式-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info">
    	<div class="f14 tg_info_t"><strong class="col000">支付方式</strong><span class="ml20">网银支付</span></div>
    </div><!--支付方式end-->
    <!--配送方式-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info">
    	<div class="f14 clearfix tg_info_t"><strong class="col000 l">配送方式</strong>
        <ul class="l f12 tg_info_ps clearfix">
        	<li class="l"><label><input name="input_ps" type="radio" class="mr5 ml20" value="" checked="checked" />营业厅自取</label></li>
            <li class="l"><label><input name="input_ps" type="radio" value="" class="mr5 ml50" />送货上门</label></li>
        </ul></div>
    </div><!--配送方式end-->
    <!--营业厅选择-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info">
    	<div class="f14 tg_info_t"><strong class="col000">营业厅选择</strong></div>
        <div class="p8">
            <p class="mt10 mb10">请选择区/县营业厅</p>
            <div class="bordE0 tg_info_yyt">
                <h2 class="fwb colBlue2 ti10 lh34">选择营业厅</h2>
                <div class="p8">
                    <p>请选择区县：
                    <select class="hypj_sel" name="">
                      <option value="-1"> 选择区/县 </option>
                    <option value="2">新城区</option>
                    <option value="3">玉泉区</option>
                    <option value="4">赛罕区</option>
                    <option value="101">金桥开发区</option>
                    <option value="102">金川开发区</option>
                    <option value="103">如意开发区</option>
                    <option value="201">清水河县</option>
                    <option value="202">和林格尔县</option>
                    <option value="203">托克托县</option>
                    <option value="204">武川县</option>
                    <option value="205">土默特左旗</option>
                    <option value="206">盛乐园区</option>
                    <option value="104">回民区</option>
                    </select></p>
                  <table class="mt10 mb5">
                      <tr>
                          <th width="8%">选择</th>
                          <th width="22%">营业厅名称</th>
                          <th width="22%">营业厅地址</th>
                          <th width="8%">联系电话</th>
                          <th width="50%"></th>
                      </tr>
                      <tr class="yyt_list hide">
                          <td><input type="radio" value="88" name="yyt"></td>
                          <td>自营_赛罕_赛罕区第一营业厅</td>
                          <td>赛罕区桥华世纪村南区西门对面</td>
                          <td>13848163965</td>
                          <td></td>
                      </tr>
                      <tr>
                          <td colspan="5" class="colR">该地区没有适合的营业厅或没有选择区/县</td>
                      </tr>
                  </table>
                </div>
            </div>
        </div>
    </div><!--营业厅选择end-->
    <!--结算信息-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info f14">
    	<div class="f14 tg_info_t"><strong class="col000">结算信息</strong></div>
        <div class="p20 lh24">
            <p>购买号码使用费用：<strong class="colR">100.00￥</strong></p>
            <p>快递费用：<strong class="colR">0.00￥</strong></p>
            <p class="tar f16 fwb colR">您供需支付：100.00￥</p>
        </div>
    </div><!--结算信息end-->
    <div class=" tar pt15">
    	<label><input name="" type="checkbox" value="" class="mr5" />同意</label><a href="javascript:void(0);" class="colBlue ml50">中国移动通信客户入网服务协议</a>
        <p class="mt10"><a href="tg_success.jsp" class="buy_btn r">提交订单</a></p>
    </div>
  </div>
  <div class="blank10"></div>
  <div class="blank10"></div>
 <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
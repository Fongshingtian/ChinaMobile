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
<script type="text/javascript">
var lb="${lb}";
var did="";//地址id
	$(function(){
		var opti2=$("<option>",{
			value:'',
			text:''
		});
		$("#DanWei").append(opti2);
		$.post("mmf!seldz",{"user_id":user_id},function(data){
			$.each(data.json.dz,function(index,u){
				var opti=$("<option>",{
					value:u.address,
					text:u.address
				});
				$("#DanWei").append(opti);
				if(index>0){
					did+="|";
				}
				did+=u.id;
				
			});
			var li1=$("<li>",{
				
			});
				var input1=$("<input>",{//用户id
					type:'hidden',
					name:'mains.user_id',
					value:user_id
				});
				var ch=${jg };
				
				$(li1).append(input1);
				var input2=$("<input>",{//总金额
					type:'hidden',
					name:'mains.total_price',
					value:ch
				});
				$(li1).append(input2);
				var qs="${sad}";//
				var input2=$("<input>",{//物品颜色id
					type:'hidden',
					name:'sad',
					value:qs
				});
				$(li1).append(input2);
				var uname="${uname}";//物品id
				var input3=$("<input>",{
					type:'hidden',
					name:'uname',
					value:uname
				});
				$(li1).append(input3);
				var photo="${photo}";//物品数
				var input4=$("<input>",{
					type:'hidden',
					name:'photo',
					value:photo
				});
				$(li1).append(input4);
				var pricemin="${pricemin}";//购物车id
				var input5=$("<input>",{
					type:'hidden',
					name:'pricemin',
					value:pricemin
				});
				$(li1).append(input5);
			$("#from1s").append(li1);
		},"json");
	});
</script>
<body>
<div id="container">
  <jsp:include page="head.jsp"></jsp:include>
  <form action="mmf!addorder" id="from1" method="post">
  <div class="content">
    <div class="where"><strong class="colBlue3">您的位置：</strong> <a href="index.jsp">首页</a> &gt; 优惠购机 &gt; 核对订单</div>
    <div class="blank10"></div>
    <table class="bordE0 pro_info_tab">
        <tr class="f14 fwb colBlue3">
            <th width="50%" class="bordRe0">商品名称</th>
            <th>总金额</th>
        </tr>
        <tr>
            <td class="bordRe0 lh30">${ssw }</td>
            <td class="tdu fwb f14 colR tac">${jg }￥</td>
        </tr>
    </table>
    <!--确定用户资料-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info">
    	<div class="f14 tg_info_t"><strong class="col000">客户资料</strong></div>
    	
        <ul class="clearfix col000 pl20 pt10 tg_info_zl" id="from1s">
        	<li class="mb10"><label>客户姓名：<input type="text" class="bdHM bordCc" name="childe.receive_user"></label><span class="colR ml20">请预留真实姓名</span></li>
            <li class="mb10"><label>联系电话：<input type="text" class="bdHM bordCc" name="mains.phone_number"></label><span class="colR ml20">请预留您使用中的手机号码</span></li>
            <li class="mb10"><label>身份证号：<input type="text" class="bdHM bordCc" name="mains.idcard"></label><span class="colR ml20">身份证号码必须与名字匹配</span></li>
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
        <ul class="l f12 tg_info_ps clearfix" id="ps">
        <li class="l"><label><input name="input_ps" type="radio" class="mr5 ml20" value="" checked="checked" />送货上门</label></li>
         <li class="mb10"><label>收货地址：
		      	<span style="margin-left:100px;width:18px;overflow:hidden;">
			       	  <select id="DanWei" style="width:235px;margin-left:-86px;height:31px;" onchange="danwei()">
			        </select>
		        </span>  
        		<input type="text" id="units" name="mains.receive_address" style="width: 210px;margin-left: -239px;height: 25px;color:#000;">
            </label><span class="colR ml20">收货地址请务必准确</span></li>
        </ul></div>
    </div><!--配送方式end-->
    <!--营业厅选择-->
    <div class="blank10"></div>
    <!--结算信息-->
    <div class="blank10"></div>
    <div class="bordE0 p3 tg_info f14">
    	<div class="f14 tg_info_t"><strong class="col000">结算信息</strong></div>
        <div class="p20 lh24">
            <p>购买商品费用：<strong class="colR">${jg }￥</strong></p>
            <p class="tar f16 fwb colR mt20">您共需支付：${jg }￥</p>
        </div>
    </div><!--结算信息end-->
    <div class=" tar pt15">
    	<label><input name="ss" type="checkbox" value="" class="mr5" checked="checked" onclick="ty()"/>同意</label><a href="javascript:void(0);" class="colBlue ml50">中国移动通信客户入网服务协议</a>
        <p class="mt10"><a href="javascript:void(0);" class="buy_btn r" id="tysa" name="1" onclick="order()">提交订单</a></p><!-- pro_success.jsp -->
    </div>
  </div>
  <div class="blank10"></div>
  <div class="blank10"></div>
   </form>
   <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
var user_id=window.parent.document.getElementById("dl").name;
function ty(){
	if($("input[type='checkbox']").is(':checked')){
		//$("#tysa").removeAttr("disabled");
		document.getElementById("tysa").disabled="true";
	}else{
		$("#tysa").attr({"disabled":"disabled"});
	}
}
//用于单位选择更换赋值给文本框
function danwei(){
	
     var text=$("#DanWei").val();
     $("#units").val(text);
}
function order(){
	document:from1.submit();
}
$(function(){
	if(lb==1){
		$("#from1").attr("action","mmf!addorder2");
	}
});
</script>
</html>
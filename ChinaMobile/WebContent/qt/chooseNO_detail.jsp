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
var jg=0;//总价格
var photo=1;//物品数
var pricemin=-1;//判定是否为购物车
var uname="${id}";//物品id
var sad=0;//物品颜色id
var ssw="";
	var q=-1;
	$(function(){
		//paymentName
		$("#paymentName").click(function(){
			document.getElementById("chooseNO_popBox").style.display="block";
		});
		
		var id="${id}";
		$.post("mmf!choose",{"id":id},function(data){
			jg=data.json.ph.price;
			$("#price").html("￥"+data.json.ph.price);
			$("#city").html(data.json.ph.city);
			$("#photo").html(data.json.ph.phone_number);
			$("#phone").html(data.json.ph.phone_number);
			if('全球通'==data.json.ph.brand){
				$("#tc").html('<li class="ka_li_on"><img width="121" height="39" id="img1" src="${pageContext.request.contextPath}/images/img/quanqiutong2.jpg"></li>');					
			}else if('动感地带'==data.json.ph.brand){//
				$("#tc").html('<li class="ka_li_on"><img width="121" height="39" src="${pageContext.request.contextPath}/images/img/donggandidai2.jpg"></li>');
			}else if('神州行'==data.json.ph.brand){
				$("#tc").html('<li class="ka_li_on"><img width="121" height="39" src="${pageContext.request.contextPath}/images/img/shenzhouxing2.jpg"></li>');
			}
			//payment
       		$.each(data.json.ps,function(index,u){
       			var tr1=$("<tr>", {
       			});
	       			var td1=$("<td>",{
	       				text:u.name
	       			});
	       			var td2=$("<td>",{
	       				text:u.detail
	       			});
	       			var td3=$("<td>",{
	       			});
	       				var a1=$("<a>",{
	       					class:'tdu colBlue2',
	       					href:'javascript:void(0);',
	       					tittle:'点击选择该套餐',
	       					name:u.id,
	       					text:'选择'
	       				});
	       				a1.click(function(){
	       					//alert("套餐id"+u.id);
	       					//alert(u.name);
	       					q=u.id;
	       					$("#paymentName").text(u.name);//chooseNO_popBox
	       					ssw=data.json.ph.city+"   号码:"+data.json.ph.phone_number+"<br>名称:"+u.name+"<br>资费详情"+u.detail;
	       					document.getElementById("chooseNO_popBox").style.display="none";
	       				});
	       			$(td3).append(a1);
	       		$(tr1).append(td1);
	       		$(tr1).append(td2);
	       		$(tr1).append(td3);
	       	$("#payment").append(tr1);
       		});
		},"json");
	});
</script>
<body>
<div id="container2">
	<jsp:include page="head.jsp"></jsp:include>
    <div class="content clearfix pt5">
    	<div class="l chooseNO_detail_l">
        	<div class=""><img src="${pageContext.request.contextPath}/images/chooseNO_ordCheck.gif" /></div>
            <div class=" ml4 mr5">
            	<!--我的浏览记录-->
                <div class="chooseNO_cook">
                    <h2 class="colfff f16 fwb fofY ti10">我的浏览记录</h2>
                    <div class="p8 bordE0 pb20">
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                         <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                        <dl>
                            <dd class="r">预存：<strong class="colF00">80元</strong></dd>
                            <dt class="f18 colBlue ">158<span class="colO3">1627</span>1225</dt>
                        </dl>
                    </div>
                </div><!--我的浏览记录end-->
                <!--精品推荐-->
                <div class="bordE0 mt5 chooseNO_tj pr" id="ind_banner">
                	<ul class="imgList">
                      <li><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/images/img/chooseNO_tj.jpg" alt="" /></a></li>
                      <li><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/images/img/ind_banner2.jpg" alt="" /></a></li>
                    </ul>
                </div><!--精品推荐end-->
            </div>
        </div>
        <div class="l ml9 ovh chooseNO_detail_r">
        	<div class="where bordBN">您的位置： <a href="index.jsp">首页</a> &gt; <a href="chooseNO.jsp">网上选号</a> &gt; 号码选择 &gt; 套餐选择</div>
            <div class="bordEb p8">
            	<div class="chooseNO_r_t fwb f14 ti10">您选择的手机号码： <span class="colR f18 fofA" id="phone"></span></div>
                <div class="clearfix mt15">
                	<div class="l">
                    	<img class="bord1" width="352" height="352" src="${pageContext.request.contextPath}/images/img/chooseNO_r_tu.jpg" />
                        <div class="mt5 tar"><img width="16" height="15" src="${pageContext.request.contextPath}/images/star.png" class="mr5"><a href="javascript:void(0);">添加到收藏夹</a></div>
                    </div>
                    <div class="r chooseNO_deta_info">
                    	<p class="mt20"><strong class="mr10">价&nbsp;&nbsp;格：</strong><span class="colF00 f26 fofA" id="price">请选择套餐</span></p>
                        <p class="mt15"><strong class="mr10">号码归属：</strong><span class="colF00 f26 fofA" id="city">呼和浩特市</span></p>
                        <div class="detail_color mt10">
                            <strong class="db l mr10">付款方式：</strong>
                            <span class="on">在线付款</span>
                        </div>
                        <div class="clearfix mt20 mr10 div_text_more">
                            <p><strong>手机号码： </strong><span class="f14 fofA mr15" id="photo">15754878942</span><a href="chooseNO.jsp" class="colBlue3">重新选号</a></p>
                            <div class="mt10 fclear clearfix lineheight25 pr zi100">
                                <strong class="l lh24">套&nbsp;&nbsp;&nbsp;&nbsp;餐：</strong>
                                <div class="l set_box">
                                <a id="paymentName" href="javascript:;" class="choose_taocan2 db ml9 t_ellipsis">请选择套餐</a>
                                <!--选择套餐弹出窗-->
                                <div id="chooseNO_popBox" class="popBox chooseNO_popBox hide">
                                    <h2><a href="javascript:void(0);" class="popBox_close" onclick='document.getElementById("chooseNO_popBox").style.display="none";'><img src="${pageContext.request.contextPath}/images/popBox_close.gif" /></a>选择套餐</h2>
                                    <div class="pl20 clearfix mt10">
                                        <ul class="ka_list" id="tc">
                                        </ul>
                                    </div>
                                    <div class="stable_box clearfix ml20 mr15 mt10 pr10">
                                        <table class="set_table">
                                            <tbody>
                                                <tr>
                                                    <th width="150">资费包</th>
                                                    <th width="350">资费及说明</th>
                                                    <th width="80">操作</th>
                                                </tr>
                                            </tbody>
                                            <tbody id="payment">
                                          </tbody>
                                        </table>
                                    </div>
                                    <div class="blank10"></div>
                                    <div class="blank10"></div>
                                </div>
                                <!--选择套餐弹出窗end-->
                                </div> 
                            </div>
                            <div class="clearfix pl20 mt25"><a href="javascript:void(0);" class="buy_btn l ml50" onclick="to();">立即预约</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--商品信息+2-->
            <div class="blank10"></div>
            <div class="chooseNO_r_t fwb f16" id="chooseNO_r_t">
            	<ul class="clearfix">
                	<li class="l ml10 mr30 on">商品信息</li>
                    <li class="l mr30">套餐介绍</li>
                    <li class="l">支付办理方式</li>
                </ul>
            </div>
          <div class="bordEb bordTNo" id="chooseNO_r_con">
           	<div><img src="${pageContext.request.contextPath}/images/img/chooseNO_r_con.jpg" /></div>
                <!--套餐介绍-->
                <div class="hide">
                	<table bgcolor="#c1d4ea">

<tbody><tr bgcolor="white"><td align="center" style="width: 70px;" rowspan="6"><img src="${pageContext.request.contextPath}/images/img/shenzhouxing.jpg" style="width: 87px; height: 22px;"></td><td align="center" style="width: 130px;">便利卡-市话卡-呼和浩特套餐2111</td><td style="width: 390px;">月租0元，来电0元，本地主叫0.30元/分钟，被叫免费,月保底10元，彩铃功能必选6元，可以设10个亲情号码，主号码本地主叫亲情号码0.1元/分钟，国内漫游主叫0.6元/分钟，被叫0.4元/分钟#</td></tr><tr bgcolor="white"><td align="center" style="width: 130px;">便利卡-夜聊卡</td><td style="width: 390px;">月租0元，来电显示0元，本地主叫忙时0.3元/分钟（早8:00-晚23:00)，闲时0.10元/分钟(23：00-8：00)，本地被叫免费夜间聊天市话低至6分钱，月最低消费10元</td></tr><tr bgcolor="white"><td align="center" style="width: 130px;">神州行新家园卡</td><td style="width: 390px;">套餐费10元，区分上下半月，赠送来电、彩铃、30条短信、5条彩信、3M流量、本地主叫0.3元/分钟，本地被叫0；本地直拨长途费：0.07元/6秒；来电显示、GPRS、彩铃、手机报功能；飞信、139邮箱基础功能为必选项；必选基站组47102092 呼市新农村基站通（0.12/0），在基站下本地主叫基本费0.12元/分钟，本地被叫0元/分钟；国内漫游主叫0.6元/分钟，被叫0.4元/分钟。</td></tr><tr bgcolor="white"><td align="center" style="width: 130px;">神州行大众卡</td><td style="width: 390px;">月租5元，来电5元，天气预报3元（必选）或手机报3元任选其一，本地主叫忙时（8：00-23：00）0.2元/分钟，本地主叫闲时（23：00-次日8：00）0.1元/分钟，被叫免费,国内漫游主叫0.6元/分钟，被叫0.4元/分钟。</td></tr><tr bgcolor="white"><td align="center" style="width: 130px;">新神州行大众卡-百姓套餐</td><td style="width: 390px;">月租5元，来电5元，本地主叫0.18元/分钟，被叫免费,月保底30元，国内漫游主叫0.6元/分钟，被叫0.4元/分钟</td></tr><tr bgcolor="white"><td align="center" style="width: 130px;">神州行新长话卡</td><td style="width: 390px;">套餐费12元，区分上下半月，赠送来电、彩铃、30条短信、5条彩信、3M流量、本地主叫0.3元/分钟，本地被叫0；本地直拨长途费：0.1元/分钟；来电显示、GPRS、彩铃、智能来电提醒功能；飞信、139邮箱基础功能为必选项；必选47102091不区分忙闲时，本地直拨国内长途0.1元/分钟促销；国内漫游主叫0.6元/分钟，被叫0.4元/分钟#</td></tr></tbody></table>
            </div><!--套餐介绍end-->
            <!--支付办理方式-->
            <div class="hide">
                <p class="mb10 f14 ml10">网上银行支付</p>
                <p class=" f14 ml10">目前可支持中国工商银行、中国农业银行、招商银行等25家国内主要银行的个人版网银及6家银行的企业版网银支付。支持的银行列表如下：</p>
                <ul class="bank_list_2 ml50 mt20 clearfix">
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank0.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank1.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank2.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank3.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank4.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank5.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank6.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank7.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank8.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank9.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank10.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank11.jpg"> </li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank12.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank13.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank14.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank15.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank16.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank17.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank18.jpg"></li>
                    <li class="bord1"><img width="127" height="40" alt="" src="${pageContext.request.contextPath}/images/bank19.jpg"></li>
                </ul>
            </div><!--支付办理方式end-->
          </div><!--商品信息+2end-->
        </div>
    </div>
    <jsp:include page="tail.jsp"></jsp:include>
</div>
<script type="text/javascript">
var user_id=window.parent.document.getElementById("dl").name;
$(function(){
	
	//精品推荐
	$("#ind_banner").LJ_Slider({
		autotime: 3000,
		Event: "mouseover",
		autoPlay: true,
		Default: 1,
		speed: 300, //出现速度
		setMode: "x",//fade,x,y
		btndisplay:true //是否显左右两边的按钮示按钮 false不显示 true显示
	});
	
	//点击“请选择套餐”
	$("#paymentName").click(function(){
		$("#chooseNO_popBox").removeClass("hide");
		return false;
	});
	$("#chooseNO_popBox a.popBox_close").click(function(){
		$("#chooseNO_popBox").addClass("hide");
		return false;
	});
	$("#payment a.colBlue2").click(function(){
		var _html = $(this).parent().parent().find("td").first().jsp();
		$("#chooseNO_popBox").addClass("hide");
		$("#paymentName").jsp(_html);
		return false;
	});
	
	//商品信息+2
	$("#chooseNO_r_t > ul > li").click(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#chooseNO_r_con > div").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
})
function to(){
	var user_id=window.parent.document.getElementById("dl").name;
	if(user_id!=""){
	if(q!=-1){
		//此处操作
		//froms1
		//mmf!tomain
		var fromes=$("<form>",{
			id:'froms1',
			action:'mmf!toinfo',
			method:'post'
		})
		var hidden1=$("<input>",{
			type:'hidden',
			name:'jg',
			value:jg
		});
		var hidden2=$("<input>",{
			type:'hidden',
			name:'photo',
			value:photo
		});
		var hidden3=$("<input>",{
			type:'hidden',
			name:'pricemin',
			value:pricemin
		});
		var hidden4=$("<input>",{
			type:'hidden',
			name:'uname',
			value:uname
		});
		var hidden5=$("<input>",{
			type:'hidden',
			name:'sad',
			value:sad
		});
		var hidden6=$("<input>",{
			type:'hidden',
			name:'ssw',
			value:ssw
		});
		var hidden7=$("<input>",{
			type:'hidden',
			name:'user_id',
			value:user_id
		});
		var hidden8=$("<input>",{
			type:'hidden',
			name:'lb',
			value:1
		});
		$(fromes).append(hidden1);
		$(fromes).append(hidden2);
		$(fromes).append(hidden3);
		$(fromes).append(hidden4);
		$(fromes).append(hidden5);
		$(fromes).append(hidden6);
		$(fromes).append(hidden7);
		$(fromes).append(hidden8);
		$("#paymentName").append(fromes);
		document:froms1.submit();
	}else{
		alert("请选择套餐");
	}
	}else{
		alert("请先登录");
	}
}
</script>
</body>
</html>
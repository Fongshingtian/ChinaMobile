<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/base.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Slider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/scroll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/slider_lr.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/function.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('*');
</script>
<![endif]-->
<style type="text/css">
.scroll_l {
	width: 75;
	display: none;
}

.scroll_r {
	display: none; . scroll_l a{ display : block;
	float: left;
}
</style>

</head>
<body>
	<div id="container">
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content">
			<div class="ind_whe">
				<strong class="f14">商品分类 ></strong>
			</div>
			<div class="ovh ind_top1">
				<!--商品分类-->
          <div class="ind_fl pr" id="ind_fl">
            	<ul>
                	<li><a href="yyzq.jsp" class="ind_fl_t yy">网上选号</a>
                    	<div class="ind_fl_list pa">
                        	<h2>号段类型</h2>
                            <p><a href="javascript:void(0);">134</a> | <a href="javascript:void(0);">135</a> | <a href="javascript:void(0);">136</a> | <a href="javascript:void(0);">159</a> | <a href="javascript:void(0);">138</a> | <a href="javascript:void(0);">150</a> | <a href="javascript:void(0);">151</a> | <a href="javascript:void(0);">158</a> | <a href="javascript:void(0);">186</a> | <a href="javascript:void(0);">188</a> | <a href="javascript:void(0);">189</a></p>
							<h2>吉祥号码</h2>
                            <p><a href="javascript:void(0);">168一路发</a> | <a href="javascript:void(0);">1818要发要发</a> | <a href="javascript:void(0);">518我要发</a> | <a href="javascript:void(0);">666六六大顺</a> | <a href="javascript:void(0);">888发发发</a> | <a href="javascript:void(0);">99久久不忘</a> | <a href="javascript:void(0);">AABB</a></p>
                           
                            <h2>爱情号码</h2>
                            <p><a href="javascript:void(0);">一生一世 1314</a> | <a href="javascript:void(0);">爱你一生 2013</a> | <a href="javascript:void(0);">生生世世 3344</a> | <a href="javascript:void(0);">我爱你 520</a> | <a href="javascript:void(0);">我爱上你5230</a> | <a href="javascript:void(0);">亲亲我吧7758</a></p>
                        </div>
                    </li>
                    <li><a href="hygj.jsp" class="ind_fl_t hy">热销商品</a>
                    	<div class="ind_fl_list pa">
                        	<h2>手机机型</h2>
                            <p><a href="javascript:void(0);">华为</a>｜<a href="javascript:void(0);">摩托罗拉</a>｜<a href="javascript:void(0);">中兴</a>｜<a href="javascript:void(0);">诺基亚</a>｜<a href="javascript:void(0);">HTC</a>｜<a href="javascript:void(0);">三星</a></p>
                            <h2>话费优惠</h2>
                            <p><a href="javascript:void(0);">1-499</a>｜<a href="javascript:void(0);">500-999</a>｜<a href="javascript:void(0);">1000-1999</a>｜<a href="javascript:void(0);">2000-2999</a>｜<a href="javascript:void(0);">3000以上</a></p>
                            <h2>月最低消费</h2>
                            <p><a href="javascript:void(0);">30元-50元</a>｜<a href="javascript:void(0);">100元-300元</a></p>
                        </div>
                    </li>
                    <li><a href="xjzx.jsp" class="ind_fl_t cj">选机中心</a>
                    	<div class="ind_fl_list pa">
                        	<h2>手机类别</h2>
                            <p><a href="javascript:void(0);">智能手机</a>｜<a href="javascript:void(0);">商务手机</a>｜<a href="javascript:void(0);">拍照手机</a>｜<a href="javascript:void(0);">电视手机</a>｜<a href="javascript:void(0);">音乐手机</a>｜<a href="javascript:void(0);">老人机</a>｜<a href="javascript:void(0);">儿童机简约</a>｜<a href="javascript:void(0);">实用手机</a></p>
                            <h2>手机机型</h2>
                            <p><a href="javascript:void(0);">华为</a>｜<a href="javascript:void(0);">摩托罗拉</a>｜<a href="javascript:void(0);">中兴</a>｜<a href="javascript:void(0);">诺基亚</a>｜<a href="javascript:void(0);">HTC</a>｜<a href="javascript:void(0);">三星</a></p>
                            <h2>手机价格</h2>
                            <p><a href="javascript:void(0);">1-499</a>｜<a href="javascript:void(0);">500-999</a>｜<a href="javascript:void(0);">1000-1999</a></p>   
                        </div>
                    </li>
                    <li><a href="thzq.jsp" class="ind_fl_t th">特惠专区</a>
                    	<div class="ind_fl_list pa">
                        	<h2>商城特惠</h2>
                            <p><a href="javascript:void(0);">0元购机</a>｜<a href="javascript:void(0);">预存话费优惠购机</a>｜<a href="javascript:void(0);">购机赠话费</a></p>
                            <h2>地市特惠</h2>
                            <p><a href="javascript:void(0);">【呼和浩特】赠礼分</a>｜<a href="javascript:void(0);">【鄂尔多斯】Y300t无保底</a></p>
                            <h2>季度活动</h2>
                            <p><a href="javascript:void(0);">5.17活动</a>｜<a href="javascript:void(0);">儿童机活动</a></p>
                            <h2>六日特价</h2>
                            <p><a href="javascript:void(0);">优惠购机</a>｜<a href="javascript:void(0);">0元秒杀</a></p>
                        </div>
                    </li>
                </ul> 
            </div><!--商品分类end-->
				<!--滚动图-->
				<div class="ind_banner pr" id="ind_banner"></div>
				<!--滚动图end-->
				<!--商城公告+促销活动-->
				<div class="ind_ggHd r">
					<div class="ind_ggHd_c">
						<ul class="ind_ggHd_tit" id="ind_ggHd_tit">
							<li class="on">商城公告</li>
							<li>促销活动</li>
						</ul>
						<div class="ind_ggHd_list" id="ind_ggHd_list">
							
						</div>
					</div>
					<div class="ind_jytj" id="qg">
						<img src="${pageContext.request.contextPath}/images/ind_ggHd.gif" />
						
					</div>
				</div>
				<!--商城公告+促销活动end-->
			</div>
			<div class="blank10"></div>
			<div class="ovh clearfix mt5">
				<div class="l chooseNO_l">
					<!--普通选号-->
					<div class="bordBlue">
						<h2 class="colBlue2 f14 fwb chooseNO_list_t">
							<span class="r mr10"><a href="javascript:void(0);"
								class="colBlue2">更多...</a></span><img class="l ml10 mt8 mr5"
								src="${pageContext.request.contextPath}/images/chooseNO_list_t.gif" />普通选号
						</h2>
						<div class="p8 chooseNO_list">
							<table>
								<tr>
									<th width="16%">号码</th>
									<th width="16%">地市</th>
									<th width="14%">品牌</th>
									<th width="16%">内含话费</th>
									<th width="21%">总计</th>
									<th width="17%">操作</th>
								</tr>
								<tbody id="tb1"></tbody>
							</table>
						</div>
					</div>
					<!--普通选号end-->
					<!--精彩靓号-->
					<div class="blank10"></div>
					<div class="bordBlue">
						<h2 class="colBlue2 f14 fwb chooseNO_list_t">
							<span class="r mr10"><a href="javascript:void(0);"
								class="colBlue2">更多...</a></span><img class="l ml10 mt8 mr5"
								src="${pageContext.request.contextPath}/images/chooseNO_list_t.gif" />精彩靓号
						</h2>
						<div class="p8 chooseNO_list">
							<table>
								<tr>
									<th width="16%">号码</th>
									<th width="16%">地市</th>
									<th width="14%">品牌</th>
									<th width="16%">内含话费</th>
									<th width="21%">总计</th>
									<th width="17%">操作</th>
								</tr>
								<tbody id="tb2"></tbody>
								
							</table>
						</div>
					</div>
					<!--精彩靓号end-->
					<!--精彩业务-->
					<div class="blank10"></div>
					<div class="bordBlue">
						<h2 class="colBlue2 f14 fwb chooseNO_list_t">
							<span class="r mr10"><a href="javascript:void(0);"
								class="colBlue2">更多...</a></span><img class="l ml10 mt8 mr5"
								src="${pageContext.request.contextPath}/images/chooseNO_list_t.gif" />精彩业务
						</h2>
						<div class="p8 chooseNO_list">
							<div id="chooseNO2_jsyw" class="clearfix mt10 mb10 jsyw_list">
								<a href="#left" class="abtn l aleft mr10"></a>
								<div class="imglist">
									<ul class="clearfix">
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机导航]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw1.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机语音]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw2.jpg" /></a>
										</li>
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机阅读]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw3.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机游戏]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw4.jpg" /></a>
										</li>
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机视频]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw5.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机报]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw6.jpg" /></a>
										</li>
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机动漫]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw7.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[无线音乐]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw8.jpg" /></a>
										</li>
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机视频]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw5.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机报]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw6.jpg" /></a>
										</li>
										<li><a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[手机动漫]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw7.jpg" /></a>
											<a href="javascript:void(0);" class="clearfix mb12"><span
												class="r colO4 f18 fwb">[无线音乐]</span><img
												src="${pageContext.request.contextPath}/images/chooseNO2_jsyw8.jpg" /></a>
										</li>
									</ul>
								</div>
								<a href="#right" class="abtn r aright mr5"></a>
							</div>
						</div>
					</div>
					<!--精彩业务end-->
				</div>
				<div class="r ind_ggHd">
					<!--热销商品-->
					<div class="chooseNO_hot">
						<h2 class="fwb ti10">热销商品</h2>
						<div class="bordE0 p8" id="rxsp">
							
						</div>
					</div>
					<!--热销商品end-->
				</div>
			</div>
			<div class="blank10"></div>
		</div>
		<jsp:include page="tail.jsp"></jsp:include>
	</div>
	<!--左右两边滚动-->
	<div class="scroll_l">
		<a href="shoppingCar.jsp"><img
			src="${pageContext.request.contextPath}/images/scroll_l.gif" /></a><a
			href="orderCheck.jsp"><img
			src="${pageContext.request.contextPath}/images/scroll_l_OC.gif"
			class="mt5" /></a>
	</div>
	<div class="scroll_r">
		<a href="javascript:void(0);"><img
			src="${pageContext.request.contextPath}/images/scroll_r.gif" /></a>
	</div>

	<script type="text/javascript">
	
	$(function(){
		$("#choosea").addClass('on');
		$.fn.float = function (options) {
		    defaults = {
		        delay : 200,//延迟时间
		        position:"lm" //位置
		    }
		    var options = $.extend(defaults, options);
		    var $this = $(this); //指向所有scroll_l
		    if(options.position == "lm"){
		        $this.css("position","fixed").css("left","0").css("top","50%").css("transform","translate(0,-50%)");
		    }else if(options.position == "rb") {
		        var widthLength = $(window).width();
		        console.log(widthLength);
		        $this.css("position","fixed").css("right","0px").css("bottom","0px");
		    }
		    setTimeout(function () {
		        $this.css("display","block");
		    },options.delay);
		    
		}
//		轮播图
		$.post("gj!allRotationImage",{},function(data){
//			alert(data);
			var list=data.rlist;
			var ss="<ul class='imgList'>";
			$.each(list,function(index,r){
				console.log(r);
				if(index==0){
					ss+="<li><a href='javascript:void(0);'><img width=737 height=238 src='${pageContext.request.contextPath}/imgs/"+r.image1+"' alt='' /></a></li>";
					ss+="<li><a href='javascript:void(0);'><img width=737 height=238 src='${pageContext.request.contextPath}/imgs/"+r.image2+"' alt='' /></a></li>";
					ss+="<li><a href='javascript:void(0);'><img width=737 height=238 src='${pageContext.request.contextPath}/imgs/"+r.image3+"' alt='' /></a></li>";
					ss+="<li><a href='javascript:void(0);'><img width=737 height=238 src='${pageContext.request.contextPath}/imgs/"+r.image4+"' alt='' /></a></li>";
				}
			});
			ss+="</ul>";

			$("#ind_banner").html(ss);
		//大图滚动
		$("#ind_banner").LJ_Slider({
			autotime: 3000,
			Event: "mouseover",
			autoPlay: true,
			Default: 1,
			speed: 300, //出现速度
			setMode: "x",//fade,x,y
			btndisplay:true //是否显左右两边的按钮示按钮 false不显示 true显示
		});
	
		},"json");
		
		//左右两边滚动--购物车，订单查询，客服
		$(".scroll_l").float({
			delay : 200,//延迟
			position:"lm" //位置
		});
		$(".scroll_r").float({
			delay : 200,//延迟
			position:"rb" //位置
		});
		
		//网上选号
		$.post("gj!allphonenumber",{},function(data){
			var list1=data.list1;
		
			var s1="";
			$.each(list1,function(index,t1){
				console.log(t1);

				s1+="<tr><td>"+t1.phone_number+"</td><td>"+t1.city+"</td><td>"+t1.brand+"</td><td>"+t1.have_fare
				+"</td><td class='colO4'>￥"+t1.price+"</td> <td><a href='mmf!tochooseno?id="+t1.id+"'><img src='${pageContext.request.contextPath}/images/chooseNO_list_btn.gif' /></a></td></tr>";
			});
			$("#tb1").append(s1);
			
			var list2=data.list2;
			var s2="";
			$.each(list2,function(index,t2){
				s2+="<tr><td>"+t2.phone_number+"</td><td>"+t2.city+"</td><td>"+t2.brand+"</td><td>"+t2.have_fare
				+"</td><td class='colO4'>￥"+t2.price+"</td> <td><a href='mmf!tochooseno?id="+t2.id+"'><img src='${pageContext.request.contextPath}/images/chooseNO_list_btn.gif' /></a></td></tr>";
			});
			$("#tb2").append(s2);
			
		
		},"json");
		
		//热销商品
		$.post("gj!allpsm",{},function(data){
			var list=data.list;
			var ss="<ul class='tac'>";
			$.each(list,function(index,l){
				
				console.log(l);
				ss+="<li class='f14 mb10'>";
				if("神州行"===l.brand){
					ss+="<a href=\'chooseNO_detail.jsp\'><img src=\'${pageContext.request.contextPath}/images/img/tc1.png\' class=\'bordBlue\' /></a>";
				}else if("全球通"===l.brand){
					ss+="<a href=\'chooseNO_detail.jsp\'><img src=\'${pageContext.request.contextPath}/images/img/qqt.png\' class=\'bordBlue\' /></a>";
				}else if("动感地带"===l.brand){
					ss+="<a href=\'chooseNO_detail.jsp\'><img src=\'${pageContext.request.contextPath}/images/img/tc2.png\' class=\'bordBlue\' /></a>";
				}
				
				ss+="<h3 class='mt10 mb5 fwb'><a href='chooseNO_detail.jsp'>"+l.name+"</a></h3>";

			});
			ss+="</ul>";
			$("#rxsp").append(ss);
		},"json");

		//查询商城公告或是促销活动
		$.post("gj!allnotice",{},function(data){
			var list1=data.list1;
			var s1="<ul>";
			$.each(list1,function(index,n){
				s1+=" <li><a href='javascript:void(0);' target='_blank'>"+n.name+"</a></li>";
			});
			s1+="</ul>";
			$("#ind_ggHd_list").append(s1);
			
			var list2=data.list2;
			var s2="<ul class='hide'>";
			$.each(list2,function(index,l){
				console.log(l);

				s2+="<li><a href='javascript:void(0);'>"+l.name+"</a></li>";
			});
			s2+="</ul>";
			$("#ind_ggHd_list").append(s2);

		},"json");
		
		//查询状态为抢购的商品
		$.post("gj!selwares",{},function(data){
			var qg=data.qg;
			var ss="<dl class='clearfix'>";
			$.each(qg,function(index,q){
// 				alert(index);
				console.log(q);
				if(index==0){
					//alert(q.photo);
					ss+="<dt><a href='pro_detail.jsp'><img src='${pageContext.request.contextPath}/imgs"+q.photo+"' /></a></dt>";
					ss+="<dd><em>￥"+q.price+"</em><a href='pro_detail.jsp' title="+q.introduction+" class='fwb t_ellipsis'>"+q.name+"<br/>"+q.introduction+"</a></dd>";
				}
			});
			ss+="</dl>";
			$("#qg").append(ss);
	
		},"json");

	});
</script>
</body>
</html>
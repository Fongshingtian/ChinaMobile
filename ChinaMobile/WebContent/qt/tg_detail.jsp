<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>团购-产品详情页</title>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slider_lr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shareto.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
<!--放大镜-->
<SCRIPT src="${pageContext.request.contextPath}/js/base.js" type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/js/lib.js" type="text/javascript"></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/js/163css.js" type="text/javascript"></SCRIPT>
<!--放大镜end-->
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('*');
</script>
<![endif]-->
<style type="text/css">
#msgDiv {
    z-index:10001;
    width:500px;
    height:400px;
    background:white;
    border:#336699 1px solid;
    position:absolute;
    left:50%;
    top:20%;
    font-size:12px;
    margin-left:-225px;
    display: none;
}
#bgDiv {
	z-index:1000;
    display: none;
   position: fixed;
    width: 100%;
	height: 100%;
    top: 0px;
    left: 0px;
    right:0px;
    background-color: #777;
    bottom:0;
    filter:progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75);
    opacity: 0.6;
}
</style>
</head>
<script type="text/javascript">
	var maxtime =maxtime = dayBetween('${group.end_time}');
	function dayBetween(DateTwo){//获取时间差 单位毫秒
		var DateOne=CurentTime();
		var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));
	    var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);
	    var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
		
	    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));
	    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);
	    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));
		
	   var cha=((Date.parse(OneYear+'/'+OneMonth+'/'+OneDay)- Date.parse(TwoYear+'/'+TwoMonth+'/'+TwoDay))/1000); 
	    return Math.abs(cha); //单位秒
	}
	function CurentTime()//获取当前时间。
	{ 
	    var now = new Date();
	    
	    var year = now.getFullYear();       //年
	    var month = now.getMonth() + 1;     //月
	    var day = now.getDate();            //日
	    
	    var hh = now.getHours();            //时
	    var mm = now.getMinutes();          //分
	    var ss = now.getSeconds();           //秒
		
	    var clock = year + "-";
	    
	    if(month < 10)
	        clock += "0";
	    
	    clock += month + "-";
	    
	    if(day < 10)
	        clock += "0";
	        
	    clock += day + " ";
	    
	    if(hh < 10)
	        clock += "0";
	        
	    clock += hh + ":";
	    if (mm < 10) clock += '0'; 
	    clock += mm + ":"; 
	     
	    if (ss < 10) clock += '0'; 
	    clock += ss; 
	    return(clock); 
	}	
	 function CountDown() {
	       if (maxtime >= 0) {
	           minutes = Math.floor(maxtime / 60);
	          seconds = Math.floor(maxtime % 60);
				 day=Math.floor(maxtime/86400);
				 hour=Math.floor((maxtime/3600)-day*24);
	
				 minutes=Math.floor((maxtime/60)-(hour*60)-day*24*60);
	
	          $("#day").html(day);
	          $("#hour").html(hour);
	          $("#minute").html(minutes);
	          $("#second").html(seconds);
	          --maxtime;
	      }
	  }
	//倒计时时间 maxtime
	 timer = setInterval("CountDown()", 1000);   
	 CountDown();  
</script>
<body>
<div id="msgDiv">
    <center><div id="msgDetail"></div></center>
</div>
<div id="bgDiv"></div>
<div id="container">
  <!--头部-->
  <jsp:include page="head.jsp"></jsp:include>
  <!--头部end-->
  <div class="content clearfix">
  	<div class="blank10"></div>
    <div class="l detail_l">
    	<div class="bordCc">
        	<h2 class="colBlue2 fwb f14">相关分类</h2>
            <ul class="detail_l_fl p8">
            	<li><a href="javascript:void(0);"><span class="l">上网卡</span>&gt;</a></li>
                <li><a href="javascript:void(0);"><span class="l">手机</span>&gt;</a></li>
                <li class="nbord"><a href="javascript:void(0);"><span class="l">套卡</span>&gt;</a></li>
            </ul>
        </div>
        <div class="blank10"></div>
        <!--浏览手机用户最终购买-->
        <div class="bordCc">
        	<h2 class="colBlue2 fwb f14">浏览手机用户最终购买</h2>
            <ul class="p8 clearfix detail_l_ll">
            	<li>
                	<a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/detail_l_ll1.jpg" /></a>
                    <h3 class="mt10"><strong class="colF00">41.4%会买：</strong><a href="pro_detail.jsp">联想 A630t</a></h3>
                    <p><a href="pro_detail.jsp">0元购机预存399元话费</a></p>
                    <span class="colF00">已销售5648件&nbsp;&nbsp;被浏览30196次</span>
                </li>
                <li>
                	<a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/detail_l_ll1.jpg" /></a>
                    <h3 class="mt10"><strong class="colF00">41.4%会买：</strong><a href="pro_detail.jsp">联想 A630t</a></h3>
                    <p><a href="pro_detail.jsp">0元购机预存399元话费</a></p>
                    <span class="colF00">已销售5648件&nbsp;&nbsp;被浏览30196次</span>
                </li>
                <li>
                	<a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/detail_l_ll1.jpg" /></a>
                    <h3 class="mt10"><strong class="colF00">41.4%会买：</strong><a href="pro_detail.jsp">联想 A630t</a></h3>
                    <p><a href="pro_detail.jsp">0元购机预存399元话费</a></p>
                    <span class="colF00">已销售5648件&nbsp;&nbsp;被浏览30196次</span>
                </li>
                <li>
                	<a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/detail_l_ll1.jpg" /></a>
                    <h3 class="mt10"><strong class="colF00">41.4%会买：</strong><a href="pro_detail.jsp">联想 A630t</a></h3>
                    <p><a href="pro_detail.jsp">0元购机预存399元话费</a></p>
                    <span class="colF00">已销售5648件&nbsp;&nbsp;被浏览30196次</span>
                </li>
            </ul>
        </div><!--浏览手机用户最终购买end-->
    </div>
    <div class="r detail_r">
    	<div class="where bordBN">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; <a href="tg.jsp">团购</a> &gt; 您当前所在位置： 酷派8010荣耀四核手机2G版 正品行货现货 安卓智能触屏</div>
      <div class="bordCc p25">
        	<div class="ovh clearfix">
            	<div class="l detail_r_l">
                	<!--放大镜-->
							<div id="preview">
								<div class="jqzoom bordCc" id="spec-n1">
								</div>
								<div id="spec-n5">
									<div class="control" id="spec-left">
										<img
											src="${pageContext.request.contextPath}/images/jqzoom_left.gif" />
									</div>
									<div id="spec-list">
									</div>
									<div class="control" id="spec-right">
										<img
											src="${pageContext.request.contextPath}/images/jqzoom_right.gif" />
									</div>

								</div>
							</div>
                    <SCRIPT type=text/javascript>
                    $(function(){			
                       })
                    </SCRIPT>
                    <!--放大镜end-->
                    <div class="blank10"></div>
                    <div class="ovh clearfix">
                        <div class="r"><span class="fr"><img width="16" height="15"  class="mr5" src="${pageContext.request.contextPath}/images/star.png"><a href="javascript:addToFav();">添加到收藏夹</a></span></div>
                        <!--分享-->
                        <div class="shareto">
                            <ul>
                            	<li><a onclick="share_to('tsina');return false;" title="新浪微博" href="#"><img src="${pageContext.request.contextPath}/images/sina.gif"></a></li>
                                <li><a onclick="share_to('tqq');return false;" href="#"><img src="${pageContext.request.contextPath}/images/qqw.gif"></a></li>
                                <li><a onclick="share_to('renren');return false;" href="#"><img src="${pageContext.request.contextPath}/images/renren.gif"></a></li>
                                <li><a onclick="share_to('kaixin001');return false;" href="#"><img src="${pageContext.request.contextPath}/images/kaixin.gif"></a></li>
                                <li><a onclick="share_to('douban');return false;" href="#"><img src="${pageContext.request.contextPath}/images/douban.gif"></a></li>
                            </ul>点击图标进行分享
                        </div> <!--分享end-->
                    </div>
                </div>
                <!-- 倒计时 -->
						<div class="r detail_r_r pt15" style="padding-top:10px;padding-right:0px">
							<font  style="font-size: 20px;line-height: 30px">
								${group.detail}<br>
								团购价: ￥ ${group.price }<br>
								市场价: <font id='oprice' style="text-decoration: line-through;"></font><br>
								当前参团人数:${group.user_count }<br>
							</font>
							<div style='margin-top:50px' id='time' class="tg_detail_time clearfix f14 mt80 mb50 ml20">
								<span class="l"><i id="day" ></i></span>
								<samp class="l" >天</samp>
								<span class="l" ><i id='hour'></i></span>
								<samp class="l">时</samp>
								<span class="l" ><i id='minute'></i></span>
								<samp class="l">分</samp>
								<span class="l"><i id='second'></i></span>
								<samp class="l">秒</samp>
							</div>
							<div class="blank10"></div>
							<p style="height: 155px" class="f16 lh34 ml20 tg_detail_info">
								1、全场包邮，数量有限，先抢先得！<br />2、每个手机仅捆绑一个号码，5人起团。<br />3、参团时间结束，收到付款短信提示后请在24小时内完成支付。
							</p>
							<div class="mt20 ml20">
								<a class="buy_btn l ml50" href="javascript:void(0);" onclick="ct();">立即参团</a> 
							</div>
						</div>
					</div>
					<div class="blank10"></div>
					<div class="blank10"></div>
					<div class="blank10"></div>
					<!--商品介绍+4-->
					<script type="text/javascript">
						var curr=1;
						var pcount=2;
						var count=0;
						var tpage=0;
						var msg="never";
						$(function() { 
							gDetail(curr);
							
						});
						//获得团购详细 
						function gDetail(c){
							if(c<=1){
								curr=1;
								c=1;
							}
							if(c>=tpage&&tpage!=0){
								c=tpage;
								curr=tpage;
							}
							$.post("gj!groupDetail",{currpage:c,pagecount:2,id:'${id}',msg:msg},function(data){
								var comment= data.detail;
								var detail ="";
								var ware  =data.ware;
								var color=data.color;
								//第一次进入页面时 访问
								if(msg=='never'){
									$("#oprice").html("￥  "+ware.price);
									var img1=$("<img>",{
										src:'${pageContext.request.contextPath}/imgs/'+ware.photo,	
										jqimg:'${pageContext.request.contextPath}/imgs/'+ware.photo,
										width:'348',
										height:'348'
									});
									$("#spec-n1").append(img1);
									var ul1=$("<ul>",{
										class:'list-h',
										id:'ul1'
									});
									var li0=$("<li>",{
									});
									var imgl0=$("<img>",{
										src:'${pageContext.request.contextPath}/imgs/'+ware.photo,
										class:'cur'
									});
									$(li0).append(imgl0);
									$(ul1).append(li0);
									for(var i=0;i<color.length;i++){
										var li1=$("<li>",{
										});
										var imgl1=$("<img>",{
											src:'${pageContext.request.contextPath}/imgs/'+color[i].image
										});
										$(li1).append(imgl1);
										$(ul1).append(li1);
									}
									$("#spec-list").append(ul1);
									msg="been";
									count = data.count;
									tpage=data.totalpage;
									$("#ccount").append("("+count+")");
									var imgs = data.ware.detail.split(',');
									//获得商品介绍图片
									for (var i = 0; i < imgs.length; i++) {
										detail += "<div id='dImg' style='width:100%;'><img style='width:918px' src='${pageContext.request.contextPath}/imgs/"+imgs[i]+"'></div>";
									}
									$("#detail").append(detail);
									var detailed_list = "<div style='width:928px;'><img style='width:918px' src='${pageContext.request.contextPath}/imgs/"+data.ware.detailed_list+"'></div>";
									var parameter = "<div style='width:928px;'><img style='width:918px' src='${pageContext.request.contextPath}/imgs/"+data.ware.parameter+"'></div>";
									var guarantee = "<div style='width:928px;'><img style='width:918px' src='${pageContext.request.contextPath}/imgs/"+data.ware.guarantee+"'></div>";
									$("#detailed_list").append(detailed_list);
									$("#parameter").append(parameter);
									$("#guarantee").append(guarantee);
								}
								innerHTML="";
								//获得用户评论
								for(var i=0;i<comment.length;i++){
									innerHTML+=
										"<br/><div style='width: 90%;border-bottom:1px solid lightgray'>"
										+"<table>"
											+"<tr>"
												+"<td valign='top' width='20%' align='center'><img width='70px' height='70px' src='${pageContext.request.contextPath}/imgs/"+comment[i].FACE+"' /><br/><font style='font-size:16px;font-family: 微软雅黑;'>"+comment[i].NAME+"</font><br/><br/></td>"
												+"<td valign='top'>"
													+"<div style='width: 95%'><font style='font-size:17px;font-weight:500;font-family: 微软雅黑;'>"+comment[i].CONTENT+"</font><br/><br/></div>"
													+"<div>"+comment[i].DATETIME+"<br/><br/></div>"
												+"</td>"
											+"</tr>"
										+"</table>"
									+"</div><br><br>";
								}
								//分页
								var first="<center><input type='button' id='first' value='<<'> ";
								var last=" <input type='button' id='last' value='<'> ";
								var page=" "+c+" ";
								var next=" <input type='button' id='next' value='>' > ";
								var end=" <input type='button' id='end' value='>>' ></center> ";
								innerHTML+=first+last+page+next+end;
								$("#comment").html("");
								$("#comment").append(innerHTML);
								$("#first").click(function(){
									gDetail(1);
								});
								$("#last").click(function(){
									curr--;
									gDetail(curr);
								});
								$("#next").click(function(){
									curr++;
									gDetail(curr);
								});
								$("#end").click(function(){
									gDetail(tpage);
								});
								//根据当前页来确定按钮是否可编辑
								if(c<=1){
									$("#first").attr("disabled",true);
									$("#last").attr("disabled",true);
								}if(c>=tpage){
									$("#next").attr("disabled",true);
									$("#end").attr("disabled",true);
								}
								$(".jqzoom").jqueryzoom({
		                            xzoom:400,
		                            yzoom:400,
		                            offset:10,
		                            position:"right",
		                            preload:1,
		                            lens:1
		                        });
		                        $("#spec-list").jdMarquee({
		                            deriction:"left",
		                            width:240,
		                            height:86,
		                            step:1,
		                            speed:1,
		                            delay:10,
		                            control:true,
		                            _front:"#spec-right",
		                            _back:"#spec-left"
		                        });
		                        $("#spec-list img").bind("mouseover",function(){
		                            var src=$(this).attr("src");
		                            $("#spec-n1 img").eq(0).attr({
		                                src:src.replace("\/n5\/","\/n1\/"),
		                                jqimg:src.replace("\/n5\/","\/n0\/")
		                            });
		                            $("#spec-list img").removeClass("cur");
		                            $(this).addClass("cur");
		                        });				
		                    
							},"json");
						}
					</script>
					<div class="detail_cont">
						<a style='e'></a>
						<ul class="detail_cont_t clearfix f14" id="detail_cont_t">
							<li class="nobd on">商品介绍</li>
							<li>规格参数</li>
							<li>包装清单</li>
							<li id="ccount">商品评论</li>
							<li>售后保障</li>
						</ul>
						<div class="detail_cont_list p8 pt20 pb20" id="detail_cont_list">
							<!--商品介绍-->
							<div id='detail'></div>
							<!--商品介绍end-->
							<!--规格参数-->
							<div id='parameter' class="hide"></div>
							<!--规格参数end-->
							<!--包装清单-->
							<div  id='detailed_list' class="hide"></div>
							<!--包装清单end-->
							<!--商品评论-->
							<div id='comment' class="hide"></div>
							<!--商品评论end-->
							<!--售后保障-->
							<div id='guarantee' class="hide"></div>
							<!--售后保障end-->
						</div>
					</div>
					<!--商品介绍+4end-->
        </div>
        <!--根据浏览为我推荐-->
        <div class="blank10"></div>
        <div class="yyzq_tj">
            <h3 class="f14 fwb">根据浏览为我推荐</h3>
            <div class="blank10"></div>
            <div id="yyzq_tj" class="scrolllist clearfix">
                <a title="左移" href="#left" class="abtn l aleft"></a>
                <div class="imglist_w imglist_w2">
                    <ul class="imglist clearfix">
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通2</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通3</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通4</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通5</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通6</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通7</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通8</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通8</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                        <li>
                            <a href="pro_detail.jsp"><img src="${pageContext.request.contextPath}/images/img/yyzq_tj1.jpg" class="mb10" /></a>
                            <p><a href="pro_detail.jsp">三星 S5296 GSM手机（白色）双卡双待单通8</a></p>
                            <span class="db mb5"><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx2.gif" /><img src="${pageContext.request.contextPath}/images/yyzq_xx1.gif" /></span>
                            <span class="show colBlue">(已有428人评价)</span>
                            <span class="colR fofA">￥388.00</span>
                        </li>
                    </ul>
                </div>
                <a title="右移" href="#right" class="abtn r aright"></a>
            </div>
        </div><!--根据浏览为我推荐end-->
    </div>
  </div>
  <div class="blank10"></div>
  <div class="blank10"></div>
  <!--底部-->
  <div id="footer">
    <div class="blank10"></div>
        <div class="footer_help clearfix">
            <ul class="foot_ul1">
                <li><strong>全场免邮</strong>配送范围内免邮费</li>
                <li class="hdfk"><strong>货到付款</strong>现金支付安全放心</li>
                <li class="gkzs"><strong>顾客至上</strong>优质售前售后服务</li>
                <li class="slbz"><strong>质量保证</strong>真正行货又便宜</li>
            </ul>
            <ul class="foot_ul2">
                <li><h3>新手指南</h3><a href="help.jsp">注册新用户</a><a href="help.jsp">购买流程</a></li>
                <li class="fffs"><h3>付费方式</h3><a href="help.jsp">支付方式</a><a href="help.jsp">常见支付问题</a></li>
                <li class="psfs"><h3>配送方式</h3><a href="help.jsp">配送方式时限</a><a href="help.jsp">配送运费收费标准</a></li>
                <li class="shfw"><h3>售后服务</h3><a href="help.jsp">退换货原则</a><a href="help.jsp">如何办理退换货</a></li>
                <li class="help"><h3>帮助中心</h3><a href="help.jsp">常见热点问题</a><a href="help.jsp">投诉与建议</a></li>
            </ul>
        </div>
        <div class="copyright"><span class="r"><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备05002571号</a>|<a href="http://www.nm.10086.cn/" target="_blank">中国移动通信集团内蒙古有限公司版权所有</a></span><a href="javascript:void(0);">法律声明</a> | <a href="http://www.10086.cn/web_notice/contact/" target="_blank">联系我们</a> | <a href="http://www.10086.cn/support/channel/10086/" target="_blank">服务热线10086</a> | <a href="http://www.nm.10086.cn/sitemap/" target="_blank">网站地图</a> | <a href="http://job.10086.cn/" target="_blank">招聘信息</a> |</div>
    </div>
    <!--底部end-->
</div>
<script type="text/javascript">
var click1="";
var cos="";
$(function(){
	
	//根据浏览为我推荐--左右滚动
	$("#yyzq_tj").xslider({
		unitdisplayed:4,
		movelength:4,
		unitlen:170,
		autoscroll:null
	});
	
})
function ct(){//跳转路径window.location.href='tg_info.jsp';
	var user_id=window.parent.document.getElementById("dl").name;
	if(user_id!=""){
		//window.location.href='tg_info.jsp';
		id="${id}";
		//alert("商品id"+id);
		$.post("mmf!indexs",{"id":id},function(data){
			//alert(data.json.clist.length);
			showDetail();
			var img2=$("<img>",{
				id:'img1',
				src:'${pageContext.request.contextPath}/imgs/'+data.json.ware.photo,
				width:'280px',
				height:'280px'
			});
			$("#msgDetail").append(img2);
			var div2=$("<div>",{
				class:'detail_color mt10'
			});
			var strong2=$("<strong>",{
				text:'颜  色:'
			});
			$(div2).append(strong2);
			$.each(data.json.clist,function(index,s){
				var span21=$("<span>",{
					id:'color'+index,
					name:s.id,
					text:s.color
				});
				span21.click(function(){
					cos=s.color;
					$(click1).removeClass('on');
					span21.addClass("on");
					click1="#"+this.id;
					$('#img1').attr('src','${pageContext.request.contextPath}/imgs/'+s.image);
				});
				$(div2).append(span21);
			});
			var aqa=$("<a>",{
				class:'buy_btn zf_btn r',
				href:'javascript:void(0);',
				text:'确认'
			});
			aqa.click(function(){
				if(click1!=""){
					
				
				//alert($(click1).attr('name'));//获取id 

				var jg=${group.price };//总价格
				var photo=1;//物品数
				var pricemin=-1;//判定是否为购物车
				var uname=id;//物品id
				var sad=$(click1).attr('name');//物品颜色id
				var ssw=data.json.ware.name+"*"+photo+"("+cos+")";
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
				$(fromes).append(hidden1);
				$(fromes).append(hidden2);
				$(fromes).append(hidden3);
				$(fromes).append(hidden4);
				$(fromes).append(hidden5);
				$(fromes).append(hidden6);
				$(fromes).append(hidden7);
				$("#msgDetail").append(fromes);
				document:froms1.submit();
				}else{
					alert("请选择颜色");
				}
			});
			var aq=$("<a>",{
				class:'buy_btn r mr30',
				href:'javascript:void(0);',
				text:'取消'
			});
			$(aq).click(function(){
				$("#msgDetail").empty();
				document.getElementById("bgDiv").style.display = msgDiv.style.display = "none";
			});
			$("#msgDetail").append(div2);
			$("#msgDetail").append(aqa);
			$("#msgDetail").append(aq);
		},"json");
	}else{
		alert("请先登录");
	}
}
function showDetail(){//show detail
	//msgDiv
	var msgDiv = document.getElementById("msgDiv");
	msgDiv.style.marginTop = -75 + document.documentElement.scrollTop + "px";
	//bgDiv
	var bgDiv = document.getElementById("bgDiv");
	bgDiv.style.width = document.body.offsetwidth + "px";
	bgDiv.style.height = screen.height + "px";
	
	//content
	msgDiv.style.display = bgDiv.style.display = "block";
	var msgDetail = document.getElementById("msgDetail");
}
</script>
</body>
</html>
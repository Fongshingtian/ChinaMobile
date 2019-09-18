<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
 #bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 10000; background-color: black; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);margin:0px auto;}
 #show{display: none; position: absolute; top: 25%; left: 22%; width: 500; height: 800; padding: 8px; border: 8px solid #E8E9F7; background-color: white; z-index:1002; overflow: auto;}
 .aaa{background: #EFEFEF;width: 400px;height: 400px;position: fixed; left: 50%; top: 50%; z-index: 10;margin-top: -300px;margin-left: -200px;}
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
	var clickco;
	var clickc;
	$(function(){
		var id="${id}";
		$.post("mmf!indexs",{"id":id},function(data){
			var img1=$("<img>",{
				src:'${pageContext.request.contextPath}/imgs/'+data.json.ware.photo,	
				jqimg:'${pageContext.request.contextPath}/imgs/'+data.json.ware.photo,
				width:'348',
				height:'348'
			});
			$("#spec-n1").append(img1);
			
			var ul1=$("<ul>",{
				class:'list-h',
				id:'ul1'
			});
			var li1=$("<li>",{});
			var imgl1=$("<img>",{
				src:'${pageContext.request.contextPath}/imgs/'+data.json.ware.photo,
				class:'cur'
			});
			$(li1).append(imgl1);
			$(ul1).append(li1);
			//------循环部分-----//
			var max=0;
			var min=0;
			var l=data.json.clist;
			$.each(l,function(index,u){
				if(index==0){
					max=u.price;
					min=u.price;
				}
				if(u.price>max){
					max=u.price;
				}
				if(u.price<min){
					min=u.price;
				}
				var li2=$("<li>",{});
				var imgl2=$("<img>",{
					id:u.image,
					src:'${pageContext.request.contextPath}/imgs/'+u.image
				});
				$(li2).append(imgl2);
				$(ul1).append(li2);
			});
				
			//------添加-----//				
			$("#spec-list").append(ul1);
			//--------------商品详情--------------//
			var p1=$("<p>",{
				class:'pr'
			});
				var strong1=$("<strong>",{
					text:'商城价:'
				}); 
				var tt=min+'-'+max+'元';
				if(max==min){
					tt=max+'元';
				}
				var span1=$("<span>",{
					class:'f24 colO3 fofY',
					id:'pri',
					text:tt
				});
				$(p1).append(strong1);
				$(p1).append(span1);
			$("#textdiv").append(p1);
			var div2=$("<div>",{
				class:'detail_color mt10'
			});
				var strong2=$("<strong>",{
					text:'颜  色:'
				});
				$(div2).append(strong2);
					$.each(data.json.clist,function(index,u){
						var span21=$("<span>",{
							id:'color'+index,
							text:u.color
						});
						span21.click(function(){
							$(clickco).removeClass('on');
							clickco="#"+this.id;
							span21.addClass('on');
							document.all["kc"].innerHTML = u.stock_count;
							document.all["pri"].innerHTML = u.price+'元';
						});
						$(div2).append(span21);
					});
				$("#textdiv").append(div2);
				
				
				var pp1=$("<p>",{
				});
					var strongp1=$("<strong>",{
						text:'商品名:'
					});
					var spanp1=$("<span>",{
						class:'colO2 fwb fofY',
						text:data.json.ware.name
					});
					$(pp1).append(strongp1);
					$(pp1).append(spanp1);
				$("#textdiv").append(pp1);
				
				var p3=$("<p>",{
				});
					var strong3=$("<strong>",{
						text:'库  存:'
					});
					var span3=$("<span>",{
						class:'colO2 fwb fofY',
						id:'kc',
						text:data.json.ware.stock_count
					});
					$(p3).append(strong3);
					$(p3).append(span3);
				$("#textdiv").append(p3);
				
				var pp2=$("<p>",{
				});
					
					var spanp2=$("<span>",{
						class:'colO2 fwb fofY',
						text:data.json.ware.introduction
					});
					$(pp2).append(spanp2);
				$("#textdiv").append(pp2);
				
				
				
				
				var p4=$("<p>",{
					class:'mt25',
					html:'<br>'
				});
				$("#textdiv").append(p4);
				var p5=$("<p>",{
					class:'p1120 mt15'
				});
					var a5=$("<a>",{
						href:'login.jsp',
						target:'_blank',
						class:'tdu colBlue2',
						text:'购买请先登录'
					});
					$(p5).append(a5);
				$("#textdiv").append(p5);
				var div6=$("<div>",{
					class:'mt25 clearfix pr zi50',
					style:'text-align:center;'
				});
					var a611=$("<a>",{
						class:'buy_btn zf_btn r',
						href:'javascript:void(0);',
						text:'立即购买'
					});
					a611.click(function(){
						
						if(user_id!=""){
							showDetail();
							showdiv2(id,2);
						}else{
							alert("请先登录");
						}
						
					});
					var a62=$("<a>",{
						class:'buy_btn r mr30',
						href:'javascript:void(0);',
						text:'加入购物车'
					});
					a62.click(function(){
						
						if(user_id!=""){
							showDetail();
							showdiv2(id,1);
						}else{
							alert("请先登录");
						}
						
					});
					
					$(div6).append(a611);
					$(div6).append(a62);
				$("#textdiv").append(div6);
			//实现放大镜效果代码
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
		
		
	});
</script>

<body>
<div id="msgDiv">
    <center><div id="msgDetail"></div></center>
</div>
<div id="bgDiv"></div>
<center><div id="qwe" style="display:none;" class="aaa"></div></center>
<div id="one">
<div id="container">
<jsp:include page="head.jsp"></jsp:include>
  <div class="content clearfix">
  	<div class="blank10"></div>
    <div class="l detail_l">
    	<div class="bordCc">
        	<h2 class="colBlue2 fwb f14">相关分类</h2>
            <ul class="detail_l_fl p8">
            	<li><a href="orderCheck.jsp"><span class="l">手机卡</span>&gt;</a></li>
                <li><a href="xjzx.jsp"><span class="l">手机</span>&gt;</a></li>
            </ul>
        </div>
        <div class="blank10"></div>
        <!--同类品牌-->
        <div class="bordCc">
        	<h2 class="colBlue2 fwb f14">同类品牌</h2>
            <ul class="detail_l_pp p8 clearfix">
            	<li><a href="javascript:void(0);">多普达</a></li>
                <li><a href="javascript:void(0);">摩托罗拉</a></li>
                <li><a href="javascript:void(0);">三星</a></li>
                <li><a href="javascript:void(0);">金立</a></li>
                <li><a href="javascript:void(0);">大唐</a></li>
                <li><a href="javascript:void(0);">酷派</a></li>
                <li><a href="javascript:void(0);">天迈</a></li>
                <li><a href="javascript:void(0);">新邮</a></li>
            </ul>
        </div><!--同类品牌end-->
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
            </ul>
        </div><!--浏览手机用户最终购买end-->
        <div class="blank10"></div>
        <!--热卖排行-->
        <div class="bordCc">
        	<h2 class="colBlue2 fwb f14">热卖排行</h2>
            <ul class="detail_l_ph p8">
            <li class="clearfix on">
                <div class="detail_l_ph_t"><a href="pro_detail.jsp" class="fwb"><span class="list_num db l mr10 colfff">1</span>酷派 8076 </a></div>
                <dl class="detail_l_ph_m clearfix">
                	<dt><a href="pro_detail.jsp"><img alt="" src="${pageContext.request.contextPath}/images/img/detail_l_ph.jpg"></a></dt>
                    <dd><p class="colO2 lh18">0元购机预存399元话费</p><del>￥ 699</del><strong class="db colF00 fofA f14">￥399.00</strong></dd>
                </dl>
              </li>
              <li class="clearfix">
                <div class="detail_l_ph_t"><a href="pro_detail.jsp" class="fwb"><span class="list_num db l mr10 colfff">2</span>酷派 8076 </a></div>
                <dl class="detail_l_ph_m clearfix">
                	<dt><a href="pro_detail.jsp"><img alt="" src="${pageContext.request.contextPath}/images/img/detail_l_ph.jpg"></a></dt>
                    <dd><p class="colO2 lh18">0元购机预存399元话费</p><del>￥ 699</del><strong class="db colF00 fofA f14">￥399.00</strong></dd>
                </dl>
              </li>
              <li class="clearfix">
                <div class="detail_l_ph_t"><a href="pro_detail.jsp" class="fwb"><span class="list_num db l mr10 colfff">3</span>酷派 8076 </a></div>
                <dl class="detail_l_ph_m clearfix">
                	<dt><a href="pro_detail.jsp"><img alt="" src="${pageContext.request.contextPath}/images/img/detail_l_ph.jpg"></a></dt>
                    <dd><p class="colO2 lh18">0元购机预存399元话费</p><del>￥ 699</del><strong class="db colF00 fofA f14">￥399.00</strong></dd>
                </dl>
              </li>
          </ul>
        </div><!--热卖排行end-->
    </div>
    <div class="r detail_r">
    	<div class="where bordBN">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; <a href="hygj.jsp">合约购机</a> &gt; 您当前所在位置： 酷派8010荣耀四核手机2G版 正品行货现货 安卓智能触屏</div>
      <div class="bordCc p25">
        	<div class="clearfix">
            	<div class="l detail_r_l">
                	<!--放大镜-->
                    <div id="preview">
                        <div class="jqzoom bordCc" id="spec-n1">
                        </div>
                        <div id="spec-n5">
                            <div class="control" id="spec-left">
                                <img src="${pageContext.request.contextPath}/images/jqzoom_left.gif" />
                            </div>
                            <div id="spec-list">
                                
                            </div>
                            <div class="control" id="spec-right">
                                <img src="${pageContext.request.contextPath}/images/jqzoom_right.gif" />
                            </div>
                            
                        </div>
                    </div>
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
                <div class="r detail_r_r pt15" id="textdiv">
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
									var photo="<li><img src='${pageContext.request.contextPath}/imgs/"+ware.photo+"'></li>";
									for(var i=0;i<color.length;i++){
										photo+="<li><img src='${pageContext.request.contextPath}/imgs/"+color[i].image+"'></li>";
									}
									$("#photo").append(photo);
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
												+"<td valign='top' width='20%' align='center'><img width='70px' height='70px' src='${pageContext.request.contextPath}/imgs/"+comment[i].FACE+"'><br/><font style='font-size:16px;font-family: 微软雅黑;'>"+comment[i].NAME+"</font><br/><br/></td>"
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
  <jsp:include page="tail.jsp"></jsp:include>
</div>

<script type="text/javascript">
$(function(){
	//根据浏览为我推荐--左右滚动
	$("#yyzq_tj").xslider({
		unitdisplayed:4,
		movelength:4,
		unitlen:170,
		autoscroll:null
	});
	
})
</script>
<script language="javascript" type="text/javascript">
var ind=-1;
var p;
var user_id=window.parent.document.getElementById("dl").name;

function showdiv2(id,i) { 
	$("#msgDetail").empty();
	var from1=$("<from>",{
		id:'from1',
		name:'from1',
		action:'mmf!addshopping',
		method:'post',
		enctype:'multipart/form-data'
	});
	$.post("mmf!indexs",{"id":id},function(data){
		
		var tablea1=$("<div>",{
			class:'r detail_r_r pt15'
		});
			var tr1=$("<div>",{
				class:'detail_color mt10'
			});
				var tr1td1=$("<strong>",{
					text:''
				});
					var img1=$("<img>",{
						src:'${pageContext.request.contextPath}/imgs/'+data.json.ware.photo,
						id:'img1',
						width:'100',
						height:'100'
					});
				$(tr1td1).append(img1);
			$(tr1).append(tr1td1);
			var tr2=$("<div>",{
				class:'detail_color mt10'
			});
				var tr2td1=$("<strong>",{
					class:'detail_color mt10',
					text:'颜色:   '
				});
				$.each(data.json.clist,function(index,u){
					var span21=$("<span>",{
						id:'colorse'+index,
						name:u.id,
						text:u.color
					});
					span21.click(function(){
						$(clickc).removeClass('on');
						clickc="#"+this.id;
						span21.addClass('on');//price2
						var slum=document.getElementById("sl").value;
						$("#price2").text(u.price);
						p=u.price;
						$("#price").text(u.price*slum);
						$('#img1').attr('src','${pageContext.request.contextPath}/imgs/'+u.image);
						ind=index;
					});
					$(tr2td1).append(span21);
				});
				
			$(tr2).append(tr2td1);
			
			var tr3=$("<div>",{
				class:'detail_color mt10'
			});
			var tr3td1=$("<strong>",{
				text:'数量:   '
			});
				var tr3a1=$("<span>",{
					class:'detail_color mt10',
					text:'-'
				});
				tr3a1.click(function(){
					
					var sw=$("#sl").val();
					var swe=sw-1;
					if(swe==0){
						swe=1;
					}
					$("#sl").val(swe);
					tr3a2.removeClass('on');
					tr3a1.addClass("on");
					var slum=document.getElementById("sl").value;
					$("#price").text(p*slum);
				});
				var tr3input=$("<input>",{
					id:'sl',
					type:'text',
					style:'width:20px;',
					value:'1'
				});
				tr3input.change(function(){
					var sw=document.getElementById("sl").value;
					if(Number(sw)>99){
						sw=99;
					}
					$("#sl").val(sw);
					var slum=document.getElementById("sl").value;
					$("#price").text(p*slum);
				});
				var tr3a2=$("<span>",{
					class:'detail_color mt10',
					text:'+'
				});
				tr3a2.click(function(){
					tr3a1.addClass("on");
					var sw=$("#sl").val();
					var swe= Number(sw)+1;
					if(swe==100){
						swe=99;
					}
					$("#sl").val(swe);
					tr3a1.removeClass('on');
					tr3a2.addClass("on");
					var slum=document.getElementById("sl").value;
					$("#price").text(p*slum);
				});
				$(tr3td1).append(tr3a1);
				$(tr3td1).append(tr3input);
				$(tr3td1).append('   ');
				$(tr3td1).append(tr3a2);
			$(tr3).append(tr3td1);
			
			var tr4=$("<div>",{
				class:'detail_color mt10'
			});
				var tr4td1=$("<strong>",{
					text:'单价:   '
				});
				var max=0;
				var min=0;
				
				var l=data.json.clist;
				
				$.each(l,function(index,u){
					if(index==0){
						max=u.price;
						min=u.price;
					}
					if(u.price>max){
						max=u.price;
					}
					if(u.price<min){
						min=u.price;
					}
				});
				var tt=min+'-'+max
				if(max==min){
					tt=max;
				}
				var span14=$("<span>",{
					id:'price2',
					text:tt
				});
				$(tr4td1).append(span14);
			$(tr4).append(tr4td1);
			$(tr4).append("元");
			
		var tr5=$("<div>",{
			class:'detail_color mt10'
		});
			var tr5td1=$("<strong>",{
				text:'商品总价:   '
			});
			var span13=$("<span>",{
				id:'price',
				text:'0'
			});
			$(tr5td1).append(span13);
		$(tr5).append(tr5td1);
		var tr6=$("<div>",{
		});
			var tr6td1=$("<strong>",{
			});
				var tr6input=$("<input>",{
					type:'hidden',
					value:user_id
				});
			$(tr6td1).append(tr6input);
		$(tr6).append(tr6td1);
		$(tablea1).append(tr1);
		$(tablea1).append(tr2);
		$(tablea1).append(tr3);
		$(tablea1).append(tr4);
		$(tablea1).append(tr5);
		$(tablea1).append(tr6);
		var aq=$("<a>",{
			class:'buy_btn r mr30',
			href:'javascript:void(0);',
			text:'取消'
		});
		$(aq).click(function(){
			ind=-1;
			document.getElementById("bgDiv").style.display = msgDiv.style.display = "none";
		});
		var aqa=$("<a>",{
			class:'buy_btn zf_btn r',
			href:'javascript:void(0);',
			text:'确认'
		});
		$(aqa).click(function(){//添加到购物车
			if(i==1){
			var scolor=data.json.clist[ind].color;
			var pq=data.json.clist[ind].id;
			//alert('颜色'+scolor);ind//pp
			//alert('单价'+data.json.clist[ind].price);//jg
			var jg=data.json.clist[ind].price;
			//alert('数量'+$("#sl").val());//px
			var px=$("#sl").val();
			var asd=Number(data.json.clist[ind].price)*$("#sl").val();
			//alert('总价'+asd);//ssw
			//alert('用户'+user_id);//user_id
			//alert("物品id"+id);//物品id  id
			$.post("mmf!addcar",{"pp":pq,"pricemin":jg,"px":px,"ssw":asd,"user_id":user_id,"id":id},function(data){
				document.getElementById("bgDiv").style.display = msgDiv.style.display = "none";
				alert(data.json.msg);
			},"json");
			}else{

				var jg=Number(data.json.clist[ind].price)*$("#sl").val();//总价格
				var photo=$("#sl").val();//物品数
				var pricemin=-1;//判定是否为购物车
				var uname=id;//物品id
				var sad=data.json.clist[ind].id;//物品颜色id
				var ssw=data.json.ware.name+"*"+photo+"("+data.json.clist[ind].color+")";
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
			}
		});
		$(aq).click(function(){
			document.getElementById("bgDiv").style.display = msgDiv.style.display = "none";
		});
		$(from1).append(tablea1);
		$("#msgDetail").append(from1);
		$("#msgDetail").append(aq);
		$("#msgDetail").append(aqa);
	},"json");
}
function showdiv() { 
	document.getElementById("bg").style.display ="block";
	document.getElementById("show").style.display ="block";
}
function hidediv() {
document.getElementById("bg").style.display ='none';
document.getElementById("show").style.display ='none';
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
var cla="#uli1";
var clas="#v1";
function classes(id1,id2){
	$(cla).removeClass();
	$(id1).addClass("nobd on");
	$(id2).removeClass();
	$(clas).addClass("hide");
	cla=id1;
	clas=id2;
}
</script>
</div>
</body>
</html>
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

	<script type="text/javascript">
		//分页参数
		var curr=1;
		var pcount=6;
		var count=0;
		$(function(){
			$.post("gj!thzq",{},function(data){
				//-------------------限时抢购---------------------//
				//倒计时
				maxtime = dayBetween(data.xs.end_time);
				document.all["qgsl"].innerHTML = "已售"+data.xsw.sale_count+"件";
				document.all["xsjg"].innerHTML = "￥"+data.xsw.price;
				document.all["xsxc"].innerHTML = data.xsw.introduction;
				document.all["xsimg"].innerHTML = '<img src="${pageContext.request.contextPath}/imgs/'+data.xsw.photo+'" />';
				document.all["xs2a"].innerHTML='<a href="spike_detail.jsp?id='+data.xsw.id+'" class="buy_btn l">抢!!!</a>';
				//-------------------秒杀---------------------//
				mextime = dayBetween(data.ms.end_time);
				document.all["msssl"].innerHTML = "已售"+data.msw.sale_count+"件";
				document.all["msjg"].innerHTML = "￥"+data.msw.price;
				document.all["msxc"].innerHTML = data.msw.introduction;
				document.all["msimg"].innerHTML = '<img src="${pageContext.request.contextPath}/imgs/'+data.msw.photo+'" />';
				document.all["ms2a"].innerHTML='<a href="spike_detail.jsp?id='+data.msw.id+'" class="buy_btn l">秒杀</a>';
				//获得所有城市名称
				$.post("gj!tableList",{msg:"CityVo"},function(data){
					var innerHTML="<a href='javascript:void(0);' class='on'>全部</a>";
					for(var i=0;i<data.data.length;i++){
						innerHTML+="<a href='javascript:void(0);'>"+data.data[i].name+"</a>";
					}
					$("#city").html(innerHTML);
					test();
				},"json");
			},"json");
			
		});
		//分页加载
		function test(){
			$(window).scroll(function(e) {
				if($(this).scrollTop()+window.innerHeight>=document.body.clientHeight&&count>=curr*pcount&&$("#inload").html()==undefined){
					var top=$(this).scrollTop();
					$("#ware").append("<center id='inload'><font style='font-size:30px'><img align='middle' src='loading.gif'></font></center>");
					curr++;
					setTimeout("loadingWare(curr,pcount)",100);
					if(count<=curr*pcount&&count!=0){
						setTimeout("noMoreData();",2500);
					}
					//$(window).scrollTop(top-window.innerHeight);
				}else if(count<=curr*pcount&&count!=0&&$("#nodata").html()==undefined){
					//setTimeout("noMoreData();",3000);
				}
				//alert(document.body.clientHeight);//网页可见区域高706  584 122 1562 584 222
				//alert(document.body.offsetHeight);//网页可见区域高(包括边线的高)
				//alert(window.innerHeight);//
		      	//alert($(this).scrollTop());  
		      	//alert(document.body.clientHeight);
			});
		}
		//么有数据了
		function noMoreData(){
			if($("#nodata").html()==undefined){
				$("#ware").after("<center id='nodata'><font style='font-size:30px'>没有更多数据了</font></center>");
			}
		}
		//加载下一页
		function CompareDate(d1,d2)
		{
		  return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
		}
		function loadingWare(currpage,pagecount){
			$.post("gj!group",{currpage:currpage,pagecount:pagecount},function(data){
				count=data.count;
				var innerHTML="";
				for(var i=0;i<data.data.length;i++){
					var yon="";
					var ucount="<span class='r'>"+data.data[i].USER_COUNT+"人已参团</span>";
					var gstate="<a href='gj!toGroup?ware.id="+data.data[i].WARE_ID+"&&id="+data.data[i].ID+"' class='r fwb f14 tg_btn'>我要参团</a>"
					var ctime=new Date(CurentTime().replace(/-/g,"/"));
				    var etime=new Date(data.data[i].END_TIME.replace(/-/g,"/"));
				    var stime=new Date(data.data[i].START_TIME.replace(/-/g,"/"));
				    if(ctime>=stime){
						if(ctime<etime){
							yon="结束时间 "+data.data[i].END_TIME;
						}else{
							yon="参团结束 ";
							gstate="<a class='r fwb f14 tg_btn tg_btn2'>参团结束</a>";
						}
					}else{
						yon="敬请期待";
						ucount="";
						gstate="<a class='r fwb f14 tg_btn'>敬请期待</a>";
					}
					innerHTML+= 
						"<li class='p8 pr'>"
			                +"<span class='tg_time pa colfff tac'>"+ yon+"</span>"
			                +"<div class='tac mb5 mt5'><img src='${pageContext.request.contextPath}/imgs/"+data.data[i].PHOTO+"' width='270' height='270' /></div>"
			                +"<h3 class='db tac fwb'>"+data.data[i].NAME+"</h3>"//tg_detail.jsp
			                +"<div class='clearfix tg_price pb10 mt5'>"+gstate+"<span class='colR f24 fofA'>￥"+data.data[i].PRICE+"</span></div>"
			                +"<div class='clearfix lh30 mt5'>"+ucount+"市场价：<del>"+data.data[i].WARE_PRICE+"</del></div>"
			                +"<p class='fwb f14'>"+data.data[i].DETAIL+"</p>"
			            +"</li>"
				}
				$("#inload").remove();
				$("#ware").append(innerHTML);
			},"json");
		}
		loadingWare(curr,pcount);
	</script>

</head>
<body>
<div id="container2">
 <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 优惠购机</div>
        <div class="blank10"></div>
        <div class="clearfix">
        	<div class="l ovh yyzq_l">
            	<div class="bord1"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/images/img/hygj_tu.jpg" width="920" height="205" /></a></div>
                <div class="bordD7 hypj_term mt8 tg_term">
                	<dl class="clearfix">
                    	<dt>地区</dt>
                        <dd class="list_ms" id='city'>
                        </dd>
                    </dl>
                </div>
                <div class="blank10"></div>
            </div>
            <div class="r">
            	<div class="yyzq_r">
                	<div class="yyzq_r_bg">
                    	<h2 id="yyzq_r_t" class="yyzq_r_t f16 fofY"><span class="on">限时抢购</span><span>秒杀</span></h2>
                        <div id="yyzq_r_c">
                        	<!--限时抢购-->
                            <div class="yyzq_r_c1" id="xsqga">
                            	<p class="sold"><span class="r colR" id="qgsl"></span><t id="qgsj"></t></p>
                            	<dl class="clearfix">
                                	<dt><a href="xsqg_detail.html" id="xsimg"></a></dt>
                                    <dd><span class="f24 colO2 fofY" id="xsjg"></span><p class="f14" id="xsxc"></p><t id="xs2a"></t></dd>
                                </dl>
                            </div><!--限时抢购end-->
                            <!--秒杀-->
                            <div class="yyzq_r_c1 hide" id="msa">
                            	<p class="sold"><span class="r colR" id="msssl"></span><t id="mssj"></t></p>
                                <dl class="clearfix">
                                	<dt><a href="spike_detail.jsp" id="msimg"></a></dt>
                                    <dd><span class="f24 colO2 fofY" id="msjg"></span><p class="f14" id="msxc"></p><t id="ms2a"></t></dd>
                                </dl>
                            </div><!--秒杀end-->
                        </div>
                    </div>
                    <div><img src="${pageContext.request.contextPath}/images/yyzq_r_kB.png" /></div>
                </div>
                <!--<div class="blank10"></div>-->
            </div>
        </div>
        <!--列表-->
        <div class="tg w1186 ovh">
            <ul class="clearfix" id='ware'>
            </ul>
        </div><!--列表end-->
    </div>
    <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>

<script type="text/javascript">
	$("#tga").addClass('on');
	var maxtime = 0;  
	var mextime=0;
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
		//转换团购商品时间
	   function wareCountDown(maxTime) {
	       if (maxtime >= 0) {
	           minutes = Math.floor(maxtime / 60);
	          seconds = Math.floor(maxtime % 60);
				 day=Math.floor(maxtime/86400);
				 hour=Math.floor((maxtime/3600)-day*24);
	
				 minutes=Math.floor((maxtime/60)-(hour*60)-day*24*60);
	
	          msg = "剩余"+day+"天"+hour+"时" + minutes + "分" + seconds + "秒";
	          return msg;
	      }
	       return "时间到";
	  }
	   function CountDown() {
	       if (maxtime >= 0) {
	           minutes = Math.floor(maxtime / 60);
	          seconds = Math.floor(maxtime % 60);
				 day=Math.floor(maxtime/86400);
				 hour=Math.floor((maxtime/3600)-day*24);
	
				 minutes=Math.floor((maxtime/60)-(hour*60)-day*24*60);
	
	          msg = "距结束还有"+day+"天"+hour+"时" + minutes + "分" + seconds + "秒";
	          document.all["qgsj"].innerHTML = msg;
	          --maxtime;
	      }
	  }
	//倒计时时间 maxtime
	 timer = setInterval("CountDown()", 1000);   
	 CountDown();  
	 function CountDown2() {
	     if (mextime >= 0) {
	         minutes = Math.floor(mextime / 60);
	        seconds = Math.floor(mextime % 60);
				 day=Math.floor(mextime/86400);
				 hour=Math.floor((mextime/3600)-day*24);
	
				 minutes=Math.floor((mextime/60)-(hour*60)-day*24*60);
	
	        msg = "距结束还有"+day+"天"+hour+"时" + minutes + "分" + seconds + "秒";
	        
	        document.all["mssj"].innerHTML = msg;
	        --mextime;
	    }
	}
	//倒计时时间 maxtime
	 timers = setInterval("CountDown2()", 1000);   
	 CountDown2();  
</script>
</html>
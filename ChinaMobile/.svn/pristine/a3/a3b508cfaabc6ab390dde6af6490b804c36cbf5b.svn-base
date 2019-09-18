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
function tzs(){
	window.location.href='xjzx.jsp';
}
	$(function(){
		$.post("gj!thzq",{},function(data){
			var list=data.list;
			var ss="";
			$.each(list,function(index,l){
				if(index<5){
					ss+="<div class='bord1 p3 clearfix'><div class='l thzq_l'><img src='${pageContext.request.contextPath}/imgs/"+l.image+"' /></div><div class='r ovh mr10 thzq_r'>";
					ss+="<h2 class='fwb f14 colO3 mt15 mb5'>"+l.name+"</h2><p class='lh24'>";
					ss+=l.detail+"</p><dl class='clearfix thzq_ss'><dt class='l'>适应城市："+l.city+"</dt><dd class='r'>活动时间：";
					ss+=l.start_time+"至"+l.end_time+"</dd></dl><div class=' mt10 clearfix'><a class='r thzq_btn' href='javascript:void(0);' onclick='tzs();'>立即参加</a>";
					ss+="<dl class='clearfix r mr10 thzq_r_ing'><dt class='colfff tac'>"+l.state+"</dt><dd class='t_ellipsis mr10'>";
					ss+=l.name+"</dd> </dl></div></div></div><div class='blank10'></div>";
				}
			});
			$("#th").append(ss);
			
			//-------------------限时抢购---------------------//
			//倒计时
			maxtime = dayBetween(data.xs.end_time);
			
			document.all["qgsl"].innerHTML = "已售"+data.xsw.sale_count+"件";
			document.all["xsjg"].innerHTML = "￥"+data.xsw.price;
			document.all["xsxc"].innerHTML = data.xsw.introduction;
			document.all["xsimg"].innerHTML = '<img src="${pageContext.request.contextPath}/imgs/'+data.xsw.photo+'" />';
			document.all["xs2a"].innerHTML='<a href="mmf!index?id='+data.xsw.id+'" class="buy_btn l">抢!!!</a>';
			//-------------------秒杀---------------------//
			mextime = dayBetween(data.ms.end_time);
			document.all["msssl"].innerHTML = "已售"+data.msw.sale_count+"件";
			document.all["msjg"].innerHTML = "￥"+data.msw.price;
			document.all["msxc"].innerHTML = data.msw.introduction;
			document.all["msimg"].innerHTML = '<img src="${pageContext.request.contextPath}/imgs/'+data.msw.photo+'" />';
			document.all["ms2a"].innerHTML='<a href="mmf!index?id='+data.msw.id+'" class="buy_btn l">秒杀</a>';
			
		},"json");
		
		$.post("gj!selwares",{},function(data){
            //销量排行
				var rx=data.rx;
		
				var s1="<h2><a href='javascript:void(0);' class='r col7a'>更多&gt;&gt;</a><span class='f16 fofY'>销/量/排/行/</span></h2>";
				$.each(rx,function(index,r){
					console.log(r);
					if(index<5){
						s1+= "<dl><dt><a href='mmf!index?id="+r.id+"'>";
						s1+="<img src='${pageContext.request.contextPath}/imgs/"+r.photo+"' /></a></dt>";
		                s1+="<dd><a href='mmf!index?id="+r.id+"' title="+r.name+">"+r.name+"</a>";
		                s1+="<p><span>￥"+r.price+"</span></p></dd></dl>";
					}
				});
			
          	$("#ind_list1").html(s1);
          	
          	//热卖排行
          	var xl=data.xl; 
			var s2="<h2><a href='javascript:void(0);' class='r colO'>更多&gt;&gt;</a><span class='f16 fofY'>热/卖/排/行/</span></h2>";
			
			$.each(xl,function(index,l){
				if(index<3){
					s2+="<dl> <dt><a href='mmf!index?id="+l.id+"'><img src='${pageContext.request.contextPath}/imgs/"+l.photo+"' /></a></dt>";
					s2+=" <dd><a href='mmf!index?id="+l.id+"' title="+l.name+">"+l.name+"</a><span class='colF00'>￥";
					s2+=l.price+"</span></dd></dl>";
				}
			});
			$("#xl").append(s2);
		},"json");
	});
</script>

</head>

<body>
<div id="container2">
    <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where">您的位置： <a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 特惠专区</div>
        <div class="blank10"></div>
        <div class="clearfix">
        	<div class="l ovh yyzq_l" id="th">
            	<div class="bord1"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/images/img/hhg.jpg" width="920" height="205" /></a></div>
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
                <div class="blank10 w50"></div>
                <!--热卖排行-->
                <div class="ind_ph ml10" id="xl">
                    
                </div><!--热卖排行end-->
                <div class="blank10 w50"></div>
                <div class="blank10 w50"></div>
                <!--销量排行-->
                <div class="ind_ph ind_phQl ml10" id="ind_list1">
                  
                </div><!--销量排行end-->
            </div>
        </div> 
        <div class="blank10"></div>
    </div>
    <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
$("#thzqa").addClass('on');
	
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
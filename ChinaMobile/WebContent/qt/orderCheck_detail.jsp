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
$(function(){
	var id="${id}";
	$.post("mmf!todetail",{"id":id},function(data){
		
		var tr1=$("<tr>",{
		});
			var tr1td1=$("<th>",{
				width:'12%',
				text:'订单号'
			});
			var tr1td2=$("<td>",{
				width:'38%',
				text:data.json.main.mainordernum
			});
			var tr1td3=$("<th>",{
				width:'12%',
				text:'下单时间'
			});
			var tr1td4=$("<td>",{
				width:'38%',
				text:data.json.main.datetime
			});
		$(tr1).append(tr1td1);
		$(tr1).append(tr1td2);
		$(tr1).append(tr1td3);
		$(tr1).append(tr1td4);
		var tr2=$("<tr>",{
		});
			var tr2td1=$("<th>",{
				text:'客户姓名'
			});
			var tr2td2=$("<td>",{
				text:data.json.child.receive_user
			});
			var tr2td3=$("<th>",{
				text:'联系电话'
			});
			var tr2td4=$("<td>",{
				text:data.json.main.phone_number
			});
		$(tr2).append(tr2td1);
		$(tr2).append(tr2td2);
		$(tr2).append(tr2td3);
		$(tr2).append(tr2td4);
		var tr3=$("<tr>",{
		});
			var tr3td1=$("<th>",{
				text:'支付方式'
			});
			var tr3td2=$("<td>",{
				text:data.json.main.pay_method				
			});
			var tr3td3=$("<th>",{
				text:'配送方式'
			});
			var tr3td4=$("<td>",{
				text:data.json.child.delivery_method
			});
		$(tr3).append(tr3td1);
		$(tr3).append(tr3td2);
		$(tr3).append(tr3td3);
		$(tr3).append(tr3td4);
		var tr4=$("<tr>",{
		});
			var tr4td1=$("<th>",{
				text:'订单类型'
			});
			var tr4td2=$("<td>",{
				text:data.json.child.ware_type				
			});
			var tr4td3=$("<th>",{
				text:'支付状态'
			});
			var tr4td4=$("<td>",{
				text:data.json.child.state
			});
		$(tr4).append(tr4td1);
		$(tr4).append(tr4td2);
		$(tr4).append(tr4td3);
		$(tr4).append(tr4td4);
		var tr5=$("<tr>",{
		});
			var tr5td1=$("<th>",{
				text:'订单总金额'
			});
			var tr5td2=$("<td>",{
				class:'fwb colR',
				text:'￥'+data.json.main.total_price				
			});
			var tr5td3=$("<th>",{
				text:'订单状态'
			});
			var tr5td4=$("<td>",{
				class:'fwb colR',
				text:data.json.main.state
			});
			
		$(tr5).append(tr5td1);
		$(tr5).append(tr5td2);
		$(tr5).append(tr5td3);
		$(tr5).append(tr5td4);
		
		$("#tableone").append(tr1);
		$("#tableone").append(tr2);
		$("#tableone").append(tr3);
		$("#tableone").append(tr4);
		$("#tableone").append(tr5);
		var tr21=$("<tr>",{
			class:'f14'
		});
			var tr21td1=$("<th>",{
				width:'17%',
				text:'图片'
			});
			var tr21td2=$("<th>",{
				width:'49%',
				text:'名称'			
			});
			var tr21td3=$("<th>",{
				width:'17%',
				text:'价格'		
			});
			var tr21td4=$("<th>",{
				width:'17%',
				text:'品牌'	
			});
			$(tr21).append(tr21td1);
			$(tr21).append(tr21td2);
			$(tr21).append(tr21td3);
			$(tr21).append(tr21td4);
		var tr22=$("<tr>",{
			class:'tac'
		});
			var tr22td1=$("<td>",{
				class:'pt10 pb10'
			});
				var img1=$("<img>",{
					width:'85',
					src:'${pageContext.request.contextPath}/imgs/'+data.json.photo
				});
				$(tr22td1).append(img1);
			var tr22td2=$("<td>",{
				text:data.json.name			
			});
			var tr22td3=$("<th>",{
				class:'colR',
				text:data.json.price	
			});
			var tr22td4=$("<td>",{
				text:data.json.brand
			});
			$(tr22).append(tr22td1);
			$(tr22).append(tr22td2);
			$(tr22).append(tr22td3);
			$(tr22).append(tr22td4);
		$("#tabletwo").append(tr21);
		$("#tabletwo").append(tr22);
	},"json");	
});
</script>
<body>
<div id="container">
    <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where bordBN"><strong class="colBlue2">您的位置： </strong><a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 订单详情</div>
        <div class="bordE0 clearfix">
        	<h2 class="fwb f14 colBlue2 orderCheck_info_t pl20">订单详情</h2>
            <div class="orderCheck_det" >
            	<table class="orderCheck_det_tab1 col333">
            		<tbody  id="tableone"></tbody>
            	</table>
                <div class="blank10"></div>
                <table class="orderCheck_det_tab2 mt25">
                	<tbody id="tabletwo"></tbody>
                </table>
                <p class="mt25 clearfix" id="bt"><a class="buy_btn r mr10" href="javascript:history.back(-1)">返&nbsp;&nbsp;回</a></p>
            </div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
</html>
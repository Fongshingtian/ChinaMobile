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
		
		//alert("${pricemin}"+"${ssw}");
		var pricemin="${pricemin}";
		var ssw="${ssw}";
		$.post("mmf!seldd",{"pricemin":pricemin,"ssw":ssw},function(data){
			var ts=0;
			if(data.json.li==null){
				ts=0;
			}else{
				var ts=data.json.li.length;	
			}
			var span=$("<span>", {
				class:'colBlue2',
				text:ts
			});
			$("#sj").empty();
			$("#ts").append(span);
			$.each(data.json.li,function(index,u){
				$.post("mmf!selchild",{"id":u.ware_id},function(dats){
				
				var tr1=$("<tr>",{});
				var t1td1=$("<td>",{
					colspan:'7',
					class:'bgEee lh36',
					text:'订单编号:'
				});
				var span1=$("<span>",{
					class:'colBlue2',
					text:ssw
				});
				
				$(t1td1).append(span1);
				$(t1td1).append(' 下单时间:');
				$(t1td1).append(data.json.main.datetime);
				$(t1td1).append(' 收货人:');
				$(t1td1).append(u.receive_user);
				$(tr1).append(t1td1);
				$("#sj").append(tr1);
				var tr2=$("<tr>",{
					class:'fwb tac'					
				});
				var t2td1=$("<td>",{
					width:'13%'
				});
				
				var img=$("<img>",{
					width:'87',
					src:'${pageContext.request.contextPath}/imgs/'+dats.json.ware.photo
				});
				$(t2td1).append(img);
				var t2td2=$("<td>",{
					width:'33%',
					text:dats.json.ware.name
				});
				var t2td3=$("<td>",{
					class:'colR',
					text:'￥'+dats.json.ware.price
				});
				var t2td4=$("<td>",{
					class:'colR',
					text:u.warenum
				});
				var t2td5=$("<td>",{
					class:'f12 colR',
					text:'￥'+u.price
				});
					var br=$("<br>",{});
				$(t2td5).append(br);
				$(t2td5).append(""+data.json.main.pay_method);
				var t2td6=$("<td>",{
					text:u.state
				});
				var t2td7=$("<td>",{
				});
					var a=$("<a>",{
						href:'mmf!detail?id='+u.id
					});
						var imgs=$("<img>",{
							src:'${pageContext.request.contextPath}/images/orderCheck_btn.gif'
						});
					$(a).append(imgs);
				$(t2td7).append(a);
				$(tr2).append(t2td1);
				$(tr2).append(t2td2);
				$(tr2).append(t2td3);
				$(tr2).append(t2td4);
				$(tr2).append(t2td5);
				$(tr2).append(t2td6);
				$(tr2).append(t2td7);
				
				$("#sj").append(tr2);
				
			},"json");
			});
			var tr4=$("<tr>",{
			});
				var tr4td=$("<td>",{
					colspan:'7'
				});
					var a1=$("<a>",{
						class:'buy_btn r',
						href:'chooseNO_payment.jsp',
						text:'立即支付'
					});
					$(tr4td).append(a1);
				$(tr4).append(tr4td);
				$("#sj").append(tr4);
		},"json");
	})
</script>
<body>
<div id="container">
   <jsp:include page="head.jsp"></jsp:include>
    <div class="content">
    	<div class="where bordBN"><strong class="colBlue2">您的位置： </strong><a href="http://www.nm.10086.cn/" target="_blank">移动首页</a> &gt; <a href="index.jsp">网上商城</a> &gt; 订单查询</div>
        <div class="bordE0 clearfix">
        	<h2 class="fwb f14 colBlue2 orderCheck_info_t pl20">订单查询</h2>
            <div class="p10 orderCheck_info">
            	<div class="bgEee p8 f14 clearfix"><select class="hypj_sel f12 mr5 l" name="">
                      <option>-全部订单时间-</option>
					  <option>-一个月内-</option>
					  <option>-三个月内-</option>
					   <option>-六个月内-</option>
					    <option>-六个月前-</option>
                    </select><select class="hypj_sel f12 l" name="">
                      <option>-全部交易状态-</option>
                    </select><p class="l pt2 lh24 ml10">共找到<t id="ts"></t>条订单，您可以<a href="orderCheck.jsp" class="colBlue2">返回重新查询</a>。</p></div>
                    <div class="">
                    <table class="f14 orderCheck_tab">
                        <tr class="lh36">
                            <th colspan="2" class="bordBca">商品</th>
                            <th width="10%" class="bordBca">单价</th>
                            <th width="8%" class="bordBca">数量</th>
                            <th width="15%" class="bordBca">总金额</th>
                            <th width="8%" class="bordBca">状态</th>
                            <th width="13%" class="bordBca">操作</th>
                        </tr>
                        <tbody id="sj">
                        
                        </tbody>
                        
                    </table>
                </div>
                
            </div>
        </div>
    </div>
     <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
var photo;
var name;
$("#ordera").addClass('on');
	
	function selware(id){
		var ware;
		$.post("mmf!selchild",{"id":id},function(data){
			ware=data.json.ware;
						photo=ware.photo;
						name=ware.name;
		},"json");
	}
	
</script>
</html>
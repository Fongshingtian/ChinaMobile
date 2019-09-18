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
var sumprice=0;
var len=0;
var trs=0;
var id=-1;
	$(function(){
		var user_id=window.parent.document.getElementById("dl").name;
		
			id=user_id;
			cs(id,user_id);
			if(user_id==""){
			alert("请登录");
			}
		
	});
</script>
<body>
<div id="container">
  <jsp:include page="head.jsp"></jsp:include>
  <div class="content">
    <div class="where"><strong class="colBlue3">您的位置：</strong> <a target="_blank" href="http://www.nm.10086.cn/">移动首页</a> &gt; <a href="index.jsp">优惠购机</a> &gt; 购物车</div>
    <div class="blank10"></div>
    <div class="tar bordBca pb10"><img src="${pageContext.request.contextPath}/images/shoppingCar_bz.gif" /></div>
    <h2 class="colBlue2 fwb f14 lh30">我的购物车</h2>
    <div id="tabletwo"></div>

  </div>
  <div class="blank10"></div>
  <div class="blank10"></div>
   <jsp:include page="tail.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
function texts(trs,sumprice){
	$("#texts1").text(trs+'件商品,总计'+sumprice+'￥');
}
$("#shopa").addClass('on');
function cs(id,user_id){
	var froem =$("<form>",{
		action:'mmf!tomain?user_id='+user_id,
		name:'asd',
		id:'from1',
		method:'post'
	});
	$("#tabletwo").empty();
	
		
		var tableone=$("<table>",{
			id:'tableones',
			class:'shoppingCar_tab'
		});
			var tr0=$("<tr>",{
				width:'8%',
				class:'tal bordBN'
			});
				var tr0th1=$("<th>",{
					width:'8%',
					class:'tal bordBN'
				});
					var input0=$("<input>",{
						id:'CheckedAll',
						type:'checkbox',
						name:'checkbox',
						value:'',
						class:'mr10'
					});
					var t=$("<t>",{
						id:'qx',
						text:'反选'
					});
					input0.click(function(){ 
						//if($("input[id='CheckedAll']").is(':checked')){
							//$("#qx").text("全取消");
							//$("input[type='checkbox']").attr("checked","true"); 
						//}else{
							//$("#qx").text("全选");
							//$("input[type='checkbox']").removeAttr("checked"); 
						//}
							$("input[name='checkboxs']").each(function(){
								if($(this).attr("checked")){
									$(this).removeAttr("checked"); 
									trs=trs-1;
									var tt =  $(this).attr('tt');
									sumprice=Number(sumprice)-Number(tt);
									texts(trs,sumprice);
								} else {
									$(this).attr("checked","true");
									var tt =  $(this).attr('tt');
									trs=trs+1;
									sumprice=Number(sumprice)+Number(tt);
									texts(trs,sumprice);
								}
							})
						}) 
				$(tr0th1).append(input0);
				$(tr0th1).append(t);
			$(tr0).append(tr0th1);
				var tr0th2=$("<th>",{
					width:'40%',
					class:'bordBN'
				});
				$(tr0th2).append('商品信息');
			$(tr0).append(tr0th1);
			$(tr0).append(tr0th2);
			var tr0th3=$("<th>",{
				width:'14%',
				class:'bordBN'
			});
			$(tr0th3).append('商城价');
		$(tr0).append(tr0th3);
		var tr0th4=$("<th>",{
			width:'16%',
			class:'bordBN'
		});
		
	$(tr0).append(tr0th4);
	var tr0th5=$("<th>",{
		width:'10%',
		class:'bordBN'
	});
	
	$(tr0th5).append('总价格');
	$(tr0th4).append('数量');
$(tr0).append(tr0th5);
var tr0th6=$("<th>",{
	width:'12%',
	class:'bordBN'
});
$(tr0th6).append('操作');
$(tr0).append(tr0th6);
$(tableone).append(tr0);
		$.post("mmf!shoppingcar",{"id":id},function(data){
			var car=data.json.shop;
			len=car.length;
			if(car.length==0){
				var tr4=$("<tr>",{
				});
					var tr4td1=$("<td>",{
						colspan:'6',
						class:'tac',
						text:'购物中暂无物品'
					}); 
					$(tr4).append(tr4td1);
					$(tableone).append(tr4);
			}
			$.each(car,function(index,c){
				var cid=c.ware_color_id;
				var wid=c.ware_id;
				$.post("mmf!selcolor",{"id":cid},function(date){
					$.post("mmf!selchild",{"id":wid},function(dati){
						var tr1=$("<tr>",{
							class:'tac fwb colBlue'
						});
							var tr1td1=$("<td>",{
								class:'tal'
							});
								var tr1td1input=$("<input>",{
									type:'checkbox',
									name:'checkboxs',
									tt:c.total_price,
									id:'items'+c.id,
									value:c.id
								});
								tr1td1input.click(function(){
									var swqe=this.id;
									if(tr1td1input.is(':checked')){
										trs=trs+1;
										sumprice=sumprice+c.total_price;
										texts(trs,sumprice);
									}else{
										trs=trs-1;
										sumprice=sumprice-c.total_price;
										texts(trs,sumprice);
									}
								});
							$(tr1td1).append(tr1td1input);
							var tr1td2=$("<td>",{
								class:'fwn tal shoppingCar_tab_t'
							});
								var tr1td2a1=$("<a>",{
									href:'pro_detail.jsp',
									class:'colBlue',
									target:'_blank',
									tittle:dati.introduction,
									target:'_blank'
								}); 
									var tr1td2span1=$("<span>",{
										text:dati.json.ware.name+':'+dati.json.ware.introduction
									});
									var tr1td2img1=$("<img>",{
										src:'${pageContext.request.contextPath}/imgs/'+date.json.color.image
									});
							
							$(tr1td2a1).append(tr1td2img1);
							$(tr1td2a1).append(tr1td2span1);
							$(tr1td2).append(tr1td2a1);
							var tr1td3=$("<td>",{
								text:c.unit_price
							});
							var tr1td4=$("<td>",{
								text:c.total_price
							});
							var tr1td5=$("<td>",{
								text:c.amount
							});
							var tr1td6=$("<td>",{
								
							});
								var tr1td6a1=$("<a>",{
									href:'javascript:void(0);',
									class:'colBlue sCar_del',
									text:'删除'
								});
								tr1td6a1.click(function(){
									var qid=c.id;
									$.post("mmf!delbyid",{"id":qid},function(data){
										cs(id);
									},"json");
								});
							$(tr1td6).append(tr1td6a1);
						$(tr1).append(tr1td1);
						$(tr1).append(tr1td2);
						$(tr1).append(tr1td3);
						
						$(tr1).append(tr1td5);
						$(tr1).append(tr1td4);
						$(tr1).append(tr1td6);
						$(tableone).append(tr1);
						if($("input[name='checkboxs']").length==car.length){
							tjs(len);		
						}
					},"json");
				},"json");
			});
			$(froem).append(tableone);
			$("#tabletwo").append(froem);
			if(car.length==0){
				ssq(car.length);
			}
		},"json");
		
}
function ssq(i){
	var tr3=$("<tr>",{
	});
		var tr3td1=$("<td>",{
			colspan:'6'
		});
		var tr3div1=$("<div>",{
			class:'clearfix pt20 pb10 mt10 shoppingCar_2btn'
		});
		var tr3a1=$("<a>",{
			href:'index.jsp',
			class:'buy_btn l mr50',
			text:'先逛逛'
		});
		var tr3a2=$("<a>",{
			class:'buy_btn js_btn l ml20',
			href:'javascript:void(0);',
			text:'去结算'
		});
			tr3a2.click(function(){
				if($("input[name='checkboxs']").is(':checked')){//有选中的进入
					document:from1.submit();
				}else{
					alert("请选择结算商品");
				}
			});
		$(tr3div1).append(tr3a1);
		if(i!=0){
			$(tr3div1).append(tr3a2);
		}
		$(tr3td1).append(tr3div1);
		$(tr3).append(tr3td1);
	$("#tableones").append(tr3);
}

function tjs(len){
	var tr22=$("<tr>",{
	});
		var tr2td1=$("<td>",{
			colspan:'6'
		});
			var tr2td1div1=$("<div>",{
				class:'clearfix pt15 pb15'
			});
				var tr2td1div1p1=$("<p>",{
					id:'texts1',
					class:'r colR f14 fwb',
					text:''//len+'件商品 总计'
				});
					var tr2td1div1p1span1=$("<span>",{
						id:'texts2',
						class:'f26 fofA',
						text:''//jg+'￥'
					});
					$(tr2td1div1p1).append(tr2td1div1p1span1);
				var tr2td1div1a1=$("<a>",{
					id:'del_check',
					href:'javascript:void(0);'
				});
					var tr2td1img1=$("<img>",{
						src:'${pageContext.request.contextPath}/images/delete.gif',
						class:'vam mr10'
					});
					tr2td1div1a1.click(function(){
						$("input[type='checkbox']").each(function(){
							if($(this).attr("checked")){ 
								var sid=this.id.substring(5,10);
								$.post("mmf!delbyid",{"id":sid},function(data){
									cs(id);
								},"json");
							}
						})
						
					});
					$(tr2td1div1a1).append(tr2td1img1);
					$(tr2td1div1a1).append('删除选中商品');
				$(tr2td1div1).append(tr2td1div1p1);
				$(tr2td1div1).append(tr2td1div1a1);
				$(tr2td1).append(tr2td1div1);
				$(tr22).append(tr2td1);
	$("#tableones").append(tr22);
	ssq(len);
}
</script>
</html>
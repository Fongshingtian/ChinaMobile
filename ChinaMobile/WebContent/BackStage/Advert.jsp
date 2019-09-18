<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css"
	media="all">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/layui.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.maximizeImg{
		display:none;
		filter:alpha(opacity:30);
		opacity:0.9;
		background:transparent;
	    z-index: 29891017; 
		position: fixed;
	}
	.layui-table-cell{
		height:auto !important;
	}
	.layui-table img{
		max-width:300px;
	}
	.cFilter{
		display:none;
		background:lightgray;
		filter:alpha(opacity:30);
		opacity:0.6;
		height: 100%;
		width: 100%;
		position: fixed;
	    left: 0px;
	    top: 0px;
	    z-index: 23891017;
	}
</style>
</head>
<body>
	<div  style='height: 6px;background: #43a96f;width: 100%;position: fixed;top: 0px ;z-index: 33333100;'></div>
	<div  style='height: 100%;background: #43a96f;width: 6px;position: fixed;top: 0px ;z-index: 33333100;left:0px;'></div>
	<!-------------------Html代码--------------------> 
	<div id='tableShow' style='margin-top:-6px;display:inline;position:absolute;width: 100%;' >
		<table class="layui-hide" id="test" lay-filter="test"></table>
	</div>
	<!--  -->
	<script type="text/html" id="imgDemo1">
		<img style='width:100%;height:168px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}i1' src='${pageContext.request.contextPath}/imgs/{{d.adv1}}'>
	</script>
	<script type="text/html" id="imgDemo2">
		<img style='width:100%;height:168px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}i2' src='${pageContext.request.contextPath}/imgs/{{d.adv2}}'>
	</script>
	<script type="text/html" id="imgDemo3">
		<img style='width:100%;height:168px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}i3' src='${pageContext.request.contextPath}/imgs/{{d.adv3}}'>
	</script>
	
	<!-------------------头工具栏-------------------->
	<script type="text/html" id="toolbarDemo">
 	 <div class="layui-btn-container">
    	<button  onclick='toReload();' id='reload' style='font-size: 16px;background:#51b597;' class="layui-btn layui-btn-sm" ><i class="layui-icon">&#xe669;</i>刷新数据</button>
		<button lay-event="edit"id='add' style='font-size:16px;background:#4ca98d;'   class="layui-btn layui-btn-sm "  ><i class="layui-icon">&#xe642</i> 编辑图片 &nbsp</button>
  	</div>
	</script>
	<!-------------------JS代码-------------------->
	<script>
		//表格数据
		function tableData(url){
			//渲染table
			layui.use('table', function() {
				var table = layui.table, form = layui.form;
					
				table.render({
					elem : '#test',
					url : url,
					toolbar : '#toolbarDemo',
					cellMinWidth : 80 ,//全局定义常规单元格的最小宽度，layu3i 2.2.1 新增
					cols : [ [ 
					     {toolbar:"#imgDemo1", title: '图一'}
					    ,{toolbar:"#imgDemo2", title: '图二'}
					    ,{toolbar:"#imgDemo3", title: '图三'}
					]], 
					done:function(res,curr,count){
						//如果是异步请求数据方式，res即为你接口返回的信息。
				        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
						//jquery
								//alert(JSON.stringify(res.data));
						var imgs=res.data[0];
						layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							var width=window.innerWidth*0.65;
							$("#reload").css("margin-left",width+"px");
							$("#image1").val(imgs.adv1);
							$("#image2").val(imgs.adv2);
							$("#image3").val(imgs.adv3);
							//头工具栏事件
							table.on('toolbar(test)', function(obj) {
								if(obj.event=='edit') {
									layui.use([ 'jquery', 'layer' ], function() {
										var $ = layui.$ //重点处
										, layer = layui.layer;
										//后面就跟你平时使用jQuery一样
										$("#dform").css("display","inline");
										$("#tableShow").css("display","none");
										$("#img1").attr("src","${pageContext.request.contextPath}"+"/imgs/"+imgs.adv1);
										$("#img2").attr("src","${pageContext.request.contextPath}"+"/imgs/"+imgs.adv2);
										$("#img3").attr("src","${pageContext.request.contextPath}"+"/imgs/"+imgs.adv3);
									})
									//渲染表单
									layui.use(['form', 'layedit', 'laydate'], function(){
									    var form = layui.form
									    ,layer = layui.layer
									    ,layedit = layui.layedit
									    ,laydate = layui.laydate;
									 
									    //表单初始赋值
										form.val("formTest", {
										  "advert.id": imgs.id // "name": "value"
										 ,"advert.adv1": imgs.adv1 // "name": "value"
										 ,"advert.adv2": imgs.adv2 // "name": "value"
										 ,"advert.adv3": imgs.adv3 // "name": "value"
										})
									});
								};
							});
						});
					}
				});
			});
		}
		tableData('fss!tableList?voName=AdvertVo');
		function toReload(){
				tableData('fss!tableList?voName=AdvertVo');
		}
		//选择图片时-图片预览
		function img_show(source,imgId) {
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				var file = source.files[0];
				if (window.FileReader) {
					var fr = new FileReader();
					fr.onloadend = function(e) {
						if(isNaN(imgId)){
							$("#"+imgId).attr("src", e.target.result);
						}else{
							$("#Iimg"+imgId).attr("src", e.target.result);
						}
					};
					fr.readAsDataURL(file);
				} else {
					alert("该浏览器不支持预览图片！");
				}
			});
		}
		function maxImg(id){
			//maxImg点击事件
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				Maximize($("#"+id).attr("src"));
			});
		}
		//放大图片
		function Maximize(src){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				$("#filter").css("display","inline");
				$("#imgMaximize").css("display","inline");
				$("#imgMax").attr("src",src);
				//获取图片高宽
				var x=parseFloat($("#imgMax").css("width"));
				var y=parseFloat($("#imgMax").css("height"));
				//获取页面高宽
				var x1=window.innerWidth; 
				var y1=window.innerHeight;
				//获取高宽比例
				var t=x/x1;//宽比例
				var h=y/y1;//高比例
				//宽比高大
				if(t>h&&t>=1){
					var xx=(x1-x/t-2)/2;
					var yy=(y1-y/t-2)/2;
					$("#imgMaximize").css("top", yy);
					$("#imgMaximize").css("left", xx);
					$("#imgMax").attr("width",x/t);
					$("#imgMax").attr("height",y/t);
				}else if(t<h&&h>=1){//高比宽大
					var xx=(x1-x/h-2)/2;
					var yy=(y1-y/h-2)/2;
					$("#imgMaximize").css("top", yy);
					$("#imgMaximize").css("left", xx);
					$("#imgMax").attr("width",x/h);
					$("#imgMax").attr("height",y/h);
				}else{//等于
					var xx=(x1-x-2)/2;
					var yy=(y1-y-2)/2;
					$("#imgMaximize").css("top", yy);
					$("#imgMaximize").css("left", xx);
				}
			});
		}
		//还原图片
		function hideMaximize(){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				$("#imgMax").removeAttr("width");
				$("#imgMax").removeAttr("height");
				$("#filter").css("display","none");
				$("#imgMaximize").css("display","none");
			});			
		}
		//选择图片
		function openFile(id){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				$("#"+id).click();
			});
		}
		//jjquery
		layui.use([ 'jquery', 'layer' ], function() {
			var $ = layui.$ //重点处
			, layer = layui.layer;
			//后面就跟你平时使用jQuery一样
			//返回列表
			$("#back").click(function(){
				$("#dform").css("display","none");	
				$("#tableShow").css("display","inline");
				$("#toTop").css("display","none");
				$("#toBack").css("display","none");
				$("#toBottom").css("display","none");
				$("#reset").click();	
			});
			//左上角返回键
			$("#toBack").click(function(){
				$("#back").click();
			});
			//获得高度
			if(window.innerHeight>=580){
				$("#dform").css("height",window.innerHeight+"px");
			} 
			//提交表单
			$("#submitBtn").click(function(){
				if($("#file1").val()!=""){
					$("#image1").val("null");
				}
				if($("#file2").val()!=""){
					$("#image2").val("null");
				}
				if($("#file3").val()!=""){
					$("#image3").val("null");
				} 
				//提交表单
				layer.msg('提交成功！', {
						icon : 1
				});
				setTimeout( function(){
					$('#ff').submit();
				}, 850 );//延迟
			});
			//返回TOP
			$("#toTop").click(function(){ 
				$("#dform").scrollTop(0);
			});
			//
			$('#dform').scroll(function(e) {
	      	   //alert(this.scrollTop);  
	      	   var h=this.scrollHeight;
				$("#toBottom").click(function(){ 
					$("#dform").scrollTop(h);
				});
	      	   if(this.scrollTop>10){
	      			$("#toTop").css("display","inline");
	      			$("#toBottom").css("display","inline");
					$("#toBack").css("display","inline");
	      	   }else{
	      			$("#toTop").css("display","none");
	      			$("#toBottom").css("display","none");
					$("#toBack").css("display","none");
	      	   }
		    });
		})
	</script>
	<!-- 悬浮去底部 -->
	<ul id="toBottom" style='z-index: 29891315;display: none;right: 34px;top: 16px;width:40px;height: 40px;' class="layui-fixbar">
		<li class="layui-icon layui-fixbar-top"  style="display: list-item;">
			<center>
				<i style="font-size: 37px;text-align: center;"  class="layui-icon">&#xe601;</i>
			</center>
		</li>
	</ul>
	<!-- 悬浮取消 -->
	<ul id="toBack" style='z-index: 29891015;display: none;left: 10px;top: 16px;width:40px;height: 40px;' class="layui-fixbar">
		<li class="layui-icon layui-fixbar-top"  style="display: list-item;">
			<center>
				<i style="font-size: 28px;text-align: center;"  class="layui-icon">&#xe65c;</i>
			</center>
		</li>
	</ul>
	<!-- 悬浮Top -->
	<ul id="toTop" style='z-index: 29891015;display: none;margin-right: 10px' class="layui-fixbar">
		<li class="layui-icon layui-fixbar-top" lay-type="top" style="display: list-item;">
			<center>
				<i style="font-size: 50px;" class="layui-icon">&#xe604;</i>
			</center>
		</li>
	</ul>
	<!-------------------表单-------------------->
	<div  id='dform' class='layui-layer layui-layer-page' style="overflow:auto;display:none ;z-index: 19891015; width: 100%;height: 590px;top:0px">
		<div class='layui-layer-content'> 
			<center>
				<div style="padding: 150px; line-height: 22px; background-color: white; font-weight: 300;width: 50%;">
					<form  enctype="multipart/form-data" id='ff' lay-filter='formTest' class="layui-form" action="fss!saveVo?voName=Advert" method='post' >
						<input type="hidden" id='id' name='advert.id' value='11'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >广告一</label>
						</div>
						<div class="layui-form-item">
								<img imgType="list" src='' id='img1' style='width: 500px;'>
								<input type="file" onchange="img_show(this,'img1')" name='imgs' id='file1' style='display: none;'> 
								<input type="hidden" name='advert.adv1' id='image1'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('file1');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >广告二</label>
						</div>
						<div class="layui-form-item">
								<img imgType="list" src='' id='img2' style='width: 500px;'>
								<input type="file" onchange="img_show(this,'img2')" name='imgs' id='file2' style='display: none;'> 
								<input type="hidden" name='advert.adv2' id='image2'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('file2');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >广告三</label>
						</div>
						<div class="layui-form-item">
								<img imgType="list" src='' id='img3' style='width: 500px;'>
								<input type="file" onchange="img_show(this,'img3')" name='imgs' id='file3' style='display: none;'> 
								<input type="hidden" name='advert.adv3' id='image3'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('file3');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<p align="right">
									<button  style='display:none' lay-submit lay-filter="formDemo"  id='toSubmit'>立即提交</button>
									<input type='button' class="layui-btn" value='立即提交' id='submitBtn'>
									<input type='button' id='back'  value='返回列表' class="layui-btn layui-btn-primary">
								</p>
							</div>
						</div>
					</form>
				</div>
			</center>
		</div>
	</div>
	<div onclick="hideMaximize()"  id="filter" class='cFilter' style='display: none'></div>
	<div onclick="hideMaximize()" class='maximizeImg' style='display: none' id='imgMaximize' >
		<table width="100%" border="0" align="center">
			<tr><td><img style='cursor: pointer;'  src='' id='imgMax'></td></tr>
		</table>
	</div>
</body>
</html>
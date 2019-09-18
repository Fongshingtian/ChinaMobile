<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<!--------------------------- 界面代码 -------------------------->
	<div id='tableShow' style='margin-top:-6px;display:inline;position:absolute;width: 100%;' >
		<table class="layui-hide" id="test" lay-filter="test"></table>
	</div>
	<!-------------------头工具栏-------------------->
	<script type="text/html" id="toolbarDemo">
 	 <div class="layui-btn-container">
		<input class="layui-btn layui-btn-sm"    name="text" id="text" style='width:155px;height:27px;background:white;border:1px solid;color:gray;font-size: 17px;cursor: default;' autocomplete="off">
		<button  onclick='toSearch();' id='search' style='font-size: 16px;background:#54c1a0;' class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>
		<button  onclick='toReload();' id='reload' style='font-size: 16px;background:#51b597;' class="layui-btn layui-btn-sm" ><i class="layui-icon">&#xe669;</i>刷新数据</button>
    	<button onclick='toAdd();'   id='add' style='font-size:16px;background:#4ca98d;'   class="layui-btn layui-btn-sm "  ><i class="layui-icon">&#xe654;</i> 添加数据 &nbsp</button>
  	</div>
	</script>
	<!---------------------------工具栏-编辑------------------------->
	<script type="text/html" id="barDemo">
  	<a class="layui-btn layui-btn-xs" lay-event="edit" style='background:#49ab7a' ><i class="layui-icon">&#xe642</i>编辑&nbsp&nbsp&nbsp </a>
	</script>
	
	<!---------------------------显示头像------------------------->
	<script type="text/html" id="faceDemo">
		<img style='width:60px;height:60px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}' src='${pageContext.request.contextPath}/imgs/{{d.icon}}'>
	</script>

	<!--------------------------- JS代码------------------------ -->
	<script>
		function tableData(url){
			//表格数据
			layui.use('table', function() {
				var table = layui.table, form = layui.form;
				table.render({
				    elem: '#test'
				    ,toolbar : '#toolbarDemo'
				    ,url: url //数据接口
				    ,cellMinWidth : 80
				    ,page: true //开启分页
				    ,cols: [[ //表头
				      {field: 'id', title: 'ID', width:80,align:'center'}
				      ,{field: 'name', title: '品牌名称'}
				      ,{toolbar:"#faceDemo", title: '图标',width:90,align:'center'}
				      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:100,align:'center'}
				    ]], done: function(res, curr, count){
				        //如果是异步请求数据方式，res即为你接口返回的信息。
				        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
						layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							var width=window.innerWidth*0.41;
							$("#text").css("margin-left",width+"px");
						});
				    }
				  });
				 
				 //监听行工具事件-编辑————打开表单
				  table.on('tool(test)', function(obj){
				    var data = obj.data;
				     if(obj.event === 'edit'){
				   		//jquery
				  		layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							//后面就跟你平时使用jQuery一样
							$("#dform").css("display","inline");
							$("#tableShow").css("display","none");
							$("#imgShow").attr("src","${pageContext.request.contextPath}"+"/imgs/"+data.icon);
						});
				   		//渲染表单
						layui.use(['form', 'layedit', 'laydate'], function(){
							  var form = layui.form
							  ,layer = layui.layer
							  ,layedit = layui.layedit
							  ,laydate = layui.laydate;
							  //表单初始赋值
								form.val("formTest", {
								  "brand.id": data.id // "name": "value"
								  ,"brand.name": data.name // "name": "value"
								  ,"brand.icon": data.icon
								})
						});
				    }
				  });
			});
		}
		tableData('fss!tableList?voName=WareBrandVo');
		//添加
		function toAdd(){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				$("#dform").css("display","inline");
				$("#reset").click();
				$("#id").val("-1");
			});
		}
		//搜索
		function toSearch(){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				var text=$("#text").val();
				tableData('fss!search?voName=WareBrandVo&state='+text);
				$("#text").val(text);
			});
		}
		//刷新数据
		function toReload(){
				tableData('fss!tableList?voName=WareBrandVo');
		}
		//选择图片时-图片预览
		function img_show(source) {
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				var file = source.files[0];
				if (window.FileReader) {
					var fr = new FileReader();
				//	console.log(fr);
					fr.onloadend = function(e) {
						$('#imgShow').attr("src", e.target.result);
					};
					fr.readAsDataURL(file);
				} else {
					alert("该浏览器不支持预览图片！");
				}
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
		//使用leyui中的jquery
		layui.use([ 'jquery', 'layer' ], function() {
			var $ = layui.$ //重点处
			, layer = layui.layer;
			//后面就跟你平时使用jQuery一样
			//表单-返回列表
			$("#back").click(function(){
					$("#dform").css("display","none");	
					$("#tableShow").css("display","inline");
					$("#toTop").css("display","none");
					$("#toBack").css("display","none");
					$("#toBottom").css("display","none");
					$("#reset").click();	
					$("#imgShow").attr("src","");
			});
			//左上角返回键
			$("#toBack").click(function(){ 
				$("#back").click();	
			});
			//表单-界面设置高宽
			if(window.innerHeight>=580){
				$("#dform").css("height",window.innerHeight+"px");
			}
			//提交表单
			$("#submitBtn").click(function(){
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
	      	   //alert(this.clientHeight);  
	      	   //alert(this.scrollHeight);  
		    });
			//表单-选择图片文件
			$("#open").click(function(){
				$("#imgs").click();
			});
			
		})
		function maxImg(id){
			//maxImg点击事件
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;	
				Maximize($("#"+id).attr("src"));
			});
		}
	</script>
	<!-- 悬浮去底部 -->
	<ul id="toBottom" style='z-index: 29891315;display: none;right: 34px;top: 20px;width:40px;height: 40px;' class="layui-fixbar">
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
				<div style="padding: 80px; line-height: 22px; background-color: white; font-weight: 400;width: 50%">
					<form  id='ff' enctype="multipart/form-data" lay-filter='formTest' action="fss!saveVo?voName=Ware_Brand" method="post" class="layui-form" >
						<div class="layui-form-item">
							<input type='hidden' id='id' name='brand.id'>
							<label class="layui-form-label" >用户姓名</label>
							<div class="layui-input-block">
								<input type="text" id='name' name="brand.name" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item" >
							<label class="layui-form-label">头像</label>
							<div class="layui-input-block"  >
								<input type="hidden" name='brand.icon' value="" id='hidedImg'>
								<img name="face" src='' onclick='maxImg(this.id);' id='imgShow' style='width: 100px;height:100px;cursor: pointer;'>
								<input onchange="img_show(this);" type="file" style='display: none' id='imgs' name='imgs'> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type='button' class="layui-btn" id='open' value='选择图片'> 
							</div> 
						</div>
						<br><br>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<p align="right">
									<button  style='display:none' lay-submit lay-filter="formDemo"  id='toSubmit'>立即提交</button>
									<input type='button' class="layui-btn" value='立即提交' id='submitBtn'>
									<button id='reset' type="reset" class="layui-btn layui-btn-primary">重置资料</button>
									<input type='button' id='back'  value='返回列表' class="layui-btn layui-btn-primary">
								</p>
							</div>
						</div>
						<br><br>
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
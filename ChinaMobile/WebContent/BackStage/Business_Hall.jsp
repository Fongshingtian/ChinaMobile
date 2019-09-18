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
				      ,{field: 'name', title: '营业厅名称'}
				      ,{field: 'address', title: '详细地址'}
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
						});
				   		//渲染表单
						layui.use(['form', 'layedit', 'laydate'], function(){
							  var form = layui.form
							  ,layer = layui.layer
							  ,layedit = layui.layedit
							  ,laydate = layui.laydate;
							  //表单初始赋值
								form.val("formTest", {
								  "hall.id": data.id // "name": "value"
								  ,"hall.address": data.address // "name": "value"
								  ,"hall.name": data.name// "name": "value"
								})
						});
				    }
				  });
			});
		}
		tableData('fss!tableList?voName=BusinessHallVo');
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
				tableData('fss!search?voName=BusinessHallVo&state='+text);
				$("#text").val(text);
			});
		}
		//刷新数据
		function toReload(){
				tableData('fss!tableList?voName=BusinessHallVo');
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
			
		})
	</script>
	<!-- 悬浮去底部 -->
	<ul id="toBottom" style='z-index: 29891315;display: none;right: 34px;top: 20px;width:40px;height: 40px;' class="layui-fixbar">
		<li class="layui-icon layui-fixbar-top"  style="display: list-item;">
			<center>
				<i style="font-size: 30px;text-align: center;"  class="layui-icon">&#xe601;</i>
			</center>
		</li>
	</ul>
	<!-- 悬浮取消 -->
	<ul id="toBack" style='z-index: 29891015;display: none;left: 10px;top: 16px;width:40px;height: 40px;' class="layui-fixbar">
		<li class="layui-icon layui-fixbar-top"  style="display: list-item;">
			<center>
				<i style="font-size: 30px;text-align: center;"  class="layui-icon">&#xe65c;</i>
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
					<form  id='ff' enctype="multipart/form-data" lay-filter='formTest' action="fss!saveVo?voName=Business_Hall" method="post" class="layui-form" >
						<div class="layui-form-item">
							<input type='hidden' id='id' name='hall.id'>
							<label class="layui-form-label" >营业厅名称</label>
							<div class="layui-input-block">
								<input type="text" id='address' name="hall.name" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >地址</label>
							<div class="layui-input-block">
								<input type="text" id='address' name="hall.address" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
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
</body>
</html>
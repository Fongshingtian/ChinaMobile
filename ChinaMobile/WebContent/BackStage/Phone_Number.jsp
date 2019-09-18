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

</head>
<body>
	<div  style='height: 6px;background: #43a96f;width: 100%;position: fixed;top: 0px ;z-index: 33333100;'></div>
	<div  style='height: 100%;background: #43a96f;width: 6px;position: fixed;top: 0px ;z-index: 33333100;left:0px;'></div>
	<!-------------------Html代码--------------------> 
	<div id='tableShow' style='margin-top:-6px;display:inline;position:absolute;width: 100%;' >
		<table class="layui-hide" id="test" lay-filter="test"></table>
	</div>
	<!-------------------头工具栏-------------------->
	<script type="text/html" id="toolbarDemo">
 	 <div class="layui-btn-container">
   		<button style='background:#54c1a0;font-size: 15px;' class="layui-btn layui-btn-sm" lay-event="allEnable"><i class="layui-icon">&#xe605;</i>全部启用</button>
   	 	<button style='background:#9f8a88;font-size: 15px;' class="layui-btn layui-btn-sm" lay-event="allDisable"><i class="layui-icon">&#x1006;</i>全部禁用</button>
		<input class="layui-btn layui-btn-sm"    name="text" id="text" style='width:155px;height:27px;background:white;border:1px solid;color:gray;font-size: 17px;cursor: default;' autocomplete="off">
		<button  onclick='toSearch();' id='search' style='font-size: 16px;background:#54c1a0;' class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>
		<button  onclick='toReload();' id='reload' style='font-size: 16px;background:#51b597;' class="layui-btn layui-btn-sm" ><i class="layui-icon">&#xe669;</i>刷新数据</button>
    	<button onclick='toAdd();'   id='add' style='font-size:16px;background:#4ca98d;'   class="layui-btn layui-btn-sm "  ><i class="layui-icon">&#xe654;</i> 添加数据 &nbsp</button>
  	</div>
	</script>
	<!-------------------编辑栏-------------------->
	<script type="text/html" id="barDemo">
 	 	<a  class="layui-btn layui-btn-xs" style='background:#49ab7a' data-method="notice" lay-event="edit"><i class="layui-icon">&#xe642</i>编辑&nbsp&nbsp&nbsp </a>
	</script>
	<!-------------------状态栏-------------------->
	<script type="text/html" id="switchTpl">
 		 <div value='sss' id='{{d.id}}' onclick="enabled('{{d.id}}','{{d.state}}');" class="layui-unselect layui-form-switch" lay-skin="_switch">
			<em >{{d.state=='启用'?'已启用' : '已禁用'}}</em>
			<i></i>
		</div> 
	</script>
	<!-------------------JS代码-------------------->
	<script>
		//获得状态
		function getState() {
			var ss = document.getElementsByTagName("em");
			for (var i = 0; i < ss.length; i++) {
				var sta = ss[i].innerHTML;
				var ds = ss[i].parentNode;
				if (sta == '已启用') {
					ds.setAttribute("class",'layui-unselect layui-form-switch layui-form-onswitch');
				} else if (sta == '已禁用') {
					ds.setAttribute("class",'layui-unselect layui-form-switch');
				}
			}
		}
		//编辑状态
		function enabled(id, state) {
			if (state == '禁用') {
				layer.confirm('是否将其启用？', {
					btn : [ '确定', '取消' ]
				//按钮
				}, function() {//确定触发的事件
					layui.use([ 'jquery', 'layer' ], function() {
						var $ = layui.$ //重点处
						, layer = layui.layer;
						//后面就跟你平时使用jQuery一样
						$.post("fss!changeState", {
							state : '启用',
							voName : 'Phone_Number',
							id : id
						}, function() {
							layer.msg('启用成功！', {
								icon : 1
							});
							layui.use('table', function() {
								var table = layui.table, form = layui.form;
								table.reload("test");
							});
						});
					});
				}, function() {//取消触发的事件

				});
			} else if (state == '启用') {
				layer.confirm('是否将其禁用？', {
					btn : [ '确定', '取消' ]
				//按钮
				}, function() {
					layui.use([ 'jquery', 'layer' ], function() {
						var $ = layui.$ //重点处
						, layer = layui.layer;
						//后面就跟你平时使用jQuery一样
						$.post("fss!changeState", {
							state : '禁用',
							voName : 'Phone_Number',
							id : id
						}, function() {
							layer.msg('禁用成功！', {
								icon : 1
							});
							layui.use('table', function() {
								var table = layui.table, form = layui.form;
								table.reload("test");
							});
						});
					})
				}, function() {//取消事件

				});
			}
			return false;
		}
		//表格数据
		function tableData(url){
			//渲染table
			layui.use('table', function() {
				var table = layui.table, form = layui.form;
					
				table.render({
					elem : '#test',
					url : url,
					toolbar : '#toolbarDemo',
					page : true,
					cellMinWidth : 80 ,//全局定义常规单元格的最小宽度，layui 2.2.1 新增
					cols : [ [ 
					    {type : 'checkbox'}
					   ,{field : 'id',width:100,title : 'ID',sort : true}
					   ,{field : 'phone_number',title : '号码'}
					   ,{field : 'city',title : '归属地'}
					   ,{field : 'brand',title : '品牌'}
					   ,{field : 'have_fare',title : '内存话费'}
					   ,{field : 'price',title : '价格'}
					   ,{field : 'type',title : '类型'}
					   ,{fixed: 'right',width:100,title : '编辑',toolbar : '#barDemo',align:'center'}
					   ,{width:105,field : 'state',fixed: 'right',title : '启禁用',templet : '#switchTpl',align:'center'} 
					]], 
					done:function(res,curr,count){
						//如果是异步请求数据方式，res即为你接口返回的信息。
				        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
						getState();
						//jquery
						layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							var width=window.innerWidth*0.24;
							$("#text").css("margin-left",width+"px");
						});
					}
				});
				
				//头工具栏事件
				table.on('toolbar(test)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id);
					var data = checkStatus.data;
					var ids =new Array();
					for(var i=0;i<data.length;i++){
						ids.push(data[i].id);
					}
					var id=ids+"";
					if(data.length>0){
						if(obj.event=='allEnable') {
							enabled(id,"禁用");
						}else if(obj.event=='allDisable'){
							enabled(id,"启用");
						}
					}else if(data.length==0){
						layer.msg('选中了' + data.length + ' 个!');
					}
				});//
				 //监听行工具事件
				table.on('tool(test)', function(obj){
				    var data = obj.data;
				    //打开表单
				    if(obj.event === 'edit'){
				  		layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							//后面就跟你平时使用jQuery一样
							$("#dform").css("display","inline");
							$("#tableShow").css("display","none");
						}) 
						//渲染表单
						layui.use(['form', 'layedit', 'laydate'], function(){
						    var form = layui.form
						    ,layer = layui.layer
						    ,layedit = layui.layedit
						    ,laydate = layui.laydate;
						 
						    //表单初始赋值
							form.val("formTest", {
							  "number.id": data.id // "name": "value"
							  ,"number.phone_number": data.phone_number // "name": "value"
							  ,"number.city": data.city // "name": "value"
							  ,"number.brand":data.brand// "name": "value"
							  ,"number.have_fare": data.have_fare// "name": "value"
							  ,"number.price": data.price// "name": "value"
							  ,"number.type": data.type // "name": "value"
							  ,"manager.state": data.state
							})
						});
				    }
				 });
			});
		}
		tableData('fss!tableList?voName=PhoneNumberVo');
		//tableData('data.json');
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
				tableData('fss!search?voName=PhoneNumberVo&state='+text);
				$("#text").val(text);
			});
		}
		//刷新数据
		function toReload(){
				tableData('fss!tableList?voName=PhoneNumberVo');
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
	      	   //alert(this.clientHeight);  
	      	   //alert(this.scrollHeight);  
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
					<form  id='ff' lay-filter='formTest' class="layui-form" action="fss!saveVo?voName=Phone_Number" method='post' >
						<input type="hidden" id='id' name='number.id' value='-1'>
						<div class="layui-form-item">
							<label class="layui-form-label" >号码</label>
							<div class="layui-input-block">
								<input type="text"  name="number.phone_number" required lay-verify="required"
									placeholder="请输入号码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item" >
							<label class="layui-form-label">城市</label>
							<div class="layui-input-block">
								<select name="number.city" lay-verify="" lay-search>
								  <option value="赣州" selected>赣州</option>
								  <option value="福州">福州</option>
								  <option value="扬州" >扬州</option>
								  <option value="苏州" >苏州</option>
								  <option value="贵州" >贵州</option>
								</select>  
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">品牌</label>
							<div class="layui-input-block" >
								<select name="number.brand" lay-verify="" lay-search>
								  <option value="神州行" selected>神州行</option>
								  <option value="动感地带">动感地带</option>
								  <option value="全球通" >全球通</option>
								  <option value="天翼" >天翼</option>
								</select>  
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">内含话费</label>
							<div class="layui-input-block">
								<input type="text" name="number.have_fare" required
									lay-verify="required" placeholder="请输入金额" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">价格</label>
							<div class="layui-input-block">
								<input type="text" name="number.price" required
									lay-verify="required" placeholder="请输入价格" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">类型</label>
							<div class="layui-input-block">
								<input type="radio" name="number.type" value="普通" title="普通" checked> <input
									type="radio" name="number.type" value="靓号" title="靓号" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">选择状态</label>
							<div class="layui-input-block">
								<input type="radio" name="number.state" value="启用" title="启用" checked> <input
									type="radio" name="number.state" value="禁用" title="禁用" >
							</div>
						</div>
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
					</form>
				</div>
			</center>
		</div>
	</div>
</body>
</html>
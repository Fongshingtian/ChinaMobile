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
	<!-------------------Html代码-------------------->
	<div  style='height: 6px;background: #43a96f;width: 100%;position: fixed;top: 0px ;z-index: 33333100;'></div>
	<div  style='height: 100%;background: #43a96f;width: 6px;position: fixed;top: 0px ;z-index: 33333100;left:0px;'></div>
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
	<!---------------------工具栏---------------------->
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" style='background:#49ab7a;height:auto'  lay-event="edit"><i class="layui-icon">&#xe642</i>编辑&nbsp&nbsp&nbsp </a>
	</script>
	<!---------------------------显示照片------------------------->
	<script type="text/html" id="detail">
		点击编辑查看详情
	</script>
	<!---------------------------显示照片------------------------->
	<script type="text/html" id="faceDemo">
		<img style='width:60px;height:60px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}' src='${pageContext.request.contextPath}/imgs/{{d.photo}}'>
	</script>
	<!---------------------------显示照片------------------------->
	<script type="text/html" id="faceDemo1">
		<img style='width:60px;height:60px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}pa' src='${pageContext.request.contextPath}/imgs/{{d.parameter}}'>
	</script>
	<!---------------------------显示照片------------------------->
	<script type="text/html" id="faceDemo2">
		<img style='width:60px;height:60px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}de' src='${pageContext.request.contextPath}/imgs/{{d.detailed_list}}'>
	</script>
	<!---------------------------显示照片------------------------->
	<script type="text/html" id="faceDemo3">
		<img style='width:60px;height:60px;cursor: pointer;' onclick='maxImg(this.id);' id='img{{d.id}}gu' src='${pageContext.request.contextPath}/imgs/{{d.guarantee}}'>
	</script>
	<!---------------------改变状态-------------------->
	<script type="text/html" id="switchTpl">
 		<div value='sss' id='{{d.id}}' onclick="enabled('{{d.id}}','{{d.state}}');" class="layui-unselect layui-form-switch" lay-skin="_switch">
		<em >{{d.state=='启用'?'已启用' : '已禁用'}}</em>
		<i></i>
	</div> 
	</script>
	<!-------------------JS代码-------------------->
	<script>
		//图片上传相关参数
		var insertIndex=0;
		var deleteIndex=0;
		var fileIndex=0;
		var imgIndex=0;
		//插入一张图片生成的内容
		function getHtmlContent(insertIndex,deleteIndex,fileIndex,imgIndex){
			var htmlContent=
			"<div  dType='true' >"
				+"<input type='button' class='layui-btn' id='Iinsert"+insertIndex+"' onclick='insertImgFile(this.id);' value='插入一张图片'> "
				+"<input type='button' class='layui-btn' id='Idelete"+deleteIndex+" 'onclick='deleteImgFile(this.id);' value='删除这张图片'>"
				+"<input type='file' style='display:none' onchange='img_show(this,"+imgIndex+")' id='Ifile"+fileIndex+"' name='imgs'>" 
				+"<br><br>"
				+"<img exist='false' imgType='detail' src='' id='Iimg"+imgIndex+"' style='width: 500px;'>"
				+"<br><br>"
			+"</div>";
			return htmlContent;
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
		//删除一个图片选择
		function deleteImgFile(btnId){
			layer.confirm('是否将其删除？', {
				btn : [ '确定', '取消' ]
			//按钮
			}, function() {
				document.getElementById(btnId).parentNode.remove();
				layer.msg('删除成功！', {
					icon : 1
				});
			}, function() {

			});
		}
		//插入一张图片
		function insertImgFile(btnId){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				//后面就跟你平时使用jQuery一样
				$("#"+btnId).parent().before(getHtmlContent(insertIndex,insertIndex,fileIndex,imgIndex));
				$("#Ifile"+fileIndex).click();
				imgIndex++;
				fileIndex++;
				insertIndex++;
				deleteIndex++;
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
				//确认框
				layer.confirm('是否将其启用？', {
					btn : [ '确定', '取消' ]
				}, function() {
					layui.use([ 'jquery', 'layer' ], function() {
						var $ = layui.$ //重点处
						, layer = layui.layer;
						//后面就跟你平时使用jQuery一样
						$.post("fss!changeState", {
							state : '启用',
							voName : 'Ware',
							id : id
						}, function() {//确定事件
							layer.msg('启用成功！', {
								icon : 1
							});
							layui.use('table', function() {
								var table = layui.table, form = layui.form;
								table.reload("test");
							});
						});
					});
				}, function() {//取消事件

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
							voName : 'Ware',
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
				}, function() {

				});
			}
		}
		//表格数据
		function tableData(url){
			layui.use('table', function() {
				var table = layui.table, form = layui.form;
				table.render({
				    elem: '#test'//table Id
				    ,url: url //数据接口
				    ,toolbar : '#toolbarDemo'
				    ,page: true //开启分页
				    ,limits:[5,10,15]
				    ,limit:5
				    ,cols: [[ //表头
				      {type:'checkbox'}//添加全选框
				      ,{field: 'id', title: 'ID',align:'center'}
				      ,{field: 'name', title: '商品',width:90}
				      ,{toolbar:"#faceDemo", title: '图片',width:90,align:'center'}
				      ,{field: 'price', title: '价格'}
				      ,{field: 'city_id', title: '城市'} 
				      ,{field: 'classify_id', title: '类型'}
				      ,{field: 'brand_id', title: '品牌'}
				      ,{field: 'stock_count', title: '库存'}
				      ,{field: 'sale_count', title: '销量'}
				      ,{field: 'type', title: '出售类型'}
				      ,{toolbar: '#detail', title: '详情'}
				      ,{toolbar:"#faceDemo1", title: '参数',width:90,align:'center'}
				      ,{toolbar:"#faceDemo2", title: '清单',width:90,align:'center'}
				      ,{toolbar:"#faceDemo3", title: '保障',width:90,align:'center'}
				      ,{field: 'rx', title: '热销'}
				      ,{field: 'rp', title: '热评'}
				      ,{field: 'xp', title: '新品'}
				      ,{field: 'tj', title: '推荐'}
				      ,{field: 'introduction',title: '介绍',width:150}
				      ,{fixed:'right',title:'操作', toolbar: '#barDemo', width:100,align:'center'}//添加编辑工具栏
				      ,{fixed:'right',title: '状态',templet : '#switchTpl',width:105,align:'center'}//添加开关工具栏
				    ]], done: function(res, curr, count){//加载完后的方法
				    	getState();
				        //如果是异步请求数据方式，res即为你接口返回的信息。
				        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
				    	//jquery
						layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
					    	 $(".layui-table-main  tr").each(function (index ,val) {
	                    			$($(".layui-table-fixed .layui-table-body tbody tr")[index]).height($(val).height());
	               			 });
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
				//监听行工具事件-编辑
				table.on('tool(test)', function(obj){
				    var data = obj.data;
				    //console.log(obj)
				    if(obj.event === 'edit'){
						//打开表单
					  	layui.use([ 'jquery', 'layer' ], function() {
							var $ = layui.$ //重点处
							, layer = layui.layer;
							//后面就跟你平时使用jQuery一样
							$("#dform").css("display","inline");
							$("#tableShow").css("display","none");
							//左上角返回键
							$("#toBack").click(function(){
								$("#dform").css("display","none");	
								$("#tableShow").css("display","inline");
								$("#toTop").css("display","none");
								$("#toBottom").css("display","none");
								$("#toBack").css("display","none");	
								$("#reset").click();
								var divs=$("div");
								var imgs=$("img");
								//获取所有是detail的img标签以及各种类型img的下标
								for(var i=0;i<divs.length;i++){
									if(divs[i].getAttribute("dType")=='true'){
										divs[i].remove();
									}
								}
							});
							//显示图片
							$("#guaranteeImg").attr("src","${pageContext.request.contextPath}"+"/imgs/"+data.guarantee);
							$("#parameterImg").attr("src","${pageContext.request.contextPath}"+"/imgs/"+data.parameter);
							$("#listImg").attr("src","${pageContext.request.contextPath}"+"/imgs/"+data.detailed_list);
							$("#photoImg").attr("src","${pageContext.request.contextPath}"+"/imgs/"+data.photo);
							//详细图片
							var details=data.detail.split(",");
							for(var i=0;i<details.length;i++){
								var htmlContent=
									"<div  dType='true' >"
										+"<input type='button' class='layui-btn' id='Iinsert"+insertIndex+"' onclick='insertImgFile(this.id);' value='插入一张图片'> "
										+"<input type='button' class='layui-btn' id='Idelete"+deleteIndex+" 'onclick='deleteImgFile(this.id);' value='删除这张图片'>"
										+"<input type='hidden' name='existImg' value="+details[i]+">"
										+"<br><br>"
										+"<img exist='true' imgType='detail' src='"+"${pageContext.request.contextPath}"+"/imgs/"+details[i]+"' id='Iimg"+imgIndex+"' style='width: 500px;'>"
										+"<br><br>"
									+"</div>";
									insertIndex++;
									deleteIndex++;
									imgIndex++;
									fileIndex++;
									$("#addFile").before(htmlContent);
							}
					  	});
						//渲染表单
						layui.use(['form', 'layedit', 'laydate'], function(){
							  var form = layui.form
							  ,layer = layui.layer
							  ,layedit = layui.layedit
							  ,laydate = layui.laydate;
							  //表单初始赋值
								form.val("formTest", {
								  "ware.id": data.id // "name": "value"
								  ,"ware.name": data.name // "name": "value"
								  ,"ware.price":data.price // "name": "value"
								  ,"ware.city_id": data.city_id // "name": "value"
								 , "ware.classify_id": data.classify_id // "name": "value"
								  ,"ware.brand_id": data.brand_id // "name": "value"
								  ,"ware.stock_count": data.stock_count
								  ,"ware.sale_count": data.sale_count
								  ,"ware.type": data.type
								  ,"ware.detailStr": data.detailStr
								  ,"ware.parameter": data.parameter
								  ,"ware.detailed_list": data.detailed_list
								  ,"ware.guarantee": data.guarantee
								  ,"ware.state": data.state
								  ,"ware.rx": data.rx
								  ,"ware.rp": data.rp
								  ,"ware.xp": data.xp
								  ,"ware.tj": data.tj
								  ,"ware.photo": data.photo
								  ,"ware.introduction": data.introduction
								})
						});
				    }
				 });
			});
		}
		tableData('fss!tableList?voName=WareVo');
		//添加
		function toAdd(){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				$("#ff").find("img").each(function(){
					this.src="";
				});
				$("#dform").css("display","inline");
				$("#tableShow").css("display","none");
				$("#reset").click();
				$("#id").val("-1");
				$("#toBack").click(function(){
					$("#dform").css("display","none");	
					$("#tableShow").css("display","inline");
					$("#toTop").css("display","none");
					$("#toBottom").css("display","none");
					$("#toBack").css("display","none");	
					$("#reset").click();
					var divs=$("div");
					var imgs=$("img");
					//获取所有是detail的img标签以及各种类型img的下标
					for(var i=0;i<divs.length;i++){
						if(divs[i].getAttribute("dType")=='true'){
							divs[i].remove();
						}
					}
				});
			});
		}
		//搜索
		function toSearch(){
			layui.use([ 'jquery', 'layer' ], function() {
				var $ = layui.$ //重点处
				, layer = layui.layer;
				var text=$("#text").val();
				tableData('fss!search?voName=WareVo&state='+text);
				$("#text").val(text);
			});
		}
		//刷新数据
		function toReload(){
				tableData('fss!tableList?voName=WareVo');
		}
		//jquery
		layui.use([ 'jquery', 'layer' ], function() {
			var $ = layui.$ //重点处
			, layer = layui.layer;
			//后面就跟你平时使用jQuery一样
			//表单-返回列表
			$("#back").click(function(){
				$("#dform").css("display","none");	
				$("#tableShow").css("display","inline");
				$("#toTop").css("display","none");
				$("#toBottom").css("display","none");
				$("#toBack").css("display","none");	
				$("#reset").click();
				var divs=$("div");
				var imgs=$("img");
				//获取所有是detail的img标签以及各种类型img的下标
				for(var i=0;i<divs.length;i++){
					if(divs[i].getAttribute("dType")=='true'){
						divs[i].remove();
					}
				}
			});
			//表单-获得高
			if(window.innerHeight>=580){
				$("#dform").css("height",window.innerHeight+"px");
			}
			//提交表单
			$("#submitBtn").click(function(){
				//获取所有img标签
				var images=$("#ff").find("img");
				//获取所有是detail的img标签
				var detailImg=new Array();
				//其对应的文件选择框是否为空判断参数
				var existParameter=0;
				var existList=0;
				var existGuarantee=0;
				var existPhoto=0;
				//获取所有是detail的img标签以及各种类型img的下标
				for(var i=0;i<images.length;i++){
					var imgType=images[i].getAttribute("imgType");
					if(imgType=="detail"){
						detailImg.push(images[i]);
					}else if(imgType=="list"){
						existList=i;
					}else if(imgType=="guarantee"){
						existGuarantee=i;
					}else if(imgType=="parameter"){
						existParameter=i;
					}else if(imgType=="photo"){
						existPhoto=i;
					}	
				}
				//获取已经存在的img下标
				var existImgIndex=new Array();
				for(var i=0;i<detailImg.length;i++){
					if(detailImg[i].getAttribute("exist")=="true"){
						existImgIndex.push(i);
					}
				}
				//去除已经存在的detaile-img个数
				var existCount=existImgIndex.length;
				existParameter=existParameter-existCount;
				existList=existList-existCount;
				existGuarantee=existGuarantee-existCount;
				existPhoto=existPhoto-existCount;
				existImgIndex.push(detailImg.length-existCount);
				//获取所有已存在的图片名称对应的隐藏域
				var existImgInput=$("input[name='existImg']");
				//获取已存在的详细图片名称
				var existImg=new Array();
				for(var i=0;i<existImgInput.length;i++){
						existImg.push(existImgInput[i].value);
				}
				//把详细图片名称赋值到隐藏域
				var hiddenInput=
					"<input type='hidden' name='existImgIndexs' value='"+existImgIndex+"'>"+
					"<input type='hidden' name='ware.detail' value='"+existImg+"'>";
				$("#addFile").before(hiddenInput);
				//如果parameter图片文件框被更改就清空对应的隐藏域的值
				if(!$("#parameterFile").val()==""){
					$("#existParameter").val(existParameter);
				}else{
					existList=existList-1;
					existGuarantee=existGuarantee-1;
					existPhoto=existPhoto-1;
				}
				//如果list图片文件框被更改就清空对应的隐藏域的值
				if(!$("#listFile").val()==""){
					$("#existList").val(existList);
				}else{
					existGuarantee=existGuarantee-1;
					existPhoto=existPhoto-1;
				}
				//如果guarantee图片文件框被更改就清空对应的隐藏域的值
				if(!$("#guaranteeFile").val()==""){
					$("#existGuarantee").val(existGuarantee);
				}else{
					existPhoto=existPhoto-1;
				}
				//如果photo图片文件框被更改就清空对应的隐藏域的值
				if(!$("#photoFile").val()==""){
					$("#existPhoto").val(existPhoto);
				}
				//提交表单
				layer.msg('提交成功！', {
						icon : 1
				});
				setTimeout( function(){
					$('#ff').submit();
				}, 850 );//延迟
			});
			//添加一个图片添加点击事件
			$("#addFile").click(function(){
				$("#addFile").before(getHtmlContent(insertIndex,insertIndex,fileIndex,imgIndex));
				$("#Ifile"+fileIndex).click();
				imgIndex++;
				fileIndex++;
				insertIndex++;
				deleteIndex++;
			});
			//返回TOP
			$("#toTop").click(function(){ 
				$("#dform").scrollTop(0);
			});
			//
			$('#dform').scroll(function(e) {
	      	   //alert(this.scrollTop); 
	      		//去底部
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
		function callback(data){
			layer.msg('修改成功！', {
				icon : 1
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
	<ul id="toBack" style='z-index: 29891215;display: none;left: 10px;top: 15px;width:40px;height: 40px;' class="layui-fixbar">
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
	<!-------------------------- 表单------------------------->
	<div  id='dform' class='layui-layer layui-layer-page' style="overflow:auto;display:none ;z-index: 19891015; width: 100%;height: 590px;top:0px">
		<div class='layui-layer-content'> 
			<center>
				<div style="padding: 80px; line-height: 22px; background-color: white; font-weight: 400;width: 50%">
					<form method="post"  id='ff' lay-filter='formTest' class="layui-form" enctype="multipart/form-data"  action="fss!saveVo?voName=Ware">
					 	<div  class="layui-form-item" >
							<input type='hidden' id='idid' name='ware.id' value='-1'>
							<label class="layui-form-label" >商品名称</label>
							<div class="layui-input-block"  >
								<input  type="text" id='name' name="ware.name" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >价格</label>
							<div  class="layui-input-block">
								<input type="text" id='name' name="ware.price" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >城市</label>
							<div   class="layui-input-block">
								<input type="text" id='name' name="ware.city_id" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >库存</label>
							<div    class="layui-input-block">
								<input type="text" id='name' name="ware.stock_count" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >销量</label>
							<div    class="layui-input-block">
								<input type="text" id='name' name="ware.sale_count" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >出售类型</label> 
							<div  class="layui-input-block">
								<input type="radio"   name="ware.type" value="普通" title="普通"  checked="checked"> <input
									type="radio"    name="ware.type" value="抢购" title="抢购" ><input
									type="radio"    name="ware.type" value="团购" title="团购" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >商品类型</label>
							<div  class="layui-input-block">
								<input type="text" id='name' name="ware.classify_id" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >品牌</label>
							<div  class="layui-input-block">
								<input type="text" id='name' name="ware.brand_id" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >详情图片</label>
						</div>
						<div class="layui-form-item">
								<input type='button' class="layui-btn" id='addFile' value='添加一张图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >参数图片</label>
						</div>
						<div class="layui-form-item">
								<img imgType='parameter' src='' id='parameterImg' style='width: 500px;'>
								<input type="file" onchange="img_show(this,'parameterImg')"  name='imgs' id='parameterFile' style='display: none;'>
								<input type="hidden" name='ware.parameter' id='parameter'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('parameterFile');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >清单图片</label>
						</div>
						<div class="layui-form-item">
								<img imgType="list" src='' id='listImg' style='width: 500px'>
								<input type="file" onchange="img_show(this,'listImg')" name='imgs' id='listFile' style='display: none;'> 
								<input type="hidden" name='ware.detailed_list' id='list'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('listFile');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item"> 
							<label class="layui-form-label" >保障图片</label>
						</div>
						<div class="layui-form-item">
								<img imgType='guarantee' src='' id='guaranteeImg' style='width: 500px;' >
								<input type="file" onchange="img_show(this,'guaranteeImg')" name='imgs' id='guaranteeFile' style='display: none;'>
								<input type="hidden" name='ware.guarantee' id='guarantee'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('guaranteeFile');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item">
							<label class="layui-form-label">热评</label>
							<div   class="layui-input-block">
								<input type="radio"   name="ware.rp" value="启用" title="启用"  checked="checked"> <input
									type="radio"    name="ware.rp" value="禁用" title="禁用" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">热销</label>
							<div   class="layui-input-block">
								<input type="radio"   name="ware.rx" value="启用" title="启用"  checked="checked"> <input
									type="radio"    name="ware.rx" value="禁用" title="禁用" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">新品</label> 
							<div   class="layui-input-block">
								<input type="radio"   name="ware.xp" value="启用" title="启用"  checked="checked"> <input
									type="radio"    name="ware.xp" value="禁用" title="禁用" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">推荐</label>
							<div   class="layui-input-block">
								<input type="radio"   name="ware.tj" value="启用" title="启用"  checked="checked"> <input
									type="radio"    name="ware.tj" value="禁用" title="禁用" >
							</div>
						</div>
						<hr style='background: #65bb93'>
						<div class="layui-form-item">
							<label class="layui-form-label">图片</label>
						</div>
						<input type='hidden' id='existPhoto' name='existPhoto' value='-1'>
						<input type='hidden' id='existGuarantee' name='existGuarantee' value='-1'>
						<input type='hidden' id='existParameter' name='existParameter' value='-1'>
						<input type='hidden' id='existList' name='existList' value='-1'>
						<div class="layui-form-item">
								<img imgType='photo' src='' id='photoImg' style='width: 300px;' >
								<input type="file" onchange="img_show(this,'photoImg')" name='imgs' id='photoFile' style='display: none;'>
								<input type="hidden" name='ware.photo' id='photo'>
								<br><br>
								<input type='button' class="layui-btn" onclick="openFile('photoFile');" value='选择图片'>
						</div>
						<hr style='background: #65bb93'>
						<div  class="layui-form-item">
							<label class="layui-form-label">介绍</label>
							<div   class="layui-input-block">
								<input type="text" id='phone' name="ware.introduction" required lay-verify="required"
									placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">状态</label>
							<div   class="layui-input-block">
								<input type="radio"   name="ware.state" value="启用" title="启用"  checked="checked"> <input
									type="radio"    name="ware.state" value="禁用" title="禁用" >
							</div>
						</div> 
						<div class="layui-form-item">
							<div  class="layui-input-block">
								<p align="right">
									<button lay-submit lay-filter="formDemo" id='toSubmit' style='display: none'>隐藏提交</button>
									<input type='button' class="layui-btn"  id='submitBtn' value="立即提交">
									<button id='reset' type="reset" class="layui-btn layui-btn-primary">重置资料</button>
									<input type='button' value='返回列表' id='back' class="layui-btn layui-btn-primary">
								</p>
							</div>
						</div>
					</form>
					<br><br>
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
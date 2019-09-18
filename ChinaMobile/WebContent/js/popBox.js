// JavaScript Document
//$(function(){
//	//显示
//	$('.popbox-link').click(function(){
//		$.popx.init({
//			_this:$(this), //位置
//			ID:'.popbox',
//			shade:true //遮罩
//		});
//	});
//	//删除
//	$('.close-btn').click(function(){
//		$.popx.occlude({
//			_this:$(this), //位置
//			ID:'.popbox',
//			shade:true //遮罩
//		});
//		return false;
//	});
//})

$.popx = {
	init:function (options){
		this.defaults={
			_this:'',  //位置
			ID:'' , //位置
			shade:false //遮罩
		}
		$.extend(this.defaults, options);
		this.events();
	},
	occlude:function (options){
		this.defaults={
			_this:'',  //位置
			ID:'',  //位置
			shade:false //遮罩
		}
		$.extend(this.defaults, options);
		var defaults=this.defaults;
		defaults._this.parents(defaults.ID).hide();
		if($("#screen")[0]){
			$("#screen").empty().remove();
		}
	},
	events:function(){
		
		var defaults=this.defaults;
		var d_h = $(document).height();
		
			//遮罩
			if(defaults.shade && !$(".byg_shade")[0]){
				var shade_tier='<div id="screen" style="width:100%;height:'+d_h+'px;position:absolute;top:0;left:0;z-index:998;background-color:#000;opacity:0.5;filter:alpha(opacity=50);"></div>';
				$("body").prepend(shade_tier);
			}
			
			move();
			$(defaults.ID).show();
		
		function move(){
			
			var left=0,top=0,tw=$(defaults.ID).width(),th=$(defaults.ID).height();
			var sl=$(window).scrollLeft();
			var slt=$(window).scrollTop();
			
			var win_w=$(window).width(),win_h=$(window).height();
			left=(win_w-tw)/2;
			top=(win_h-th)/2;
			var sleft=left;
			var htop=top;
			
			var sl=$(window).scrollLeft();
				slt=$(window).scrollTop();
				if(sl || slt){
					sleft=left+sl;
					htop=top+slt;
				}

			if (!window.XMLHttpRequest == 1){//如果IE6
				$(defaults.ID).css({left:sleft+"px","top":htop+"px"});
			}else{
				$(defaults.ID).css({left:left+"px","top":top+"px"});
			}
			
		}
		
		$(window).bind("scroll resize", function(e){
			move();
		});
	}
};

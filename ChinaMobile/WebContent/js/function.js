// JavaScript Document
$(function(){
	$.fn.float = function (options) {
	    defaults = {
	        delay : 2000,//延迟时间
	        position:"lm" //位置
	    }
	    var options = $.extend(defaults, options);
	    var $this = $(this); //指向所有scroll_l
	    if(options.position == "lm"){
	        $this.css("position","fixed").css("left","0").css("top","50%").css("transform","translate(0,-50%)");
	    }else if(options.position == "rb") {
	        var widthLength = $(window).width();
	        console.log(widthLength);
	        $this.css("position","fixed").css("right","0px").css("bottom","0px");
	    }
	    setTimeout(function () {
	        $this.css("display","block");
	    },options.delay);
	}

	//头部--地区
	$("#h_place_t a").click(function(){
		//alert("dfdf");
		if( $("#h_place_list").is(":visible") ){
			$("#h_place_list").css("display","none");
			$(this).removeClass("bg2");
		}else{
			$("#h_place_list").css("display","block");
			$(this).addClass("bg2");
		};
		return false;
	});
	$("#h_place_list a").click(function(){
		$("#h_place_t span").html($(this).html());
		$("#h_place_list").css("display","none");
		$("#h_place_t a").removeClass("bg2");
		return false;
	});
	$(document).click(function(e){ 
		e = e || window.event;
		var dom =  e.srcElement|| e.target;
		if( document.getElementById("h_place_list") ){
			if(dom.id != "h_place_t" && document.getElementById("h_place_list").style.display == "block") {
				document.getElementById("h_place_list").style.display = "none";
				$("#h_place_t a").removeClass("bg2");
			}
		}
	});
	//清除搜索狂默认文本
	$(".search_text").focus(function(){
		if($(this).val()==this.defaultValue){
			$(this).val("")
		};
	}).blur(function(){
		if($(this).val()==""){
			$(this).val(this.defaultValue)
		};
	})
	
	//首页--商品分类
	$("#ind_fl > ul > li").hover(function(){
		var ind = $(this).index();
		$(this).children("a").addClass("on").end().siblings().find("a").removeClass("on");
		$(this).find(".ind_fl_list").show();
	},function(){
		$(this).find("a").removeClass("on");
		$(this).find(".ind_fl_list").hide();
	});
	
	//首页--商城公告+促销活动
	$("#ind_ggHd_tit > li").hover(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#ind_ggHd_list > ul").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//首页--推荐产品+3
	$("#ind_list_t1 > li").hover(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#ind_list1 > ul").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//首页--商城特惠+3
	$("#ind_list_t2 > li").hover(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#ind_list2 > ul").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//首页--限时抢购+2
	$("#ind_list_t3 > li").hover(function(){
		var ind = $(this).index()-1;
		$(this).addClass("on").siblings().removeClass("on");
		$("#ind_list3 > ul").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//网上选号--条件筛选（规则号码+4）
	$("div.chooseNO_menu > ul > li").click(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#chooseNO_sel > dl").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//疯狂抢购-秒杀
	$("#yyzq_r_t > span").hover(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#yyzq_r_c > div.yyzq_r_c1").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//合约购机--”品 牌“条件筛选--更多/收起
	$("div.hypj_term > dl > dd.options > span").click(function(){
		var htm = $(this).html();
		if( htm == "收起"){
			$(this).html("更多");
			$(this).removeClass("more");
			$(this).parent().prev("dd").addClass("h30").siblings().removeClass("h30");
		}else{
			$(this).html("收起");
			$(this).addClass("more");
			$(this).parent().prev("dd").removeClass("h30");
		}
	});
	
	//产品详情页-热卖排行
	$(".detail_l_ph > li").hover(function(){
		$(this).addClass("on").siblings().removeClass("on");
	});
	
	//产品详情页-营销包选择
	$("#ysb_btn").click(function(){
		$("#ysb_list").removeClass("hide");
		return false;
	});
	$("#ysb_list a.ysb_list_a").click(function(){
		var _htm = $(this).next("span").html();
		$("#ysb_btn").find("span").html(_htm);
		$("#ysb_list").addClass("hide");
		return false;
	});
	$("#ysb_list a.popBox_close").click(function(){
		$("#ysb_list").addClass("hide");
		return false;
	});
	
	//产品详情页-精明购
	$("a.jmg_btn").click(function(){
		$(this).next("div.jmg_popBox").removeClass("hide");
		return false;
	});
	$(".jmg_popBox a.popBox_close").click(function(){
		$(this).parent().parent("div.jmg_popBox").addClass("hide");
		return false;
	});
	
	//产品详情页-商品介绍+4
	$("#detail_cont_t > li").click(function(){
		var ind = $(this).index();
		$(this).addClass("on").siblings().removeClass("on");
		$("#detail_cont_list > div").eq(ind).removeClass("hide").siblings().addClass("hide");
	});
	
	//产品详情页-自选套餐包弹窗
	$("#czts_btn").click(function(){
		var d_h = $(document).height();
		if(!$("#screen")[0]){
			var shade_tier='<div id="screen" style="width:100%;height:'+d_h+'px;position:absolute;top:0;left:0;z-index:998;background-color:#000;opacity:0.5;filter:alpha(opacity=50);"></div>';
			$("body").prepend(shade_tier);
		}
		$("#ysbTs_popB").removeClass("hide");
		return false;
	});
	$("#xzhy_btn").click(function(){
		$("#ysbTs_popB").addClass("hide");
		$("#ysbTs_popB_bltj").removeClass("hide");
		return false;
	});
	$("#ysbTs_popB a.ysbTs_popB_del,#ysbTs_popB_bltj a.ysbTs_popB_del").click(function(){
		$("#ysbTs_popB").addClass("hide");
		$("#ysbTs_popB_bltj").addClass("hide");
		if($("#screen")[0]){
			$("#screen").empty().remove();
		}
		return false;
	});
	$("#ysbTs_popB_bltj a.back_btn").click(function(){
		$("#ysbTs_popB").removeClass("hide");
		$("#ysbTs_popB_bltj").addClass("hide");
		return false;
	});
	
	//购物车--全选
     $("#CheckedAll").click(function(){
	     $('[name=items]:checkbox').attr('checked', true);
	 });
	 //购物车--删除
	 $("a.sCar_del").click(function(){
	     $(this).parent().parent().remove();
		 return false;
	 });
	 //购物车--删除选中商品
	 $("#del_check").click(function(){
	     $('[name=items]:checkbox:checked').parent().parent().remove();
		 return false;
	 });
	
})
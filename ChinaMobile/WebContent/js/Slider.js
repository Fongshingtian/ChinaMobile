
/*
 * jQuery - LJ_Slider
 * Copyright(c) 2012 by liyunbing’
 * Date: 2012-12-09
 * author：李奫冫
 * 全面兼容IE6+,火狐 谷歌 
 * QQ:liqingzheng123@vip.qq.com
 * 关注JquerySchool 支持原创
 * http://www.jq-school.com
 */
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

 $.fn.LJ_Slider = function (options) {

            defaults = {
                autotime: 5000,
                Event: "mouseover",
                autoPlay: true,
                Default: 1,  //第一章显示
                speed: 300,
                setMode: "x",//fade,x,y
                btndisplay:true
            }
            var options = $.extend(defaults, options);
            return this.each(function () {
                var index = 0;//全局设置 不然点击按钮离开之后会乱跳（感谢adAm的提醒）
                var $this = $(this); //指#demo2
                var $list = $this.find("ul");
                var $listLi = $list.find("li")
                var $imgs = $this.find("img");
                var $imgslen = $imgs.length;
                var cguess = "<div class='cguess-tabs' id='cguess-tabs'>" + "</div>";
                $this.append(cguess);
                //根据图片的个数来添加p个数
                for (var i = 0; i < $imgslen; i++) {
                    var cgp = "<p>"+(i+1)+"</p>";
                    $(".cguess-tabs").append(cgp);
                }
                var listP = $("#cguess-tabs p");
                listP.eq(options.Default - 1).addClass("active");
                index = $("#cguess-tabs .active").index();
                $listLi.eq(index).show();
                //鼠标绑定事件
               $("body").delegate(".cguess-tabs p",options.Event, function () {

                    index = $(this).index();
                    showImg(index);
                });
                //自动播放
                if (options.autoPlay) {
                    var play = setInterval(function () {

                        if (index >= $imgslen - 1) {
                            index = 0;
                        }
                        else {
                            index += 1;
                        };
                        showImg(index);
                    }, options.autotime);
                    $this.hover(function () {
                        clearInterval(play);   
                    },function(){
                        play = setInterval(function () {
                            if (index >= $imgslen - 1) {
                                index = 0;
                            }
                            else {
                                index += 1;
                            };
                            showImg(index);
                        }, options.autotime);
                    });     
                }
                //按钮显示
                if(options.btndisplay){
                    var btnhtml="<div class='prev'>" +"</div> "+ "<div class='next'>" +"</div>";
                    var prev=".prev",
                    next=".next";
                    //$this.append(btnhtml);
					$("body").delegate(prev,'click',function(){
                        if(index<=0){
                            //如果当前显示索引的是0或者小于0 当点击上一张应该是显示最后一张
                            index=$imgslen-1;
                        }
                        else{
                            //如果不是显示索引不是第一张，点击则显示上一张
                            index-=1;
                        }
                        showImg(index);
                        return false;
                    });
					$("body").delegate(next,'click',function(){
                        if(index>=$imgslen-1){
                            //如果当前显示索引的是要大于或者等于图片的数量，则点击显示的是第一张
                            index=0;
                        }
                        else{
                            //如果当前显示索引的是要小于图片的数量，则点击显示的是下一张
                            index+=1;
                        }
                        showImg(index);
                        return false;
                    });             
                }
                //执行事件
                function showImg(i) {
                    //alert(i);
					
                    switch (options.setMode) {
                        case "fade":
                            listP.eq(i).addClass("active").siblings().removeClass("active");
                            $listLi.eq(i).fadeIn(options.speed).siblings().fadeOut(200);
                            break;
                        case "x":
                            $listLi.removeAttr("style");
                            listP.eq(i).addClass("active").siblings().removeClass("active");
                            $list.stop().animate({ "left": -(i * $listLi.width()) }, options.speed);
                            break;
                        case "y":
                            $listLi.css("float", "none");
                            listP.eq(i).addClass("active").siblings().removeClass("active");
                            $list.stop().animate({ "top": -(i * $listLi.height()) }, options.speed);
                            break;
                    }

                }
            });
        }
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
 $("#btn").click(function(){
		var pwd=$("#pwd").val();
		var name=$("#name").val();
		$.post("fss!ManagerLogin",{pwd:pwd,name:name},function(data){
			if(data.state=='成功'){
				window.location.href='${pageContext.request.contextPath}/BackStage/index.jsp';
			}else{
				alert("账号或密码错误！");
			}
		},'json');
	}
 );
</script>
</head>
<body>
	<div class="login_box">
      <div class="login_l_img"><img src="images/login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img style="margin-top:22px" src="images/login_logo.png" /></a></div>
          <div class="login_name">
               <p>中国移动后台管理系统</p>
          </div>
          <form method="post" id='ff'>
              <input name="username" type="text"  value="账号" onfocus="this.value=''" onblur="if(this.value==''){this.value='账号'}">
              <span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>
				<input name="password" type="password" id="password" style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};"/>
					<hr size='15' color='white'>
				 <input value="登录" style="width:100%;" type="submit">
	          </form>
	      </div>
	      <div class="copyright">Powered by © 2018</div>
	</div>
	<div style="text-align:center;">
	</div>
</body>
</html>
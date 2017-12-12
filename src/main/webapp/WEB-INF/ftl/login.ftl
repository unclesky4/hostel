<!DOCTYPE HTML>
<html>
<head>
	<title>LOGIN</title>
	<!-- Custom Theme files -->
	<link href="../static/style.css" rel="stylesheet" type="text/css" media="all"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<!--Google Fonts-->
	<!-- <link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'> -->
	<!--Google Fonts-->
	<script src="../static/jquery-3.0.0.min.js"></script>
</head>
<body>
<div class="login">
	<h2>HOSTEL</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form>
			<input id="username" type="text" placeholder="用户名">
			<input id="password" type="password" placeholder="password">
	    </form>
	    <div class="forgot">
	    	<!-- <a href="#">忘记密码</a> -->
	    	<input type="submit" value="登陆" id="login">
	    </div>
	</div>
	<div class="login-bottom">
		<!-- <h3>New User &nbsp;<a href="javascript:void(0);">Register</a>&nbsp; Here</h3> -->
	</div>
</div>
<!-- <div class="copyright">
	<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></p>
</div> -->
</body>
<script>
	$(function() {
		$("#login").on("click", function() {
			var username = $.trim($("#username").val());
			var pwd = $.trim($("#password").val());
			$.ajax({
				url: "/hostel/user/login",
				async: false,
				dataType: "text",
				type: "post",
				data: {
					"username": username,
					"pwd": pwd
				},
				success: function(result) {
					if(result == "yes") {
						location.href="/hostel/user/info";
					}else{
						alert("用户名或密码不正确");
					}
				},
				error: function() {
					alert("error");
				}
			});
		});
	})
</script>
</html>
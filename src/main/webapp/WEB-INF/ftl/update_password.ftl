<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>HOSTEL</title>
	<link type="text/css" href="../../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="../../static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="../../static/css/theme.css" rel="stylesheet">
	<link type="text/css" href="../../static/images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index.html">
			  		HOSTEL
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav nav-icons">
						<li class="active"><a href="javascript:void(0);">
							<i class="icon-envelope"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-eye-open"></i>
						</a></li>
						<li><a href="#">
							<i class="icon-bar-chart"></i>
						</a></li>
					</ul>

					<form class="navbar-search pull-left input-append" action="#">
						<input type="text" class="span3">
						<button class="btn" type="button">
							<i class="icon-search"></i>
						</button>
					</form>
				
					<ul class="nav pull-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Item No. 1</a></li>
								
								<li><a href="#">Don't Click</a></li>
								<li class="divider"></li>
								<li class="nav-header">Example Header</li>
								<li><a href="#">A Separated link</a></li>
							</ul>
						</li>
						
						<li><a href="#">
							Support
						</a></li>
						<li class="nav-user dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="../../static/images/user.png" class="nav-avatar" />
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="/hostel/user/info">个人信息</a></li>
								<li><a href="/hostel/user/password/update">修改密码</a></li>
								<li class="divider"></li>
                                <li><a href="/hostel/user/logout">注销</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">
						<#include "${sidebar}"/>
					</div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>修改登陆密码</h3>
							</div>
							<div class="module-body">

								<form class="form-horizontal row-fluid">
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">旧密码</label>
										<div class="controls">
											<input type="password" id="oldPwd" class="span8">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">新密码</label>
										<div class="controls">
											<input type="password" id="newPwd" class="span8">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">确认密码</label>
										<div class="controls">
											<input type="password" id="newPwd_repeat" class="span8">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<div class="controls" style="margin-left:230px;">
											<button type="button" class="btn" onclick="update();">更新密码</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->
	
	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2017 unclesky4</b>
		</div>
	</div>

	<script src="../../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
	
	<script>
		
		//更新个人信息
		function update() {
			var r = confirm("确定更新密码？");
			if(!r){
				return;
			}
			var oldPwd = $.trim($("#oldPwd").val());
			var newPwd = $.trim($("#newPwd").val());
			var newPwd_repeat = $.trim($("#newPwd_repeat").val());
			var url = "/hostel/user/updatePwd";
			if(oldPwd == "") {
				alert("请输入旧密码");
				return;
			}
			if(newPwd == "" || newPwd_repeat == "") {
				alert("新密码不能未空");
				return;
			}
			if(newPwd != newPwd_repeat) {
				alert("输入的两次密码不匹配");
				return;
			}
			$.post(url,{"oldPwd":oldPwd,"newPwd":newPwd},function(result) {alert(result);},"text");
		}
	</script>
</body>
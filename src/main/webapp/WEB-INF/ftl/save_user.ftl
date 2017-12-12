<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>HOSTEL</title>
	<link type="text/css" href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="../static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="../static/css/theme.css" rel="stylesheet">
	<link type="text/css" href="../static/images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href="../static/extension/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<style>
		body {
			font-family: Arial, Helvetica, sans-serif;
		}
		
		table {
			font-size: 1em;
		}
		
		.ui-draggable, .ui-droppable {
			background-position: top;
		}
	</style>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="javascript:void(0);">
			  		HOSTEL
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">
						<li><a href="javascript:void(0);">
							${NAME}
						</a></li>
						<li class="nav-user dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
								<img src="../static/images/user.png" class="nav-avatar" />
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
								<h3>添加用户</h3>
							</div>
							<div class="module-body">

								<form class="form-horizontal row-fluid">

									<div class="control-group">
										<label class="control-label" for="basicinput">用户名</label>
										<div class="controls">
											<input type="text" id="username" placeholder="字符长度须小于10" class="span8">
										</div>
									</div><br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">性别</label>
										<div class="controls">
											<select tabindex="1" id="sex" class="span8">
												<option value=""></option>
												<option value="0">男</option>
												<option value="1">女</option>
											</select>
										</div>
									</div><br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">手机号码</label>
										<div class="controls">
											<input type="text" id="phone" class="span8">
										</div>
									</div><br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">角色</label>
										<div class="controls">
											<select tabindex="1" id="role_id" class="span8">
												<option value=""></option>
												<#list roles as r>
													<option value="${r.roleId}">${r.symbol}</option>
												</#list>
											</select>
										</div>
										<div class="controls">
											<span id="role_description" class="help-inline"></span>
										</div>
									</div>
									<hr/>
									<div class="control-group">
										<label class="control-label" for="basicinput">密码</label>
										<div class="controls">
											<input type="password" id="pwd" class="span8">
										</div>
									</div><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">确认密码</label>
										<div class="controls">
											<input type="password" id="pwd_repeat" class="span8">
										</div>
									</div>
									<div class="control-group" style="padding-left:40px;">
										<div class="controls">
											<button type="button" class="btn" onclick="save();">保存用户</button>
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

	<script src="../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="../static/jquery-mousewheel/jquery.mousewheel.min.js" type="text/javascript"></script>
	<script>
		//保存
		function save() {
			var userName = $.trim($("#username").val());
			var userPwd = $.trim($("#pwd").val());
			var userPwd_repeat = $.trim($("#pwd_repeat").val());
			var userSex = $("#sex").val();
			var userPhone = $.trim($("#phone").val());
			var roleId = $("#role_id").val();
			
			if(userName == "" || userName.length > 10) {
				alert("用户名不能为空且长度须小于10");
				retrun ;
			}
			if(userSex == "") {
				alert("请选择性别");
				return ;
			}
			var z = /^1[3|4|5|7|8][0-9]{9}$/;
			if(!z.test(userPhone)) {
				alert("手机格式不正确");
				return ;
			}
			if(roleId == "") {
				alert("请选择角色");
				return;
			}
			//验证密码
			if(userPwd == "" || userPwd_repeat == "") {
				alert("密码不能为空");
				return ;
			}
			if(userPwd != userPwd_repeat) {
				alert("两次密码不一致");
				return ;
			}
			
			$.ajax({
				url: "/hostel/user/saveUser",
				dataType: "json",
				type: "post",
				async: false,
				data: {
					"userName": userName,
					"userPwd": userPwd,
					"userSex": userSex,
					"userPhone": userPhone,
					"roleId": roleId
				},
				success: function(result) {
					alert(result.data);
				},
				error: function() {
					alert("error");
				}
			});
		}
	</script>
</body>
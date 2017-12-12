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
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
	<!--dropdown-->
	<link type="text/css" href='../../static/extension/dropdown/jquery.dropdown.min.css' rel='stylesheet'>
	<style>
		.form_2 {display:none;}
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
                        <li><a href="javascript:void(0);">
							${NAME}
						</a></li>
						<li class="nav-user dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
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
                </div>
                <!-- /.nav-collapse -->
            </div>
        </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <div class="sidebar">
                        <#include "${sidebar}"/>
                    </div>
                    <!--/.sidebar-->
                </div>
                <!--/.span3-->
                <div class="span9">
                    <div class="content">
                        <div class="module">
                            <div class="module-body">
                                <h4>用户详情页</h4>
                                <ul class="profile-tab nav nav-tabs">
                                    <li class="active"><a href="#activity" data-toggle="tab">基本信息</a></li>
                                    <li><a href="#friends" data-toggle="tab">更改密码</a></li>
                                </ul>
                                
                                <div class="profile-tab-content tab-content">
                                	<!--基本信息-->
                                    <div class="tab-pane fade active in" id="activity">
                                        <form class="form-horizontal row-fluid">
											<div class="control-group">
												<label class="control-label" for="basicinput">用户名</label>
												<div class="controls">
													<input type="text" id="name" value="${userName}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">性别</label>
												<div class="controls">
													<select class="span8" id="sex">
														<option value=""></option>
														<option value="0">男</option>
														<option value="1">女</option>
													</select>
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">手机号码</label>
												<div class="controls">
													<input type="text" id="phone" value="${userPhone}" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">状态</label>
												<div class="controls">
													<input type="text" id="state" value="${userState}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">角色</label>
												<div class="controls">
													<select class="span8" id="role_id">
														<option value=""></option>
														<#list roles as role>
															<option value="${role.roleId}">${role.symbol}</option>
														</#list>
													</select>
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">创建时间</label>
												<div class="controls">
													<input type="text" id="createTime" value="${createTime}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="update();">更新信息</button>
												</div>
											</div>
										</form>
										
                                    </div>
                                    <!--/基本信息-->
                                    
                                    <!--修改用户密码-->
                                    <div class="tab-pane fade" id="friends">
                                        <form class="form-horizontal row-fluid form_1" style="padding-top:80px;padding-bottom:100px;">
											<div class="control-group">
												<label class="control-label" for="basicinput">输入密码</label>
												<div class="controls">
													<input type="password" id="password" class="span8">
												</div>
											</div>
											<br/><br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">确认密码</label>
												<div class="controls">
													<input type="password" id="password_repeat" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="updatePwd();">修改密码</button>
												</div>
											</div>
                                        </form>
                                    </div>
                                    <!--/修改用户密码-->
                                </div>
								
                            </div>
                            <!--/.module-body-->
                        </div>
                        <!--/.module-->
                    </div>
                    <!--/.content-->
                </div>
                <!--/.span9-->
            </div>
        </div>
        <!--/.container-->
    </div>
    <!--/.wrapper-->
    <div class="footer">
        <div class="container">
            <b class="copyright">&copy; unclesky4</b>
        </div>
    </div>
    <script src="../../static/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="../../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../static/scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <!--dropdown-->
	<script src="../../static/extension/dropdown/jquery.dropdown.min.js" type="text/javascript"></script>
	<!--layer-->
	<!--<script src="../../static/extension/layer-v3.1.1/layer/layer.js" type="text/javascript"></script>-->
	
    <script>
    	$("#sex").val(${userSex});
    	$("#role_id").val(${roleId});
    	
    	//更新用户信息
    	function update() {
    		var r = confirm("确定更新信息?");
    		if(!r) {
    			return;
    		}
    		var userId = ${userId};
    		var userSex = $("#sex").val();
    		var userPhone = $.trim($("#phone").val());
    		var roleId = $("#role_id").val();
    		//alert(userId+" "+userSex+" "+userPhone);
    		
    		if(userSex == "") {
    			alert("请选择性别");
    			return ;
    		}
    		//匹配手机号码
			var z1 = /^1[3|4|5|7|8][0-9]{9}$/;
			if(!z1.test(userPhone)) {
				alert("手机格式不正确");
				return;
			}
			if(roleId == "") {
				alert("请选择角色");
				return;
			}
    		var url = "/hostel/user/"+userId+"/update";
    		$.post(url, {"userId":userId, "userSex": userSex, "userPhone": userPhone, "roleId":roleId}, function(result) {alert(result);}, "text");
    	}
    	
    	//修改用户密码
    	function updatePwd() {
    		var r = confirm("确定更新该用户密码?");
    		if(!r) {
    			return;
    		}
    		var userId = ${userId};
    		var pwd = $.trim($("#password").val());
    		var pwd_repeat = $.trim($("#password_repeat").val());
    		if(pwd == "" || pwd_repeat == "") {
    			alert("密码不能为空");
				return;
    		}
    		if(pwd != pwd_repeat) {
    			alert("两次密码不正确");
				return;
    		}
    		var url = "/hostel/user/"+userId+"/update";
    		$.post(url, {"userId":userId, "userPwd": pwd}, function(result) {alert(result);}, "text");
    	}
    </script>
</body>
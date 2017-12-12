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
								<h3>宿舍详情页</h3>
							</div>
							<div class="module-body">

								<form class="form-horizontal row-fluid">

									<div class="control-group">
										<label class="control-label" for="basicinput">宿舍门号</label>
										<div class="controls">
											<input type="text" id="dNum" value="${data.dormitoryNumber}" class="span8" readonly="readonly">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">已住人数</label>
										<div class="controls">
											<input type="text" id="totals" value="${data.totals}" class="span8" readonly="readonly">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<div class="controls" style="margin-left:230px;">
											<button type="button" class="btn" onclick="edit();">编辑信息</button>
											<button type="button" class="btn" onclick="update();">更新信息</button>
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
		//开启,关闭编辑文本框
		function edit() {
			if($(".span8").attr("readOnly")) {
				$(".span8").attr("readOnly",false);
			}else{
				$(".span8").attr("readOnly","readOnly");
			}
		}
		
		//更新信息
		function update() {
			var r = confirm("确定更新信息?");
			if(!r) {
				return;
			}
			var dId = ${data.dormitoryId};
			var dNum = $.trim($("#dNum").val());
			var totals = $.trim($("#totals").val());
			var z = /^\d+$/;
			if(!z.test(dNum)) {
				alert("宿舍门号须填正整数");
				return ;
			}
			if(!z.test(totals)) {
				alert("已住人数须填正整数");
				return ;
			}
			var url = "/hostel/dormitory/update";
			$.post(url,{"dId":dId, "totals":totals, "dNum":dNum},function(result) {alert(result);},"text");
		}
	</script>
</body>
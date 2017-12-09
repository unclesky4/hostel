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
								<h3>添加宿舍楼</h3>
							</div>
							<div class="module-body">

								<form class="form-horizontal row-fluid">

									<div class="control-group">
										<label class="control-label" for="basicinput">宿舍楼名称</label>
										<div class="controls">
											<input type="text" id="building_name" placeholder="长度须小于10">
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">层数</label>
										<div class="controls">
											<input id="floors"/>
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">每层宿舍间数</label>
										<div class="controls">
											<input id="rooms"/>
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">每间可住人数</label>
										<div class="controls">
											<input id="lives"/>
										</div>
									</div>
									<br/><br/>
									<div class="control-group">
										<div class="controls" style="margin-left:230px;">
											<button type="button" class="btn" onclick="save();">保存宿舍楼</button>
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

	<script src="../static/jquery-3.0.0.min.js" type="text/javascript"></script>
	<script src="../static/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../static/scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="../static/jquery-mousewheel/jquery.mousewheel.min.js" type="text/javascript"></script>
	<script>
		var floors_spinner = $( "#floors" ).spinner({
			max: 20,
			min: 2,
		});
		var rooms_spinner = $( "#rooms" ).spinner({
			max: 20,
			min: 2
		});
		var lives_spinner = $( "#lives" ).spinner({
			max: 20,
			min: 2
		});
		//保存
		function save() {
			//alert(floors_spinner.spinner( "value" ));
			var name = $.trim($("#building_name").val());
			var floors = floors_spinner.spinner( "value" );
			var rooms = rooms_spinner.spinner( "value" );
			var lives = lives_spinner.spinner( "value" );
			if(name == "") {
				alert("宿舍楼名称不能为空");
				return ;
			}
			if(name.length > 10) {
				alert("宿舍楼名称长度须小于10");
				return ;
			}
			var z = /^\d+$/;
			if(!z.test(floors) || !z.test(rooms) || !z.test(lives)) {
				alert("层数，间数，可住人数必须为整数");
				return ;
			}
			$.ajax({
				url: "/hostel/building/saveBuilding",
				dataType: "text",
				type: "post",
				async: false,
				data: {
					"name": name,
					"floors": floors,
					"rooms": rooms,
					"lives": lives
				},
				success: function(result) {
					alert(result);
				},
				error: function() {
					alert("error");
				}
			});
		}
	</script>
</body>
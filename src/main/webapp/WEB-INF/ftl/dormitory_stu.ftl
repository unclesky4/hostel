﻿<!DOCTYPE html>
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
	<!-- DataTables CSS -->
	<!--<link href="https://cdn.bootcss.com/datatables/1.10.4/css/jquery.dataTables.min.css" rel="stylesheet">-->
	<link type="text/css" href='../../static/extension/DataTables-1.10.15/media/css/jquery.dataTables.min.css' rel='stylesheet'>
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
							<div class="module-body">
								<div class="module-head">
									<h3>入住学生信息 &nbsp;&nbsp;<span>(${dormitory.building.buildingName}/${dormitory.dormitoryNumber}  已住：${dormitory.totals}人)</span></h3>
								</div>
								<div class="module-body">
									<table class="table table-bordered">
							        	<tr>
								            <th>学号</th>
								            <th>姓名</th>
								            <th>性别</th>
								            <th>学院专业</th>
								            <th>班级</th>
								            <th>手机号码</th>
								            <th>入学年份</th>
								            <th>操作</th>
								        </tr>
								        <#list dormitory.students as s>
								        	<tr>
									            <th>${s.stuNumber}</th>
									            <th>${s.name}</th>
									            <th>
									            </th>
									            <th>${s.major}</th>
									            <th>${s.classNum}</th>
									            <th>${s.phone}</th>
									            <th>${s.year}</th>
									            <th><a href="/hostel/student/${s.stuId}/detail">详情</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="remove('${s.stuId}')">删除</a></th>
									        </tr>
								        </#list>
									</table>
								</div>
							    
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
		
		//删除
		function remove(stuId) {
			var r = confirm("确定删除?");
			if(!r) {
				return;
			}
			var url = "/hostel/student/delete";
			$.post(url, {"stuId":stuId}, function(result) {alert(result);},"text");
		}
	</script>
</body>
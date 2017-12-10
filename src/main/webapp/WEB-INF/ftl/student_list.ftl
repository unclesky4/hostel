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
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<!-- DataTables CSS -->
	<!--<link href="https://cdn.bootcss.com/datatables/1.10.4/css/jquery.dataTables.min.css" rel="stylesheet">-->
	<link type="text/css" href='../static/extension/DataTables-1.10.15/media/css/jquery.dataTables.min.css' rel='stylesheet'>
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
								<h3>学生信息</h3>
							</div>
							<div class="module-body">
								<form class="form-horizontal row-fluid">
									<div class="control-group">
										<label class="control-label" for="basicinput">宿舍楼</label>
										<div class="controls">
											<select class="span8" id="building_id">
												<option value=""></option>
												<#list buildings as b>
													<option value="${b.buildingId}">${b.buildingName}</option>
												</#list>
											</select>
											<button type="button" class="btn btn-primary" onclick="query();">查询</button>
										</div>
									</div>
								</form>
								<br/>
								<table id="list" class="table table-striped table-bordered" width="100%">
							        <thead>
							        <tr>
							            <th>主键</th>
							            <th>学号</th>
							            <th>姓名</th>
							            <th>性别</th>
							            <th>学院专业</th>
							            <th>手机号码</th>
							            <th>入学年份</th>
							            <th>操作</th>
							        </tr>
							        </thead>
							        <tbody></tbody>
							        <!-- tbody是必须的 -->
							    </table>
							    
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
	<!--<script src="https://cdn.bootcss.com/datatables/1.10.4/js/jquery.dataTables.min.js"></script>-->
	<script src="../static/extension/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	
	<script>
		var table = $("#list").DataTable({
			"lengthMenu": [10,20,30],  //自定义长度菜单的选项
			"serverSide": false,
			"columnDefs": [
                {
                    "targets": 7,
                    "render": function ( data, type, full, meta ) {
                    	var array = new Array();
                    	array.push('<a href="#">详情</a>');
                    	array.push('<a href="#">删除</a>');
				      	return array.join(" ");
				    }
                },
                {
            		//显示性别 0->男， 1->女
                	"targets": 3,
                	"render": function ( data, type, full, meta ) {
	                	 if(data.sex == 0){return "男"}
	                	 else{return "女"}
				    }
                }
            ],
			"columns": [
	            { "data": "stuId", "visible": false, "orderable": false},
	            { "data": "stuNumber", "orderable": true},
	            { "data": "name", "orderable": false},
	            { "data": "sex", "orderable": true},
	            { "data": "major", "orderable": true},
	            { "data": "phone", "orderable": false},
	            { "data": "year", "orderable": true},
	            { "orderable": false, "width": "20%"}
	        ]
		});
		
		//查询某栋宿舍楼的所有学生信息
		function query() {
			var bId = $("#building_id").val();
			if(bId == "") {
				alert("请选择宿舍楼");
				return ;
			}
			//销毁已渲染的表格
			table.destroy();
			//重新获取数据
			table = $("#list").DataTable({
				"lengthMenu": [10,20,30],  //自定义长度菜单的选项
				"serverSide": false,
				"ajax": {
					"url": "/hostel/student/queryByBuildingId",
					"dataSrc": "data",
					"data": {
				        "bId": bId
				    },
					"type": "post"
				},
				"columnDefs": [
	                {
	                    "targets": 7,
	                    "render": function ( data, type, full, meta ) {
	                    	var array = new Array();
	                    	array.push('<a href="/hostel/student/'+full.stuId+'/detail">详情</a>');
	                    	array.push('<a href="javascript:void(0);" onclick="remove(\''+full.stuId+'\')">删除</a>');
					      	return array.join(" ");
					    }
	                },
	                {
	            		//显示性别 0->男， 1->女
	                	"targets": 3,
	                	"render": function ( data, type, full, meta ) {
		                	 if(full.sex == 0){return "男"}
		                	 else{return "女"}
					    }
	                }
	            ],
				"columns": [
		            { "data": "stuId", "visible": false, "orderable": false},
		            { "data": "stuNumber", "orderable": true},
		            { "data": "name", "orderable": false},
		            { "data": "sex", "orderable": true},
		            { "data": "major", "orderable": true},
		            { "data": "phone", "orderable": false},
		            { "data": "year", "orderable": true},
		            { "orderable": false, "width": "20%"}
		        ]
			});
		}
		
		//删除
		function remove(stuId) {
			var r = confirm("确定删除?");
			if(!r) {
				return;
			}
			var url = "/hostel/student/delete";
			$.post(url, {"stuId":stuId}, function(result) {alert(result);},"text");
			//刷新数据
			table.ajax.reload();
		}
	</script>
</body>
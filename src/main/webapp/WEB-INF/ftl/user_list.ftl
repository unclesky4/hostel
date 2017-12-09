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
								<h3>所有用户信息</h3>
							</div>
							<div class="module-body">

								<table id="list" class="table table-striped table-bordered" width="100%">
							        <thead>
							        <tr>
							            <th>主键</th>
							            <th>用户名</th>
							            <th>性别</th>
							            <th>联系电话</th>
							            <th>用户状态</th>
							            <th>创建时间</th>
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
			"ajax": {
				"url": "/hostel/user/getAll",
				"dataSrc": "data",
				"type": "post"
			},
			"columnDefs": [
                {
                    "targets": -1,
                    "render": function ( data, type, full, meta ) {
                    	var array = new Array();
                    	array.push('<a href="#">详情</a>');
                    	array.push('<a href="#">删除</a>');
                    	array.push('<a href="#">审核</a>');
				      	return array.join(" ");
				    }
                },
                {
            		//显示性别 0->男， 1->女
                	"targets": 2,
                	"render": function ( data, type, full, meta ) {
	                	 if(data == 0){return "男"}
	                	 else{return "女"}
				    }
                },
                {
            		//显示用户状态
                	"targets": 4,
                	"render": function ( data, type, full, meta ) {
	                	if(data == 0){
	                		 return "待审核"
	                	}else if(data == 1){
	                		return "已通过审核"
	                	}else{
	                		return "未通过审核"
	                	}
				    }
                },
                {
            		//显示格式化的时间
                	"targets": 5,
                	"render": function ( data, type, full, meta ) {
                		var date = new Date(data);
	                	return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
				    }
                }
            ],
			"columns": [
	            { "data": "userId", "visible": false, "orderable": false},
	            { "data": "userName", "orderable": false},
	            { "data": "userSex", "orderable": false},
	            { "data": "userPhone", "orderable": false},
	            { "data": "userState", "orderable": true},
	            { "data": "createTime", "orderable": true},
	            { "data": null, "orderable": false, "searchable": false}
	        ]
		});
		
		//时间格式化处理  dateFtt("yyyy-MM-dd hh:mm:ss",date)
		function dateFtt(fmt,date)   
		{
		  var o = {   
		    "M+" : date.getMonth()+1,                 //月份   
		    "d+" : date.getDate(),                    //日   
		    "h+" : date.getHours(),                   //小时   
		    "m+" : date.getMinutes(),                 //分   
		    "s+" : date.getSeconds(),                 //秒   
		    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
		    "S"  : date.getMilliseconds()             //毫秒   
		  };   
		  if(/(y+)/.test(fmt))   
		    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
		  for(var k in o)   
		    if(new RegExp("("+ k +")").test(fmt))   
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
		  return fmt;   
		} 
	</script>
</body>
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
							            <th>角色</th>
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
	<!--时间格式化-->
	<script src="../static/DateUtil.js"></script>
	<!--layer-->
	<script src="../static/extension/layer-v3.1.1/layer/layer.js" type="text/javascript"></script>
	
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
                    "targets": 7,
                    "render": function ( data, type, full, meta ) {
                    	var array = new Array();
                    	if(full.userId != ${userId}) {
                    		array.push('<a href="/hostel/user/'+full.userId+'/detail">详情</a>');
                        	array.push('<a href="javascript:void(0);" onclick="remove(\''+full.userId+'\')">删除</a>');
                        	array.push('<a href="javascript:void(0);" onclick="verify(\''+full.userId+'\')">审核</a>');
                    	}
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
                		var date = new Date(full.createTime);
	                	return dateFtt("yyyy-MM-dd",date);
				    }
                },
                {
            		//显示角色
                	"targets": 6,
                	"data": function (row, type, val, meta) {
                		var tmp = "";
                		$.each(row.role, function(k, v) {
                			if(k == "symbol") {
                				switch(v) {
	                				case "root":
	                					tmp = "超级管理员";
	                					break;
	                				case "administrator":
	                					tmp = "管理员";
	                					break;
	                				case "guest":
	                					tmp = "来宾";
	                					break;
	                				default: ;
                				}
                				return false;
                			}
                		})
	                	return tmp;
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
	            { "orderable": true},
	            { "orderable": false, "searchable": false}
	        ]
		});
		
		//审核
		function verify(userId) {
			layer.open({
			  type: 1,
			  title: "审核用户状态",
			  skin: 'layui-layer-rim', //加上边框
			  area: ['420px', '240px'], //宽高
			  content: '<form class="form-horizontal row-fluid" style="padding-top:40px;">'+
			  		'<div class="control-group">'+
						'<label class="control-label" for="basicinput">审核状态</label>'+
						'<div class="controls">'+
							'<select class="span8" id="user_state">'+
								'<option value=""></option>'+
								'<option value="1">审核通过</option>'+
								'<option value="-1">审核不通过</option>'+
							'</select>'+
						'</div>'+
					'</div><br/><br/>'+
					'<div class="control-group">'+
						'<div class="controls" style="margin-left:190px;">'+
							'<button type="button" class="btn btn-primary" onclick="update(\''+userId+'\');">确 定</button>'+
						'</div>'+
					'</div>'+
			  	'</form>'
			});
		}
		
		//删除用户
		function remove(userId) {
			var r = confirm("确定删除该用户?");
			if(!r) {
				return;
			}
			var url = "/hostel/user/"+userId+"/delete";
			$.post(url, {"userId": userId}, function(result) {alert(result);},"text");
		}
		
		//更新用户审核状态
		function update(userId) {
			
			//关闭最新弹出的层
			layer.close(layer.index);
			//alert(userId+"  "+userState);
			if(userId == "") {
				alert("参数错误");
				return ;
			}
			var userState = $("#user_state").val();
			if(userState == "") {
				alert("请选择审核状态");
				return ;
			}
			var url = "/hostel/user/"+userId+"/update";
			$.post(url, {"userId": userId, "userState":userState}, function(result) {alert(result);},"text");
		}
		
	</script>
</body>
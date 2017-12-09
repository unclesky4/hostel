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
	<!--dropdown-->
	<link type="text/css" href='../static/extension/dropdown/jquery.dropdown.min.css' rel='stylesheet'>
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
								<h3>添加学生</h3>
							</div>
							<div class="module-body">

								<form class="form-horizontal row-fluid">
									<div class="control-group">
										<label class="control-label" for="basicinput">宿舍楼</label>
										<div class="controls">
											<div class="building_dropdown dropdown-simple">
											   <!-- PS: select标签需手动设置隐藏 -->
												<select style="display:none" id="bId">
												    <option value=" "></option>
													<#list buildings as b>
														<option value="${b.buildingId}">${b.buildingName}</option>
													</#list>
												</select>
											</div>
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">宿舍门号</label>
										<div class="controls">
											<div class="dormitory_dropdown dropdown-simple">
											   <!-- PS: select标签需手动设置隐藏 -->
												<select style="display:none" id="dId">
												    <!--<option value="1">1</option>-->
												</select>
											</div>
										</div>
									</div>
									<hr/>
									<div class="control-group">
										<label class="control-label" for="basicinput">学生姓名</label>
										<div class="controls">
											<input type="text" id="name" class="span8" placeholder="字符长度须小于15">
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">学生学号</label>
										<div class="controls">
											<input type="text" id="number" class="span8">
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">学生性别</label>
										<div class="controls">
											<select class="span8" id="sex">
												<option value="0">男</option>
												<option value="1">女</option>
											</select>
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">手机号码</label>
										<div class="controls">
											<input type="text" id="phone" class="span8">
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">学院专业</label>
										<div class="controls">
											<input type="text" id="major" class="span8" placeholder="字符长度须小于20">
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">班级</label>
										<div class="controls">
											<input type="text" id="class_num" class="span8" placeholder="请输入正整数">
										</div>
									</div>
									<br/>
									<div class="control-group">
										<label class="control-label" for="basicinput">入学年份</label>
										<div class="controls">
											<select class="span8" id="year">
												<option value="0"></option>
												<#list years as y>
														<option value="${y}">${y}</option>
												</#list>
											</select>
										</div>
									</div>
									<br/>
									<div class="control-group">
										<div class="controls" style="margin-left:230px;">
											<button type="button" class="btn" onclick="save();">保存学生</button>
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
	<!--dropdown-->
	<script src="../static/extension/dropdown/jquery.dropdown.min.js" type="text/javascript"></script>
	<script>
		var building_dropdown = $('.building_dropdown').dropdown({
		  readOnly: true,
		  input: '<input type="text" maxLength="20" placeholder="搜索关键词或ID">',
		  //选中时的回调函数
		  choice: function () {
		    //alert($("#bId").val());
		    var buildingId = $("#bId").val();
		    $.ajax({
		    	url: "/hostel/dormitory/getByBuildingId",
				dataType: "json",
				type: "post",
				async: false,
				data: {
					"bId": buildingId
				},
				success: function(result) {
					//保存选项列表
					var array = new Array();
					//保存宿舍门号，宿舍主键(二维数组)
					var dormitoryArray = new Array();
					
					$.each(result, function(k, v) {
						$.each(v,function(idx,obj) {
							var tmpArray = new Array();
							tmpArray.push(obj.dormitoryNumber);
							tmpArray.push(obj.dormitoryId);
							dormitoryArray.push(tmpArray);
						});
					});
					//根据宿舍门号排序
					dormitoryArray.sort();
					
					array.push("<option value=''></option>");
					for(var i=0; i<dormitoryArray.length; i++) {
						var tmp = "<option value='"+dormitoryArray[i][1]+"'>"+dormitoryArray[i][0]+"</option>";
						array.push(tmp);
					}
					//更新宿舍选项列表
					dormitory_dropdown.destroy();
					$("#dId").html(array.join(" "));
					dormitory_dropdown = $('.dormitory_dropdown').dropdown({
					  readOnly: true,
					  input: '<input type="text" maxLength="20" placeholder="搜索关键词或ID">',
					}).data('dropdown');
					
				},
				error: function() {
					alert("error");
				}
		    });
		  }
		}).data('dropdown');
		
		var dormitory_dropdown = $('.dormitory_dropdown').dropdown({
		  readOnly: true,
		  input: '<input type="text" maxLength="20" placeholder="搜索关键词或ID">',
		}).data('dropdown')	;
		
		//保存学生
		function save() {
			var dId = $("#dId").val();
			var number = $.trim($("#number").val());
			var name = $.trim($("#name").val());
			var phone = $.trim($("#phone").val());
			var sex = $("#sex").val();
			var major = $.trim($("#major").val());
			var classNum = $.trim($("#class_num").val());
			var year = $("#year").val();
			
			var z = /^\d+$/;
			if(!z.test(number)) {
				alert("学号为正整数");
				return;
			}
			if(name == "" || name.length > 10) {
				alert("姓名不能为空且长度须小于10");
				return;
			}
			//匹配手机号码
			var z1 = /^1[3|4|5|7|8][0-9]{9}$/;
			if(!z1.test(phone)) {
				alert("手机格式不正确");
				return;
			}
			if(major == "" || major.length > 20) {
				alert("学院专业不能为空且长度须小于20");
				return;
			}
			if(!z.test(classNum)) {
				alert("班级须填正整数");
				return;
			}
			$.ajax({
				url: "/hostel/student/saveStu",
				dataType: "text",
				type: "post",
				async: false,
				data: {
					"stuNumber": number,
					"name": name,
					"phone": phone,
					"sex": sex,
					"major": major,
					"year": year,
					"classNum": classNum,
					"dormitoryId": dId
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
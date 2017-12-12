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
                    <i class="icon-reorder shaded"></i></a>
                    <a class="brand" href="javascript:void(0);">HOSTEL</a>
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
                                <h4>学生信息详情页</h4>
                                <ul class="profile-tab nav nav-tabs">
                                    <li class="active"><a href="#activity" data-toggle="tab">学生基本信息</a></li>
                                    <li><a href="#friends" data-toggle="tab">学生入住宿舍信息</a></li>
                                </ul>
                                
                                <div class="profile-tab-content tab-content">
                                	<!--基本信息-->
                                    <div class="tab-pane fade active in" id="activity">
                                        <form class="form-horizontal row-fluid">
											<div class="control-group">
												<label class="control-label" for="basicinput">姓名</label>
												<div class="controls">
													<input type="text" id="stuName" value="${student.name}" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学号</label>
												<div class="controls">
													<input type="text" id="stuNumber" value="${student.stuNumber}" class="span8">
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
													<input type="text" id="phone" value="${student.phone}" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学院专业</label>
												<div class="controls">
													<input type="text" id="major" value="${student.major}" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">班级</label>
												<div class="controls">
													<input type="text" id="classNum" value="${student.classNum}" class="span8">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">入学年份</label>
												<div class="controls">
													<select class="span8" id="year">
														<option value=""></option>
														<#list years as y>
															<option value="${y}">${y}</option>
														</#list>
													</select>
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">创建时间</label>
												<div class="controls">
													<input type="text" id="createTime" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="update_info();">更新基本信息</button>
												</div>
											</div>
										</form>
										
                                    </div>
                                    <!--/基本信息-->
                                    
                                    <!--学生入住宿舍的信息-->
                                    <div class="tab-pane fade" id="friends">
                                        <form class="form-horizontal row-fluid form_1" style="padding-top:80px;padding-bottom:100px;">
											<div class="control-group">
												<label class="control-label" for="basicinput">宿舍楼</label>
												<div class="controls">
													<input type="text" value="${building.buildingName}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/><br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">宿舍门号</label>
												<div class="controls">
													<input type="text" id="year" value="${student.dormitory.dormitoryNumber}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="show('form_2');">编辑信息</button>
												</div>
											</div>
                                        </form>
                                        
                                        <form class="form-horizontal row-fluid form_2" style="padding-top:80px;padding-bottom:100px;">
							      			<div class="control-group">
												<label class="control-label" for="basicinput">宿舍楼</label>
												<div class="controls building_dropdown" style="width:50%;">
													<select class="span8" style="display:none" id="building_id">
														<option value=""></option>
														<#list buildings as b>
															<option value="${b.buildingId}">${b.buildingName}</option>
														</#list>
													</select>
												</div>
											</div>
											<br/><br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">宿舍门号</label>
												<div class="controls dormitory_dropdown" style="width:50%;">
													<select class="span8" style="display:none;" id="dormitory_id">
														<option value=""></option>
													</select>
												</div>
											</div>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="show('form_1');">返回</button>
													<button type="button" class="btn" onclick="update_dId();">修改</button>
												</div>
											</div>
							      		</form>
                                    </div>
                                    <!--/学生入住宿舍的信息-->
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
            <b class="copyright">&copy; 2017 unclesky4</b>
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
    	var active_form = "form_1";
    	$("#sex").val(${student.sex});
    	$("#year").val(${student.year});
    	$("#createTime").val('${student.createTime?string("yyyy-MM-dd")}');
    	
    	//显示修改入住宿舍的子页面
    	function show(param) {
    		$("."+active_form).hide();
    		active_form = param;
    		$("."+active_form).show();
    	}
    	
    	//宿舍楼下拉菜单初始化
    	var building_dropdown = $(".building_dropdown").dropdown({
    		readOnly: true,
		  input: '<input type="text" maxLength="20" placeholder="搜索关键词或ID">',
		  //选中时的回调函数
		  choice: function () {
		    //alert($("#building_id").val());
		    var buildingId = $("#building_id").val();
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
					$("#dormitory_id").html(array.join(" "));
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
    	
    	//宿舍下拉菜单初始化
    	var dormitory_dropdown = $('.dormitory_dropdown').dropdown({
		  readOnly: true,
		  input: '<input type="text" maxLength="20" placeholder="搜索关键词或ID">',
		}).data('dropdown');
		
		//更新学生基本信息
		function update_info() {
			var r = confirm("确定更新?");
			if(!r) {
				return;
			}
			var stuId = ${student.stuId};
			var stuNumber = $.trim($("#stuNumber").val());
			var name = $.trim($("#stuName").val());
			var phone = $.trim($("#phone").val());
			var sex = $("#sex").val();
			var major = $.trim($("#major").val());
			var year = $("#year").val();
			var classNum = $.trim($("#classNum").val());
			
			var z = /^\d+$/;
			if(!z.test(stuNumber)) {
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
			if(sex == "") {
				alert("请选择性别");
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
			if(year == "") {
				alert("请选择入学年份");
				return;
			}
			
			$.ajax({
				url: "/hostel/student/update",
				dataType: "text",
				type: "post",
				async: false,
				data: {
					"stuId": stuId,
					"stuNumber": stuNumber,
					"name": name,
					"phone": phone,
					"sex": sex,
					"major": major,
					"year": year,
					"classNUm": classNum
				},
				success: function(result) {
					alert(result);
				},
				error: function() {
					alert("error");
				}
			});
		}
		
		//更新学生入住的宿舍
		function update_dId() {
			var r = confirm("确定修改?");
			if(!r) {
				return;
			}
			var stuId = ${student.stuId};
			var dormitoryId = $("#dormitory_id").val();
			//alert(stuId+"  "+dormitoryId);
			if(dormitoryId == "") {
				alert("请选择宿舍");
				return;
			}
			var url = "/hostel/student/update";
			$.post(url, {"stuId": stuId, "dormitoryId":dormitoryId}, function(result) {alert(result);},"text");
		}
		
    </script>
</body>
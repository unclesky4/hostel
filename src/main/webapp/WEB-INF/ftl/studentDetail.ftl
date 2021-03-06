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
                    <i class="icon-reorder shaded"></i></a><a class="brand" href="javascript:void(0);">HOSTEL </a>
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
													<input type="text" id="stuName" value="${student.name}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学号</label>
												<div class="controls">
													<input type="text" id="stuNumber" value="${student.stuNumber}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">性别</label>
												<div class="controls">
													<input type="text" id="sex" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">手机号码</label>
												<div class="controls">
													<input type="text" id="phone" value="${student.phone}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学院专业</label>
												<div class="controls">
													<input type="text" id="major" value="${student.major}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">班级</label>
												<div class="controls">
													<input type="text" id="classNum" value="${student.classNum}" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">入学年份</label>
												<div class="controls">
													<input type="text" id="year" value="${student.year}" class="span8" readonly="readonly">
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
		if(${student.sex} == 0) {
			$("#sex").val("男");
		}else{
			$("#sex").val("女");
		}
		$("#createTime").val('${student.createTime?string("yyyy-MM-dd")}');
	</script>
</body>
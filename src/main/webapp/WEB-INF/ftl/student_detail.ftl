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
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
        rel='stylesheet'>
</head>
<body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html">Edmin </a>
                <div class="nav-collapse collapse navbar-inverse-collapse">
                    <ul class="nav nav-icons">
                        <li class="active"><a href="#"><i class="icon-envelope"></i></a></li>
                        <li><a href="#"><i class="icon-eye-open"></i></a></li>
                        <li><a href="#"><i class="icon-bar-chart"></i></a></li>
                    </ul>
                    <form class="navbar-search pull-left input-append" action="#">
                    <input type="text" class="span3">
                    <button class="btn" type="button">
                        <i class="icon-search"></i>
                    </button>
                    </form>
                    <ul class="nav pull-right">
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                            <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Item No. 1</a></li>
                                <li><a href="#">Don't Click</a></li>
                                <li class="divider"></li>
                                <li class="nav-header">Example Header</li>
                                <li><a href="#">A Separated link</a></li>
                            </ul>
                        </li>
                        <li>
                        	<a href="#">Support</a
                        </li>
						<li class="nav-user dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
                                    <li><a href="#friends" data-toggle="tab">关联的信息</a></li>
                                </ul>
                                
                                <div class="profile-tab-content tab-content">
                                	<!--基本信息-->
                                    <div class="tab-pane fade active in" id="activity">
                                    
                                        <form class="form-horizontal row-fluid">
											<div class="control-group">
												<label class="control-label" for="basicinput">姓名</label>
												<div class="controls">
													<input type="text" id="name" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学号</label>
												<div class="controls">
													<input type="text" id="floors" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">性别</label>
												<div class="controls">
													<select class="span8" id="building_id">
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
													<input type="text" id="lives" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">学院专业</label>
												<div class="controls">
													<input type="text" id="lives" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">班级</label>
												<div class="controls">
													<input type="text" id="lives" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">入学年份</label>
												<div class="controls">
													<input type="text" id="lives" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<label class="control-label" for="basicinput">创建时间</label>
												<div class="controls">
													<input type="text" id="lives" value="" class="span8" readonly="readonly">
												</div>
											</div>
											<br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="update();">更新基本信息</button>
												</div>
											</div>
										</form>
										
                                    </div>
                                    <!--/基本信息-->
                                    
                                    <!--学生相关联的信息-->
                                    <div class="tab-pane fade" id="friends">
                                        <form class="form-horizontal row-fluid" style="padding-top:100px;padding-bottom:100px;">
                                        	<div class="control-group">
												<label class="control-label" for="basicinput">宿舍楼</label>
												<div class="controls">
													<select class="span8" id="building_id">
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
												<div class="controls">
													<select class="span8" id="building_id">
														<option value=""></option>
													</select>
												</div>
											</div><br/><br/>
											<div class="control-group">
												<div class="controls" style="margin-left:300px;">
													<button type="button" class="btn" onclick="update();">更新关联信息</button>
												</div>
											</div>
                                        </form>
                                    </div>
                                    <!--/学生相关联的信息-->
                                    
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
    <!--时间格式化-->
    <script src="../static/DateUtil.js"></script>
</body>
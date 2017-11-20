<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>用户信息</title>
	<!-- Jquery -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
	
	<!-- Bootstrap -->
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!--select2-->
	<link href="https://cdn.bootcss.com/select2/4.0.0/css/select2.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/select2/4.0.0-beta.3/js/select2.min.js"></script>
	
	<style>
		#userSex {width:100%;}
	</style>
</head>
<body>
	<div style="margin: 50px auto; width:700px;">
		<form>
		  <div class="form-group">
		    <label>用户名</label>
		    <input type="input" class="form-control" value=${userName} id="userName" readonly>
		  </div>
		  <div class="form-group">
		    <label>性别</label><br/>
		    <select id="userSex">
			  <option value="0">男</option>
			  <option value="1">女</option>
			</select>
		  </div>
		  <div class="form-group">
		    <label>联系电话</label>
		    <input type="input" class="form-control" value=${userPhone} id="userPhone">
		  </div>
		  <div class="form-group">
		    <label>注册时间</label>
		    <input type="input" class="form-control" value=${createTime} id="createTime" readonly>
		  </div>
		  <div class="form-group">
		    <label>角色</label>
		    <input type="input" class="form-control" id="role" value=${roleName} readonly>
		  </div>
		  <p style="margin-left:300px;">
			  <button type="button" class="btn btn-primary" onclick="update();">更新信息</button>
			</p>
		</form>
	</div>
</body>
<script>
	var selectSex = $('#userSex').select2();
	//设置默认值
	selectSex.val(${userSex}).trigger("change");
	selectSex.change();
	
	function update() {
		var r = confirm("确定更新信息？");
		if(!r){
			return;
		}
		var userId = ${userId};
		var userSex = $("#userSex").val();
		var userPhone = $.trim($("#userPhone").val());
		var url = "/hostel/user/"+userId+"/update";
		$.post(url,{"userSex":userSex, "userPhone":userPhone},function(result) {alert(result);},"text");
	}
</script>
</html>
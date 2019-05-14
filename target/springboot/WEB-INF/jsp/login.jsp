<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body style="background-color: #F3F3F3">
<form id="formlogin" class="itemForm" method="post">
    <div class="easyui-dialog" title="管理员登录" data-options="closable:false,draggable:false" style="width:400px;height:300px;padding:10px;">
       	<div style="margin-left: 50px;margin-top: 50px;">
       		<div style="margin-bottom:20px;">
	            <div>
	            	用户名: <input name="username" class="easyui-textbox" data-options="required:true" style="width:200px;height:32px" value="jinyou"/>
	            </div>
	        </div>
	        <div style="margin-bottom:20px">
	            <div>
	            	密&nbsp;&nbsp;码: <input name="password" class="easyui-textbox" type="password" style="width:200px;height:32px" data-options="" value="123"/>
	            </div>
	        </div>
	        <div>
	            <a id="login" class="easyui-linkbutton" iconCls="icon-ok" style="width:100px;height:32px;margin-left: 50px">登录</a>
	        </div>
       	</div>
    </div>
 </form>
    
<script type="text/javascript"></script>
<script type="text/javascript" src="/static/js/jquery-easyui-1.4.1/jquery.min.js"></script>


    <script>
    	$("#login").click(function(){
    		
    		$.post("/user/login", $("#formlogin").serialize(),function(data){
    			console.log("adsg == " + data);
				if (data.status == 200) {
					console.log("test254");
					window.location.href="/";
					
				} else {
					console.log("登录失败，原因是：" + data.msg + "失败");
				}
			});
    	});
    </script>
</body>
</html>
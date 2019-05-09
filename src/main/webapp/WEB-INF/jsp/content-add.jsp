<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<script src="/static/js/jquery-easyui-1.4.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/static/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="contentAddForm" class="itemForm" method="post">
		<input type="hidden" name="categoryId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>name:</td>
	            <td><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>password:</td>
	            <td><input class="easyui-textbox" type="text" name="password" style="width: 280px;"></input></td>
	        </tr>
	        
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentAddPage.submitForm()">提交</a>
	 </div>
</div>

<script type="text/javascript"></script>
    <script src="/static/jquery.min.js"></script>
    <script>
	var contentAddEditor ;
	$(function(){

	});
	
	var contentAddPage  = {
			submitForm : function (){

				$.post("/insertUser",$("#contentAddForm").serialize(), function(data){
					console.log("test == " + data);
					if(data == "200"){
						//alert("jQuery alert box example !");
						if (window.confirm('Really go to another page?'))
						{
						    // They clicked Yes
						    console.log("tesst1");
						    document.location = 'http://localhost:8080/content';
						}
						else
						{
						    // They clicked no
							console.log("tesst2");
							location.reload();
						}
					}
				});
			},

	};
</script>

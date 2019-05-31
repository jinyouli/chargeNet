<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

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

<script>
	var contentAddEditor ;
	$(function(){

	});
	
	var contentAddPage  = {
			submitForm : function (){

				$.post("/insertUser",$("#contentAddForm").serialize(), function(data){
					console.log("test == " + data);
					if(data == "200"){
						location.reload();
					}
				});
			},

	};
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<div style="padding:10px 10px 10px 10px">
	<form id="contentAddForm" class="itemForm" method="post">
		<input type="hidden" name="categoryId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>客户：</td>
	            <td><input class="easyui-textbox" type="text" name="piguser" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>100元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_100" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>200元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_200" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>300元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_300" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>450元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_450" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>600元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_600" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>800元档：</td>
	            <td><input class="easyui-textbox" type="text" name="num_800" style="width: 280px;"></input></td>
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
				$.post("/insertPig",$("#contentAddForm").serialize(), function(data){
					console.log("test == " + data);
					if(data == "200"){
						if (window.confirm('添加成功'))
						{
							location.reload();
						}
					}
				});
			},
	};
</script>

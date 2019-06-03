<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<div style="padding:10px 10px 10px 10px">
	<form id="contentAddForm" class="itemForm" method="post">
		<input type="hidden" name="categoryId"/>
	    <table cellpadding="5">
	        <tr>
	            <td>日期：</td>
	            <td><input class="easyui-textbox" id="myDate" name="changetime" type="date" value="2014-01-13"/></td>
	        </tr>
	        <tr>
	            <td>客户：</td>
	            <td><input class="easyui-textbox" type="text" name="piguser" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>100元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_100" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>200元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_200" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>300元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_300" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>450元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_450" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>600元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_600" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>800元档：</td>
	            <td><input class="easyui-textbox" type="number" name="num_800" style="width: 280px;"></input></td>
	        </tr>
	        
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentAddPage.submitForm()">提交</a>
	 </div>
</div>

<script>

$(document).ready(function () {
    var time = new Date();
    var day = ("0" + time.getDate()).slice(-2);
    var month = ("0" + (time.getMonth() + 1)).slice(-2);
    var today = time.getFullYear() + "-" + (month) + "-" + (day);
    $('#myDate').val(today);
})

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

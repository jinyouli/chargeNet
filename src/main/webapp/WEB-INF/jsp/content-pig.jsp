<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div>
	<form id="form1" action="selectpigs" method="post">
           日期: <input name="first_date" type="date" value="2014-01-13"/>
     <label>至</label>
    <input name="second_date" type="date" value="2014-01-13"/>
    <label>客户名</label>
    <input name="piguser" type="text"/>

    <button class="btn btn-lg btn-primary btn-block" type="submit">查询</button>
</form>
</div>


<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center'" style="padding:5px">
            <table border="1" id="tb">
			　　 <thead>
			　　　　<caption>历史知识点对比</caption>
			　　　　<tr>
			　　　　　　<th rowspan="2">知识点</th>
			　　　　　　<th rowspan="2">全校得分率</th>
			　　　　　　<th rowspan="2">上次考试教师授课班级得分率</th>
			　　　　　　<th rowspan="2">本次考试教师授课本机得分率</th>
			　　　　　　<th colspan="3">本次分班级</th>
			　　　　　　<th rowspan="2">神经网络预测得分率</th>
			       </tr>
			       
			       <tr><td id="formID" value="APF00000003"></td></tr>  
			       <tr>
			　　　　　　<th>1班</th>
			　　　　　　<th>2班</th>
			　　　　　　<th>3班</th>
			　　　　</tr>
			　　</thead>
			
			</table>
			
			<table id="table_tablespaces" border="1">
		    </table>
        </div>
    </div>
</div>

<style>
div{float:left}
</style>


<script type="text/javascript">

function mydelete(id){
	console.log("id == " + id);
	
	$.post("/deletePig",{id:id}, function(data){
		console.log("test == " + data);
		if(data == "200"){
			location.reload();
		}
	});
};

$("#form1").ajaxForm(function(data){  
	var tbl_body = "";
    var odd_even = false;
    $.each(data, function() {
        var tbl_row = "";
        var id = "";
        $.each(this, function(k , v) {
        	//console.log("data == " + k + "  " + v);
            tbl_row += "<td>"+v+"</td>";
            if(k == "id"){
            		id = v;
            }
        })
        
        
        var button = "<td height=\"100px;\">" + "<input type=\"button\" value=\"删除\" style=\"width:100px;height:100px;background:green;\" onclick=\"mydelete('"+ id +"')\" />" + "</td>";
        tbl_body += "<tr class=\""+( odd_even ? "odd" : "even")+"\">"+tbl_row + button +"</tr>";

        odd_even = !odd_even;               
    })
    $("#table_tablespaces").html(tbl_body);
}); 

$.get("http://localhost:8080/pigs", function(data){

	var tbl_body = "";
    var odd_even = false;
    $.each(data, function() {
        var tbl_row = "";
        var id = "";
        $.each(this, function(k , v) {
        	//console.log("data == " + k + "  " + v);
            tbl_row += "<td>"+v+"</td>";
            if(k == "id"){
            		id = v;
            }
        })
        
        
        var button = "<td height=\"100px;\">" + "<input type=\"button\" value=\"删除\" style=\"width:100px;height:100px;background:green;\" onclick=\"mydelete('"+ id +"')\" />" + "</td>";
        tbl_body += "<tr class=\""+( odd_even ? "odd" : "even")+"\">"+tbl_row + button +"</tr>";

        odd_even = !odd_even;               
    })
    $("#table_tablespaces").html(tbl_body);
     
});

	
</script>
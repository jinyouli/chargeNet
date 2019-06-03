<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/static/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<div>
	<form id="form1" action="selectpigs" method="post">
           日期: <input name="first_date" type="date" value="2014-01-13"/>
     <label>至</label>
    <input id="myDate" name="second_date" type="date" value="2014-01-13"/>
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
			　　　　<caption style="font-size:20px;">档次记录</caption>
			　　　　<tr>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">客户</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">录入时间</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">赔付100</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">赔付200</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">赔付300</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">赔付450</td>
					<td align="center" style="width:80px;" rowspan="2">赔付600</td>
			　　　　　　<td align="center" style="width:80px;" rowspan="2">赔付800</td>
			       </tr>

			　　</thead>
			
			</table>
			
			<table id="table_tablespaces" border="1">
		    </table>
        </div>
    </div>
</div>

<script type="text/javascript">

$(document).ready(function () {
    var time = new Date();
    var day = ("0" + time.getDate()).slice(-2);
    var month = ("0" + (time.getMonth() + 1)).slice(-2);
    var today = time.getFullYear() + "-" + (month) + "-" + (day);
    $('#myDate').val(today);
})
function mydelete(id){
	
	if (confirm("你确定删除该记录吗？")) {  
		console.log("id == " + id);
		
		$.post("/deletePig",{id:id}, function(data){
			console.log("test == " + data);
			if(data == "200"){
				location.reload();
			}
		});
    }  
    else {  
        //alert("点击了取消");  
    }  
};

$("#form1").ajaxForm(function(data){  
	var tbl_body = "";
    var odd_even = false;
    $.each(data, function() {
        var tbl_row = "";
        var id = "";
        $.each(this, function(k , v) {
        	if(k != "id"){
        		tbl_row += "<td style=\"width:80px;\" align=\"center\">"+v+"</td>";    
            }   
            
            if(k == "id"){
            	id = v;
            }
        })
        
        
        var button = "<td height=\"100px;\">" + "<input type=\"button\" value=\"删除该记录\" style=\"width:100px;height:100px;background:white;\" onclick=\"mydelete('"+ id +"')\" />" + "</td>";
        tbl_body += "<tr style=\"width:1000px;\" class=\""+( odd_even ? "odd" : "even")+"\">"+tbl_row + button +"</tr>";

        odd_even = !odd_even;               
    })
    $("#table_tablespaces").html(tbl_body);
}); 

$.get("/pigs", function(data){

	var tbl_body = "";
    var odd_even = false;
    $.each(data, function() {
        var tbl_row = "";
        var id = "";
        $.each(this, function(k , v) {
        	//console.log("data == " + k + "  " + v);
        	if(k != "id"){
        		tbl_row += "<td style=\"width:80px;\" align=\"center\">"+v+"</td>";
            }
        	
            if(k == "id"){
            	id = v;
            }
        })
        
        
        var button = "<td height=\"100px;\">" + "<input type=\"button\" value=\"删除该记录\" style=\"width:100px;height:100px;background:white;\" onclick=\"mydelete('"+ id +"')\" />" + "</td>";
        tbl_body += "<tr class=\""+( odd_even ? "odd" : "even")+"\">"+tbl_row + button +"</tr>";

        odd_even = !odd_even;               
    })
    $("#table_tablespaces").html(tbl_body);
     
});

	
</script>

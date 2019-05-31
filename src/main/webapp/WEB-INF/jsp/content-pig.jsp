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
			　　　　<caption>档次记录</caption>
			　　　　<tr>
			　　　　　　<th style="width:80px;" rowspan="2">客户</th>
			　　　　　　<th style="width:80px;" rowspan="2">录入时间</th>
			　　　　　　<th style="width:80px;" rowspan="2">赔付100</th>
			　　　　　　<th style="width:80px;" rowspan="2">赔付200</th>
			　　　　　　<th style="width:80px;" rowspan="2">赔付300</th>
			　　　　　　<th style="width:80px;" rowspan="2">赔付450</th>
					<th style="width:80px;" rowspan="2">赔付600</th>
			　　　　　　<th style="width:80px;" rowspan="2">赔付800</th>
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
        	//console.log("data == " + k + "  " + v);
            tbl_row += "<td style=\"width:100px;height:100px;background:green;\">"+v+"</td>";
            if(k == "id"){
            		id = v;
            }
        })
        
        
        var button = "<td height=\"100px;\">" + "<input type=\"button\" value=\"删除\" style=\"width:100px;height:100px;background:green;\" onclick=\"mydelete('"+ id +"')\" />" + "</td>";
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
            tbl_row += "<td style=\"width:80px;\" align=\"center\">"+v+"</td>";
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
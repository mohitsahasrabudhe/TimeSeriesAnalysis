$(document).ready(function()
{ 
    $('#dataStreamList').dblclick(function()
	{
           var arr=[];
            $("#dataStreamList li.treeview.active").children("a").find("span").each(function() 
             {
             arr.push($(this).text())
             });
			 Shiny.onInputChange("myvalue", arr);
    });
});	
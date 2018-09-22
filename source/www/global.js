$(document).ready(function()
{ 
    $('#dataStreamList').click(function()
	{
           var arr=[];
            $("#dataStreamList li.treeview.active").children("a").find("span").each(function() 
             {
             arr.push($(this).text());
             });
			 Shiny.onInputChange("myvalue", arr);
    });
    
    $('#timeSeriesList').click(function()
	{       console.log("CLicked");
	            var arr1=[];
            $("#timeSeriesList li.treeview.active").children("a").find("span").each(function() 
             {
             arr1.push($(this).text());
             });
			 Shiny.onInputChange("myvalue1", arr1);
    });
});	


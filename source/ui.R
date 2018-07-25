
shinyUI(
  fluidPage(theme="bootstrap.css",
            
            
            textOutput("sessionId"),
            textOutput("sampletext"),
            tabsetPanel(type = "tabs",
                        
                        source('uifiles/ui_data_load.R',local=T)$value,
                        
                        source('uifiles/ui_create_timeseries.R',local=T)$value,
                        
                        source('uifiles/ui_timeseries_eda.R',local=T)$value,
                        
                        source('uifiles/ui_timeseries_modeling.R',local=T)$value,
                        
                        source('uifiles/ui_model_scoring.R',local=T)$value
            ),
            tags$script(
              HTML(
                '$(document).ready(function(){

$("#dataStreamList").find("i").remove();

$("#dataStreamList").click( function() {
var x = [];
                x.push($("#dataStreamList li.treeview.active").children("a").find("span").each(function()
{
this.text()});

console.log(x);
                });

                });'
              )
            )
  )
)




shinyUI(
  fluidPage(
    
    theme = 'bootstrap.css',
    
    textOutput("sessionId"),
    actionButton("show", "Show modal dialog"),
    
    titlePanel("Time Series Analysis"),
    
    tabsetPanel(type = "tabs",
                
                source('uifiles/ui1_data_load.R',local=T)$value,
                
                source('uifiles/ui_create_timeseries.R',local=T)$value,
                
                source('uifiles/ui_timeseries_eda.R',local=T)$value,
                
                source('uifiles/ui_timeseries_modeling.R',local=T)$value,
                
                source('uifiles/ui_model_scoring.R',local=T)$value
    )
  )
)



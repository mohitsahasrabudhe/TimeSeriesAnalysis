
shinyUI(
  fluidPage(
    
    theme = 'bootstrap.css',
    
    textOutput("sessionId"),
    
    actionButton("show", "Show modal dialog"),
    
    titlePanel("Time Series Analysis"),
    
    tabsetPanel(type = "tabs",
                
                source('uifiles/data_load.R',local=T)$value,
                
                source('uifiles/create_timeseries.R',local=T)$value,
                
                source('uifiles/timeseries_eda.R',local=T)$value,
                
                source('uifiles/timeseries_modeling.R',local=T)$value,
                
                source('uifiles/model_scoring.R',local=T)$value
    )
  )
)



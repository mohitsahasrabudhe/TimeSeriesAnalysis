

#Popup for data loader
observeEvent(input$addTimeSeries, {
  print(list.files(path = "savefiles//timeseries//"))
  showModal(popupTimeSeriesLoader())
})



popupTimeSeriesLoader <- function(failed = FALSE) {
  modalDialog(
    tabBox(width = "100%",
           tabPanel("",
                    textInput(
                      inputId = "timeSeriesName",
                      label = "Time Series Name"
                    ),
                    selectInput(
                      inputId = "timeSeriesSource",
                      label = "Select time series source",
                      choices = c(list.files(path = "savefiles//datasource//")),
                      selected = 1
                    ),
                    actionButton("setNameTimeSeries","Next")
           ),
           tabPanel("",
                    uiOutput("selectListTimeSeries"),
                    actionButton("setFilesTimeSeries","Next"),
                    conditionalPanel(condition = ("input.setFilesTimeSeries >= 1"),
                                     uiOutput("selectListTimeSeries"),
                                     actionButton("setFilesTimeSeries","Next")
                    )
           )
    )
  )
}


output$selectListTimeSeries<-renderUI({
  checkboxGroupInput(inputId = "selectFileTimeSeries",label = "Select files to append",
                     choices = c(list.files(path = paste0("D://Time Series Analysis//TimeSeriesAnalysis//source//savefiles//datasource//",input$timeSeriesSource,"//",sep=""),
                                            recursive = T,
                                            full.names = F)
                     ))
})
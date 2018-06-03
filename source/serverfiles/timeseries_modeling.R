#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

shinyServer(function(input, output,session) 
{
  #Loading Libraries
  source('serverfiles/global/load_libraries.R',local=TRUE)
  
  #Sourcing Global ariables
  source('serverfiles/global/global_variables.R',local=TRUE)
  
  #Source Session Details
  source('serverfiles/global/session_details.R',local=TRUE)
  
  output$timeSeriesTable<-renderDataTable(timeSeriesData())
  observeEvent(input$show, {
    showModal(popupData())
  })
  
  #Connect to database
  # observeEvent(input$dataBaseConnect,{
  #   if (input$dbType == "Mongo DB") {
  #     showNotification(ui = 'connecting')
  #     tryCatch(mongoConnection <- mongoDbConnect(dbName = input$dbNameInput,
  #                                                host = input$hostNameInput,
  #                                                port = input$portNameInput),
  #              error=function(error_message)
  #              {
  #                print(error_message)
  #              }
  #     )
  #   }
  #   else{
  #     showNotification(ui = "Haven't configured that db yet")
  #   }
  # }
  # )
  
  popupData <- function(failed = FALSE) {
    modalDialog(
      dataTableOutput("timeSeriesTable")
    )
  }
  
  # Create time series definition
  # The reactive timeseries variable
  # timeSeriesData <- reactive({
  #   inFile <- input$csvInput
  #   if (is.null(inFile)) return(NULL)
  #   data <- read.csv(inFile$datapath, header = TRUE)
  #   data
  # })
  
  output$timeVariable<-renderUI({
    selectInput(
      "timeVariable",
      "Select the date variable",
      choices = c(colnames(timeSeriesData()))
      )})
  
  output$dependentTSVariable<-renderUI({
    selectInput(
      "dependentTSVariable",
      "Select the time series variable",
      choices = c(colnames(timeSeriesData()))
    )})
  
  
}
)


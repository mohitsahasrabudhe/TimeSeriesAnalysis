#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
if(!require(shiny)){
  install.packages("shiny")
  library(shiny)
}
if(!require(RMongo)){
  install.packages("RMongo")
  library(RMongo)
}


shinyServer(function(input, output,session) 
{
  
  output$myshittycoding<-renderText(input$hasHeadersInput)
  
  #Session Details
  sessionId <- as.integer(runif(1, 1, 100000))
  output$sessionId <- renderText(paste0("Session ID: ", sessionId))
  session$onSessionEnded(function() {
    cat(paste0("Ended: ", sessionId))
    #dbDisconnect(rmongo.object = mongoConnection)
  })
  
  output$timeSeriesTable<-renderDataTable(timeSeriesData())
  observeEvent(input$show, {
    showModal(dataModal())
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

  dataModal <- function(failed = FALSE) {
    modalDialog(
      dataTableOutput("timeSeriesTable")
      )
  }
  
  #Create time series definition
  #The reactive timeseries variable
  timeSeriesData <- reactive({
    inFile <- input$csvInput
    if (is.null(inFile)) return(NULL)
    data <- read.csv(inFile$datapath, header = TRUE)
    data
  })
  
  
  }
)


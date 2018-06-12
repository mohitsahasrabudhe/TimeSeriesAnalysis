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
  source('serverfiles/global/var_load_libraries.R',local=TRUE)
  
  #Sourcing Global ariables
  source('serverfiles/global/var_global_variables.R',local=TRUE)
  
  #Source Session Details
  source('serverfiles/global/var_session_details.R',local=TRUE)
  
  #Source Session Details
  source('serverfiles/server1_data_load.R',local=TRUE)
  
 
  output$loadedCSVData<-renderDataTable(loadedCSVData())
  
  observeEvent(input$show, {
    showModal(popupData())
  })
  
  popupData <- function(failed = FALSE) {
    modalDialog(
      dataTableOutput("loadedCSVData")
    )
  }
 
  
  
  
  
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


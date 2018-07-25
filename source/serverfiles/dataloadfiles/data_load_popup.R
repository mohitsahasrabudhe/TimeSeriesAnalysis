

#Popup for data loader
observeEvent(input$addDataStream, {
  showModal(popupDataLoader())
  print(input$hasHeadersInput)
})

popupDataLoader <- function(failed = FALSE) {
  modalDialog(
    
    textInput(
      inputId = "dataSourceName",
      label = "Data Source Name"
    ),
    
    selectInput(
      inputId = "dataSource",
      label = "Select data source",
      choices = c("CSV Upload", "Database"),
      selected = 1
      ),
    
    conditionalPanel(
      condition = "input.dataSource=='CSV Upload'",
      fileInput("csvInput","Select the file"
                ,accept=".csv"),
      checkboxInput("hasHeadersInput",label = "File has headers")
    ),
    
    actionButton("saveDataSource","Save Data")
  )
}


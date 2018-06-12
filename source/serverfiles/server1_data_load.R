#List of data sources


#UI of item to insert
dataDetails <- function(id,nameDef) {
  shiny::fillRow(
    checkboxInput(inputId = paste0("dataSource", id), 
                  label = nameDef,
                  width = "100%")
  )
}

print(list.files(path = "savefiles"))
lapply(list.files(path = "savefiles"), function(x) {
  insertUI(
    selector = '#dataSources',
    ui = tagList(dataDetails(
      id = x,
      nameDef = x
    ),hr())
  )
})

observeEvent(
  input$saveData,
  {
    #Create a folder scheme -> User given name -> User created date -> User created time
    
    dir.create(path = paste0("savefiles//",
                             input$dataSourceName,"//"))
    dir.create(path = paste0("savefiles//",
                             input$dataSourceName,"//",
                             input$dataSourceName,"_",Sys.Date()))
    write.csv(as.data.frame(loadedCSVData()),
              file=paste0("savefiles//",
                          input$dataSourceName,"//",
                          input$dataSourceName,"_",Sys.Date(),"//",
                          input$dataSourceName,"_",format(Sys.time(),"%H-%M-%S"),".csv"
                          ),
              col.names=input$hasHeadersInput,
              sep=",")
  }
)

output$dataSources <- renderUI({
})













#Popup for data loader
observeEvent(input$addData, {
  showModal(popupDataLoader())
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
      selected = 1),
    
    conditionalPanel(
      condition = "input.dataSource=='CSV Upload'",
      
      fileInput("csvInput","Select the file"
                ,accept=".csv"),
      checkboxInput("hasHeadersInput",label = "File has headers")
    ),

    actionButton("saveData","Save Data")
  )
}


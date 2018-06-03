#List of data sources

observeEvent(
  input$saveCSV,
  {
    counter <<- counter +1
    insertUI(
      selector = '#dataSources',
      where = "beforeEnd",
      ui = renderUiElement(
        id = paste0("ui",counter),
        nameDef = "New Text"
      ),
      session = session
    )
  },
  ignoreNULL = TRUE,
  ignoreInit = TRUE
)



output$dataSources <- renderUI({
  div()
})













#Popup for data loader
observeEvent(input$addData, {
  showModal(popupDataLoader())
})

popupDataLoader <- function(failed = FALSE) {
  modalDialog(
    selectInput(
      inputId = "dataSource",
      label = "Select data source",
      choices = c("CSV Upload", "Database"),
      selected = 1),
    conditionalPanel("input.dataSource=='CSV Upload'",
                     fileInput("csvInput","Select the file"
                               ,accept=".csv"),
                     checkboxInput("hasHeadersInput",label = "File has headers"),
                     actionButton("saveCSV","Save File")
    ),
    conditionalPanel(
      "input.dataSource=='Database'",
      selectInput(
        inputId = "dbType",
        label = "Select DB Type",
        choices = c("Mongo DB","PostgreSQL"),
        selected = 2),
      textInput("dbNameInput",label="DB Name"),
      textInput("hostNameInput",label="Host Name"),
      textInput("portNameInput",label="Port Name"),
      textInput("User Name",label="User Name"),
      textInput("Password",label="Password"),
      actionButton("dataBaseConnect",label = "Connect")
    )
  )
}


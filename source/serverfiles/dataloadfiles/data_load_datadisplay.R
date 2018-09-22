
#This is the dynamic dataset that runs on input
displayCSVData <- reactive({
  if( !(is.na(input$myvalue[1]) | is.na(input$myvalue[2]) | is.na(input$myvalue[3])) )
  {
    data <- read.csv(paste0("savefiles//datasource//",input$myvalue[1],"//",input$myvalue[2],"//",input$myvalue[3]))
    return(data)
  }
  else
  {
    return(NULL)
  }
})


output$selectedDataSet<-renderDataTable(displayCSVData())







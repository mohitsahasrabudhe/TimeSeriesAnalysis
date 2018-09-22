
#This is the dynamic dataset that runs on input
displayTimeSeriesData <- reactive({
  if( !(is.na(input$myvalue1[1]) | is.na(input$myvalue1[2]) | is.na(input$myvalue1[3])) )
  {

    data <- read.csv(paste0("savefiles//timeseries//",input$myvalue1[1],"//",input$myvalue1[2],"//",input$myvalue1[3]))
    return(data)
  }
  else
  {
    return(NULL)
  }
})


output$selectedTimeSeries<-renderDataTable(displayTimeSeriesData())


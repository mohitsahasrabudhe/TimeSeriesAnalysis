#List of data sources

removeTimeSeriesRender()


#This creates the folder scheme to save date wise
observeEvent(
  input$saveTimeSeries,
  {
    #This part has to move external, so that we read only the Rdata files
    #Create a folder scheme -> User given name -> User created date -> User created time
    
    dir.create(path = paste0("savefiles//timeseries//",
                             input$timeSeriesName,"//"),showWarnings = F)
    dir.create(path = paste0("savefiles//timeseries//",
                             input$timeSeriesName,"//",
                             input$timeSeriesName,"_",Sys.Date()),showWarnings = F)
    write.csv(as.data.frame(loadedTimeSeriesData()),
              file=paste0("savefiles//timeseries//",
                          input$timeSeriesName,"//",
                          input$timeSeriesName,"_",Sys.Date(),"//",
                          input$timeSeriesName,"_",format(Sys.time(),"%H-%M-%S"),".csv"),
              col.names=input$hasTimeSeriesHeadersInput)
    
    removeTimeSeriesRender()
  }
)





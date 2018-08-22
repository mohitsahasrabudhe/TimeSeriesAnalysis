#List of data sources

removeDataStreamRender()


#This creates the folder scheme to save date wise
observeEvent(
  input$saveDataSource,
  {
    #This part has to move external, so that we read only the Rdata files
    #Create a folder scheme -> User given name -> User created date -> User created time
    
    dir.create(path = paste0("savefiles//",
                             input$dataSourceName,"//"),showWarnings = F)
    dir.create(path = paste0("savefiles//",
                             input$dataSourceName,"//",
                             input$dataSourceName,"_",Sys.Date()),showWarnings = F)
    write.csv(as.data.frame(loadedCSVData()),
              file=paste0("savefiles//",
                          input$dataSourceName,"//",
                          input$dataSourceName,"_",Sys.Date(),"//",
                          input$dataSourceName,"_",format(Sys.time(),"%H-%M-%S"),".csv"),
              col.names=input$hasHeadersInput)
    
    # read.csv(paste0("savefiles//",
    #                 input$dataSourceName,"//",
    #                 input$dataSourceName,"_",Sys.Date(),"//",
    #                 input$dataSourceName,"_",format(Sys.time(),"%H-%M-%S"),".csv"))
    # lapply(list.files(path = paste0("savefiles//",input$dataSourceName)), function(dateFile) {
    #   lapply(list.files(path = paste0("savefiles//",input$dataSourceName,"//",dateFile)), function(dateTimeFile) {
    #     read.csv(paste0("savefiles//",input$dataSourceName,"//",dateFile,"//",dateTimeFile))
    #   })
    # })
  
    removeDataStreamRender()
  }
)





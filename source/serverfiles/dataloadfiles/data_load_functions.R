#Reactive CSV, useful for loading data in data load

loadedCSVData <- reactive({
  inFile <- input$csvInput
  if (is.null(inFile)) return(NULL)
  data <- read.csv(inFile$datapath, header = input$hasCSVHeadersInput)
  return(data)
})

#Startup function to check for all files
#It runs once and list all the files

removeDataStreamRender <-function() {
  
  removeUI(selector = ".dataStream",
           immediate = TRUE,
           multiple = TRUE,
           session = session)
  
  #Recursive 4 times, for every savefile - savefile with date -savefile with datetime and the edit button
  
  output$dataStreamList<-renderMenu({
    sidebarMenu(
      
      #List files should be replaced with whatever db we are connecting to
      
      lapply(list.files(path = "savefiles//datasource//"), function(savefiles) {
        
        menuItem(text = savefiles,
                 tabName = savefiles,
                 id=paste0("dataStreamDate",savefiles),
                 
                 
                 lapply(list.files(path = paste0("savefiles//datasource//",savefiles)), function(dateFile) {
                   
                   menuItem(text=dateFile,
                            # tabName = dateFile,
                            id=paste0("dataStreamDateTime",dateFile),
                            
                            lapply(list.files(path = paste0("savefiles//datasource//",savefiles,"//",dateFile)), function(dateTimeFile) {
                              
                              menuItem(text=dateTimeFile,
                                       # tabName = dateTimeFile,
                                       id=paste0("dataStreamDate",savefiles),
                                       icon = icon("table"),
                                      menuSubItem(text = "View",icon = icon("eye"))
                              )
                            }
                            ))
                 }
                 ))
      }),
      id="dataStreamSidebarMenu"
    )
  })
}




  

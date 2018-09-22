#Reactive CSV, useful for loading data in data load

loadedTimeSeriesData <- reactive({
  inFile <- input$timeSeriesInput
  if (is.null(inFile)) return(NULL)
  data <- read.csv(inFile$datapath, header = input$hasTimeSeriesHeadersInput)
  return(data)
})

#Startup function to check for all files
#It runs once and list all the files

removeTimeSeriesRender <-function() {
  
  removeUI(selector = ".timeSeries",
           immediate = TRUE,
           multiple = TRUE,
           session = session)
  
  #Recursive 4 times, for every savefile - savefile with date -savefile with datetime and the edit button
  
  output$timeSeriesList<-renderMenu({
    sidebarMenu(
      
      #List files should be replaced with whatever db we are connecting to
      
      lapply(list.files(path = "savefiles//timeseries//"), function(savefiles) {
        
        menuItem(text = savefiles,
                 tabName = savefiles,
                 id=paste0("timeSeriesDate",savefiles),
                 
                 
                 lapply(list.files(path = paste0("savefiles//timeseries//",savefiles)), function(dateFile) {
                   
                   menuItem(text=dateFile,
                            # tabName = dateFile,
                            id=paste0("timeSeriesDateTime",dateFile),
                            
                            lapply(list.files(path = paste0("savefiles//timeseries//",savefiles,"//",dateFile)), function(dateTimeFile) {
                              
                              menuItem(text=dateTimeFile,
                                       # tabName = dateTimeFile,
                                       id=paste0("timeSeriesDate",savefiles),
                                       icon = icon("table"),
                                      menuSubItem(text = "View",icon = icon("eye"))
                              )
                            }
                            ))
                 }
                 ))
      }),
      id="timeSeriesSidebarMenu"
    )
  })
}




  

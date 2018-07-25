#Reactive CSV, useful for loading data in data load
loadedCSVData <- reactive({
  inFile <- input$csvInput
  if (is.null(inFile)) return(NULL)
  data <- read.csv(inFile$datapath, header = input$hasHeadersInput)
  return(data)
})

#startup function to check for all files
#It runs once and list all the files

removeDataStreamRender <-function() {
  
  removeUI(selector = ".dataStream",
           immediate = TRUE,
           multiple = TRUE,
           session = session)
  
  #Recursive 3 times, for every savefile - savefile with date -savefile with datetime
  
  
  output$dataStreamList<-renderMenu({
    sidebarMenu(
      lapply(list.files(path = "savefiles"), function(savefiles) {
        
        menuItem(text = savefiles,
                 tabName = savefiles,
                 id=paste0("dataStreamDate",savefiles),
                 icon = icon("download"),
                 
                 lapply(list.files(path = paste0("savefiles//",savefiles)), function(dateFile) {
                   
                   menuItem(text=dateFile,
                            # tabName = dateFile,
                            id=paste0("dataStreamDateTime",dateFile),
                            icon = icon("download"),
                            
                            lapply(list.files(path = paste0("savefiles//",savefiles,"//",dateFile)), function(dateTimeFile) {
                              
                              menuItem(text=dateTimeFile,
                                       # tabName = dateTimeFile,
                                       id=paste0("dataStreamDate",savefiles),
                                       icon = icon("download"))
                            }
                            ))
                 }
                 ))
      }),
      id="dataStreamSidebarMenu"
    )
  })
  
}



observe(
  output$selectSideBar <- renderUI({
    HTML(
      paste(
        "The selected tab/subtab is", 
        tags$h3(input$dataStreamSidebarMenu)
      )
    )
  }))

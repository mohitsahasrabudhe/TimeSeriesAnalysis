
#Static Variables

sessionId <- as.integer(runif(1, 1, 100000))


#Reactive Variables

loadedCSVData <- reactive({
  inFile <- input$csvInput
  if (is.null(inFile)) return(NULL)
  data <- read.csv(inFile$datapath, header = input$hasHeadersInput)
  data
})

rawDataSource <- reactiveValues()



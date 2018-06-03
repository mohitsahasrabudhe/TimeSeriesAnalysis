sessionId <- as.integer(runif(1, 1, 100000))

timeSeriesData <- reactive({
  inFile <- input$csvInput
  if (is.null(inFile)) return(NULL)
  data <- read.csv(inFile$datapath, header = input$hasHeadersInput)
  data
})

counter <- 0

renderUiElement <- function(id, nameDef) {
  shinydashboard::notificationItem("sometext")
  box(
    actionButton(paste0("rmBtn", id), label = "", icon = icon("times")),
    
    # text initial value supplied as a variable
    
    textInput(paste0("nameText", id), label = paste("Item", id), value = nameDef)
  )
}

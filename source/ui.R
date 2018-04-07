
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Time Series Analysis"),
  
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Data Load",
                           selectInput(inputId = "dbType",label = "Select DB Type"
                                         ,choices = c("Mongo DB","PostgreSQL"),selected = 2),
                           textInput("dbNameInput",label="DB Name"),
                           textInput("hostNameInput",label="Host Name"),
                           textInput("portNameInput",label="Port Name"),
                           actionButton("mybutton",label = "Connect")
                  ),
      tabPanel("Data Clean"),
      tabPanel("Time Series Exploratory Data Analysis"),
      tabPanel("Modeling"),
      tabPanel("Model Scoring"))
    
     
      
  ,width = "100%")
  
)
)

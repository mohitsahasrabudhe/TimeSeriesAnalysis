#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$justrandom<-insertUI({
  menuItem("Home", tabName = "home", icon = icon("home"))
  menuItem("Item with subitems", tabName = "test",
           uiOutput("test_subitems"))})
})

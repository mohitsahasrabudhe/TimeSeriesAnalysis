#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

shinyServer(function(input, output,session) 
{
  #Source Session Details
  source('serverfiles/server_session_details.R',local=TRUE)
  
  #Source Data Load
  source('serverfiles/server_data_load.R',local=TRUE)
  
}
)

  
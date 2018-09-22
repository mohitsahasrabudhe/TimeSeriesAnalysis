

shinyServer(function(input, output,session) 
{
  #Source Session Details
  source('serverfiles/server_session_details.R',local=TRUE)
  
  #Source Data Load
  source('serverfiles/server_data_load.R',local=TRUE)
  
  #Source Data Load
  source('serverfiles/server_create_timeseries.R',local=TRUE)
}
)

  
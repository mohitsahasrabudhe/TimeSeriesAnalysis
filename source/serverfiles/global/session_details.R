#Session Details
output$sessionId <- renderText(paste0("Session ID: ", sessionId))
session$onSessionEnded(function() {
  #donothing
  cat(paste0("Ended: ", sessionId))
})
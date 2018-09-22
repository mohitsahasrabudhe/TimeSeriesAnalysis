#Session Details
output$sessionId <- renderText(paste0("Session ID: ", sessionId))
session$onSessionEnded(function() {
  cat(paste0("Ended: ", sessionId))
})
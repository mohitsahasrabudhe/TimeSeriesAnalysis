#If we are copying into dropbox, and then pulling from dropbox.
#Need to think here to see how to optimize data storage


#This will load all into session? or how?

lapply(list.files(path = "savefiles"), function(savefiles) {
  
  lapply(list.files(path = paste0("savefiles//",savefiles)), function(dateFile) {
    
    lapply(list.files(path = paste0("savefiles//",savefiles,"//",dateFile)), function(dateTimeFile) {
      print(paste0("savefiles//",savefiles,"//",dateFile,"//",dateTimeFile,"",sep = ""))
    })
  })
})
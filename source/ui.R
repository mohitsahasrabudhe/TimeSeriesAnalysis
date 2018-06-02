
shinyUI(fluidPage(
  theme = 'bootstrap.css',
  textOutput("myshittycoding"),
  textOutput("sessionId"),
  actionButton("show", "Show modal dialog"),
  titlePanel("Time Series Analysis"),
  tabsetPanel(type = "tabs",
              tabPanel("Data Load",
                       sidebarPanel(
                         
                       ),
                       mainPanel(
                         selectInput(inputId = "dataSource",label = "Select data source"
                                     ,choices = c("CSV Upload", "Database"),selected = 1),
                         conditionalPanel("input.dataSource=='CSV Upload'",
                                          fileInput("csvInput","Select the file"
                                                    ,accept=".csv"),
                                          checkboxInput("hasHeadersInput",label = "File has headers")
                                          
                         ),
                         conditionalPanel("input.dataSource=='Database'",
                                          selectInput(inputId = "dbType",label = "Select DB Type"
                                                      ,choices = c("Mongo DB","PostgreSQL"),selected = 2),
                                          textInput("dbNameInput",label="DB Name"),
                                          textInput("hostNameInput",label="Host Name"),
                                          textInput("portNameInput",label="Port Name"),
                                          textInput("User Name",label="User Name"),
                                          textInput("Password",label="Password"),
                                          actionButton("dataBaseConnect",label = "Connect")
                         )
                       )
              ),
              
              
              tabPanel("Create Time Series",
                       sidebarPanel(
                         
                       ),
                       mainPanel(
                         uiOutput("dependentTSVariable"),
                         selectInput("dateVariable","Select the date variable",choices = c("a")),
                         selectInput("timeVariable","Select the time series variable", choices = c(colnames("a")))
                       )),
              
              
              
              tabPanel("Time Series Exploratory Data Analysis"),
              
              
              
              tabPanel("Modeling"),
              
              
              
              
              tabPanel("Model Scoring")
  )
  
  
)
) 



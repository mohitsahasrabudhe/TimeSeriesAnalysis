tabPanel("Create Time Series",
         dashboardPage(
           dashboardHeader(),
           dashboardSidebar(
             actionButton(inputId = "addTimeSeries",label = "Add a Time Series"),
             sidebarMenuOutput(
               "timeSeriesList"
             )
           ),
           dashboardBody(
             dataTableOutput("selectedTimeSeries")
           )
         )
)


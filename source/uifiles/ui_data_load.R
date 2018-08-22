

tabPanel("Data Load",
         dashboardPage(
           dashboardHeader(),
           dashboardSidebar(
             actionButton(inputId = "addDataStream",label = "Add a Data Stream"),
             sidebarMenuOutput(
               "dataStreamList"
             )
           ),
           dashboardBody(
             fillRow(dataTableOutput("displayDataStream"),
                     actionButton("deleteDataStream",label = "Delete")
             )
           )
         )
)
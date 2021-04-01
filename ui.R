dashboardPage(
    skin = "black",
    dashboardHeader(title="Employee Attrition "),
    dashboardSidebar(
        sidebarMenu(
            menuItem(
                text = "Personal",
                tabName = "personal",
                icon = icon("gears")
            ),
            menuItem(
                text = "Billing",
                tabName = "billing",
                icon = icon("tasks")
            ),menuItem(
                text = "Work",
                tabName = "work",
                icon = icon("cubes")
            ),menuItem(
                text = "Profile",
                tabName = "Profile",
                icon = icon("chart-area")
            ) 
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "personal",
                
                fluidRow(
                    
                    box(
                        title = "Overview",
                        width = 12,
                        
                        radioButtons(inputId = "status", 
                                     label = "Attrition status?", 
                                     choices = unique(data_attrition$attrition), 
                                     inline = TRUE),
                        
                        valueBoxOutput(
                            outputId = "job_sat", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "env_sat", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "tenure", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "income", width = 3 
                        )
                    )
                ), 
                
                fluidRow(
                  
                    box(
                        title = "Numerical Variable",
                        width = 12,
                        selectInput(
                            inputId = "pers_num",
                            label= "Please select variable",
                            choices= data_attrition %>% select_if(is.numeric) %>% colnames(),
                            selected= "age"
                            ),
                        plotlyOutput(
                            outputId = "personalNum"
                            
                        )
                        
                    ) 
                    
                )
            )
        )
    )
)
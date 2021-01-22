#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
    
    # Application title
    ui<- headerPanel("Disaster"),
    
    sidebarPanel(
        selectInput("Pilihan", "Pilihan:",
                    list(
                         "Positive/Negative Word " = "1")),
    ),
    
    mainPanel(
        h3(textOutput("caption")),
        plotOutput("plot"),
    )
))




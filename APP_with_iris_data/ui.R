##---------------------------------------------------------
## Developing data products Coursera
## Data science specialization
## Date 25.10.2015
## Author ANDCOS
## Application: Exploration of the IRIS dataset with Shiny
## Shiny Server
## R Pubs
## GitHub
##---------------------------------------------------------

library(shiny)
library(markdown)
library(shinydashboard)
# Starting line
shinyUI(
  navbarPage("Iris data exploration with Shiny!",
             ##---TAB stats
             tabPanel("Stats",
                      sidebarLayout(
                        sidebarPanel(
                        #Species selection
                          selectInput("species","Select a species:",
                                      levels(iris$Species))),
                        #The plot created in server.R is displayed
                        mainPanel(
                          #Table display
                          tableOutput("table"),
                          #Plot display
                          plotOutput("plot")
                        ),
                               
                      )),
             
             ##---TAB show data
             tabPanel("Show data",
                      dataTableOutput("show_data")),
             
            ##---TAB data explanations
            tabPanel("IRIS explained",
            titlePanel("IRIS dataset description wiki"),
            
            fluidRow(
              column(10,
                     br(),
                     pre(includeText("include.txt"))
              )))
  )  
)


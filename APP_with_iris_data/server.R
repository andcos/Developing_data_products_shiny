library(shiny)

#initialization of server.R
shinyServer(function(input, output, session) {
  
  iris.sset <- reactive({subset(iris, Species == input$species)[,-5]})
  
  #Table generation where the summary is displayed
  output$table <- renderTable({
    summary(iris.sset())
  })
  
  #Plot generation where the summary is displayed
  output$plot <- renderPlot({
    plot(iris.sset())
  })
  
  # text in the About tab
  output$show_data <- renderDataTable({
    iris
  }, options=list(pageLength=10))
  
})
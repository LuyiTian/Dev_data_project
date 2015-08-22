shinyServer(function(input, output) {
  # Combine the selected variables into a new data frame
  data(iris)
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  output$plot1 <- renderPlot({
    plot(selectedData())
  })
  
  output$click_info <- renderPrint({
    # Because it's a ggplot2, we don't need to supply xvar or yvar; if this
    # were a base graphics plot, we'd need those.
    nearPoints(selectedData(), input$plot1_click, xvar = input$xcol, yvar = input$ycol, addDist = TRUE)
  })
  
  output$brush_info <- renderPrint({
    brushedPoints(selectedData(), xvar = input$xcol, yvar = input$ycol, input$plot1_brush)
  })
})
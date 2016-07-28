library(shiny)
library(datasets)

shinyServer(function(input, output) {
    featureInput <- reactive({
        switch(input$feature,
               "Miles per gallon" = "mpg",
               "Gross horsepower" = "hp",
               "Weight (1000 lbs)" = "wt")
    })
    output$histogram <- renderPlot({
        feature <- featureInput()
        hist(mtcars[[feature]],
             col = "blue",
             xlab = input$feature,
             main = "Histogram")
    })
    output$oquantile <- renderPrint({input$quantile})
    output$ovalue <- renderPrint({
        feature <- featureInput()
        quantile(mtcars[[feature]], input$quantile)
    })
})
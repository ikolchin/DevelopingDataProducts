library(shiny)
require(markdown)

shinyUI(
    navbarPage("Explore mtcars dataset",
        tabPanel("Data",
            headerPanel("Analyze mtcars features"),
            sidebarPanel(
                selectInput("feature",
                            "Choose feature",
                            "choices" = c("Miles per gallon",
                                          "Gross horsepower",
                                          "Weight (1000 lbs)")
                ),
                sliderInput("quantile",
                            "Select sample quantile to be estimated",
                            min = 0,
                            max = 1,
                            value = 0.5)
            ),
            mainPanel(
                h3("The histogram of selected feature values"),
                plotOutput("histogram"),
                h4("Selected quantile"),
                verbatimTextOutput("oquantile"),
                h4("Estimated sample quantile value"),
                verbatimTextOutput("ovalue")
            )
        ),
        
        tabPanel("Documentation",
             mainPanel(
                 includeMarkdown("documentation.md")
             )
        )
    )
)
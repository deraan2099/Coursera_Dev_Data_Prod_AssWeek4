# Coursera - Developing Data Products Peer Graded Assignment week 4 (25/12/2016)
# server.R file for the shiny app
# Description: this app uses the mtcars dataset to allow the user to set travel information and a few vehicle preferences
# and to find the fuel-cheapest car for that journey.

library(shiny)
library(datasets)
library(dplyr)
mtcars$kmpl <- mtcars$mpg * (1.60934/3.78541)

shinyServer(function(input, output) {
    
    # Show the cars that correspond to the filters
    output$App <- renderDataTable({
        disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
        hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
        data <- transmute(mtcars, Car = rownames(mtcars), 
                          FuelExpenses = round((input$dist/kmpl)*(input$cost),digits = 2),
                          Displacement = disp, Horsepower = hp, Gears = gear ,Cylinders = cyl,
                          Transmission = am)
        data <- filter(data, 
                       Displacement %in% disp_seq, Horsepower %in% hp_seq, Gears %in% input$grs,
                       Cylinders %in% input$cyl, Transmission %in% input$am)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        data <- arrange(data, FuelExpenses)
        data
    }, options = list(lengthMenu = c(5, 10, 15), pageLength = 30))
})
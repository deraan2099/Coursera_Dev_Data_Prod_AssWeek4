# Coursera - Developing Data Products Peer Graded Assignment week 4 (25/12/2016)
# ui.R file for the shiny app
# Description: his app uses the mtcars dataset to allow the user to set travel information and a few vehicle preferences
# and to find the fuel-cheapest car for that journey.

library(markdown)

shinyUI(navbarPage("Spend less for fuel, spend more for Christmas presents!",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("Please insert the information about your trip:"),
                                    numericInput('dist', 'Distance [km]:', 25, min = 1, max = 3000),
                                    numericInput('cost', 'Fuel price [€/liter]:', 1.40, min = 1.10, max = 4, step=0.01),
                                    helpText("Please insert your preferences for the car:"),
                                    sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                    sliderInput('hp', 'Horsepower', min=50, max=340, value=c(50,340), step=10),
                                    checkboxGroupInput('grs', 'Gears:', c("Three"=3,"Four"=4, "Five"=5), selected = c(3,4,5)),
                                    checkboxGroupInput('cyl', 'Cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                    checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                                ),
                                
                                
                                mainPanel(
                                    dataTableOutput('App')
                                )
                            )
                   ),
                   tabPanel("About the app",
                            mainPanel(
                                includeMarkdown("About.Rmd")
                            )
                   )
)
)   
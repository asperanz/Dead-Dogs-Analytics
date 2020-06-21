library(shiny)
library(leaflet)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dead Dogs Live Concerts Map"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("year", 
                        label = h4("Year of concert"), 
                        c("All",
                          unique(dd_concerts$year)))),
        mainPanel(
            leafletOutput("map")
        )
    )
))

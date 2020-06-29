library(shiny)
library(leaflet)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dead Dogs Live Concerts Map"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectizeInput("year",
                           label = h4("Year of concert"),
                           choices = unique(dd_concerts$year),
                           selected = NULL,
                           multiple = TRUE)),
        mainPanel(
            leafletOutput("map")
        )
    )
))

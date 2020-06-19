library(shiny)
library(leaflet.extras)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    output$map <- renderLeaflet({
      
        leaflet(dd_concerts) %>% 
            addProviderTiles(providers$Stamen.Toner, group = "Black and white") %>% 
            addMarkers(~longitude, 
                       ~latitude,
                       popup = paste("<b>Concert:</b>", dd_concerts$concert, "<br>",
                                     "<b>Location:</b>", dd_concerts$location, "<br>",
                                     "<b>Date:</b>", dd_concerts$date,
                                     dd_concerts$playlist),
                       clusterOptions = markerClusterOptions()) %>% 
            addHeatmap(
                lng = ~longitude, 
                lat = ~latitude,
                radius = 17,
                blur = 25,
                cellSize = 25)
    })
})

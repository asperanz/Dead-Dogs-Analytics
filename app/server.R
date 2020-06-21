library(shiny)
library(leaflet.extras)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # new column for the popup label    
  dd_concerts <- dd_concerts %>% 
    mutate(popupcontent = paste("<b>Concert:</b>", concert, "<br>",
                                "<b>Location:</b>", location, "<br>",
                                "<b>Date:</b>", dd_concerts$date,
                                playlist))
  
  filteredData <- reactive({
    if (input$year == "All") {
      dd_concerts
    } else {
      dd_concerts %>% 
      filter(year == input$year)
    }
  })
  
    output$map <- renderLeaflet({
      
        leaflet(filteredData()) %>% 
            addProviderTiles(providers$Stamen.Toner, group = "Black and white") %>% 
            addMarkers(~longitude, 
                       ~latitude,
                       popup = ~popupcontent,
                       clusterOptions = markerClusterOptions()) %>% 
        addHeatmap(
          lng = ~longitude, 
          lat = ~latitude,
          radius = 17,
          blur = 25,
          cellSize = 25) %>%
        addMiniMap(tiles = providers$Esri.WorldStreetMap,
                   minimized = FALSE,
                   position = "bottomright")
      
    })
    
    
    observe({
      
      leafletProxy("map", data = filteredData()) %>%
        clearMarkers() %>%
        addMarkers(~longitude, 
                   ~latitude,
                   popup = ~popupcontent,
                   clusterOptions = markerClusterOptions()) %>% 
        addHeatmap(
          lng = ~longitude, 
          lat = ~latitude,
          radius = 17,
          blur = 25,
          cellSize = 25) %>% 
        addMiniMap(tiles = providers$Esri.WorldStreetMap,
                   minimized = FALSE,
                   position = "bottomright")
      
    })
})

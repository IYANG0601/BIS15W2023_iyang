library(tidyverse)
library(shiny)
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
ui <- fluidPage(titlePanel("Taxon HRA"),
                radioButtons("x", "Select Taxon", choices=c("birds", "lake fishes", "lizards", "mammals", "marine fishes", "river fishes", "snaks", "tortoises", "turtles"), selected="birds"),
                plotOutput("plot", width="600px", height="500px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    homerange %>% 
      filter(taxon == input$x) %>% 
      ggplot(aes_string(x="log10.hra")) +
      geom_density()
  })
  
}

shinyApp(ui, server)


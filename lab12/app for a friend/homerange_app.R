library(tidyverse)
library(shiny)
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
ui <- fluidPage(
  selectInput("x", "Select Fill Variable", choices = c("trophic.guild", "thermoregulation"), 
              selected = "trophic.guild"),
  plotOutput("plot",width = "500px", height = "400px")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(data=homerange, aes_string(x= "locomotion", fill = input$x))+geom_bar(position = "dodge")+
      labs(title = "Penguins Graph",
           x= "Locomotion")
  })
  
}

shinyApp(ui, server)
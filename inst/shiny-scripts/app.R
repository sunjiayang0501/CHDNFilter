library(shiny)
library(shinyalert)

ui <- fluidPage(
  "Hello, world!"
)
server <- function(input, output, session) {
}

shinyApp(ui, server)

library(shiny)
library(bslib)

library(glue)

# Define UI ----
ui <- page_sidebar(
  title = "censusVis",
  
  sidebar = sidebar(
    h1("Selections"),
    "Create demographic maps with information from the 2010 US Census.",
    selectInput(
      inputId = "display_var",
      label = "Variable to display:",
      choices = list(
        "Percent White",
        "Percent Black",
        "Percent Hispanic",
        "Percent Asian")
    ),
    
    sliderInput(
      inputId = "range",
      label = "Range of interest:",
      min = 0,
      max = 100,
      value = c(0, 100)
    )
    
  ),
  h1("Main contents"),
  
  card(
    card_header("Results"),
    textOutput("selected_var"),
    textOutput("selected_range")
  )
)

# Define server logic ----
server <- function(input, output) {
  output$selected_var <- renderText({
    glue("You have selected ", {input$display_var}, ".")
  })
  
  output$selected_range <- renderText({
    glue("You have selected a range that goes from ", {input$range[1]}, " to ", {input$range[2]}, ".")
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
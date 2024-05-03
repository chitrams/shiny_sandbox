library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "Welcome to Shiny",
  sidebar = sidebar(h1("Sidebar"),
                    "Shiny is available on CRAN so you can install it like so:",
                    code('install.packages("shiny")')),
  h1("Main contents"),
  value_box(
    title = "Value box",
    value = 100,
    showcase = bsicons::bs_icon("check-circle"),
    theme = "teal"
  ),
  card(
   card_header("Introducing Shiny"),
   "Shiny is a package from Posit that makes it incredibly easy 
   to build interactive web applications with R.
    For an introduction and live examples, 
   visit the Shiny [homepage](https://shiny.posit.co).",
   card_footer("Shiny is a product of Posit.")
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
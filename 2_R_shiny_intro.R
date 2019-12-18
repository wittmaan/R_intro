
# *******************************************************************
#  Short introduction to R shiny
#  Andreas Wittmann
# *******************************************************************



















# Welcome to shiny

# - Shiny is an R package that makes it easy to build interactive web applications (apps) straight from R. 

#install.packages("shiny")


library(shiny)

ui <- fluidPage(
  # app title
  titlePanel("Hello Shiny!"),
  
  # sidebar layout with input and output
  sidebarLayout(
    # sidebar
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # main 
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)


server <- function(input, output) {
  
  # 1. function is reactive is therefore automatically reexecuted, when input changes
  # 2. output type is a plot
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col="lightblue")
  })
}

shinyApp(ui, server)



















# Build a user interface

## html content

# shiny function	HTML5 equivalent	creates
# p	              <p>	A paragraph of text
# h1	            <h1>	A first level header
# h2	            <h2>	A second level header
# h3	            <h3>	A third level header
# h4	            <h4>	A fourth level header
# h5	            <h5>	A fifth level header
# h6	            <h6>	A sixth level header
# a	              <a>	A hyper link
# br	            <br>	A line break (e.g. a blank line)
# div	            <div>	A division of text with a uniform style
# span	          <span>	An in-line division of text with a uniform style
# pre	            <pre>	Text ‘as is’ in a fixed width font
# code	          <code>	A formatted block of code
# img	            <img>	An image
# strong	        <strong>	Bold text
# em	            <em>	Italicized text
# HTML	 	        Directly passes a character string as HTML code


ui <- fluidPage(
  titlePanel("title panel"),
  
  sidebarLayout(position = "right",
                sidebarPanel("sidebar panel"),
                mainPanel( 
                  h1("First level title"),
                           h2("Second level title"),
                           h3("Third level title"),
                           h4("Fourth level title"),
                           h5("Fifth level title"),
                           h6("Sixth level title")
                  )
  )
)

server <- function(input, output) {
}

shinyApp(ui, server)



ui <- fluidPage(
  titlePanel("My Star Wars App"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h6("Episode IV", align = "center"),
      h6("A NEW HOPE", align = "center"),
      h5("It is a period of civil war.", align = "center"),
      h4("Rebel spaceships, striking", align = "center"),
      h3("from a hidden base, have won", align = "center"),
      h2("their first victory against the", align = "center"),
      h1("evil Galactic Empire.")
    )
  )
)

shinyApp(ui, server)


## formatted text

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      p("p creates a paragraph of text."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
      strong("strong() makes bold text."),
      em("em() creates italicized (i.e, emphasized) text."),
      br(),
      code("code displays your text similar to computer code"),
      div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
      br(),
      p("span does the same thing as div, but it works with",
        span("groups of words", style = "color:blue"),
        "that appear inside a paragraph.")
    )
  )
)

shinyApp(ui, server)



















# Basic widgets

# The standard Shiny widgets are:
#   
# function	          widget
# actionButton	      Action Button
# checkboxGroupInput	A group of check boxes
# checkboxInput	      A single check box
# dateInput	          A calendar to aid date selection
# dateRangeInput	    A pair of calendars for selecting a date range
# fileInput	          A file upload control wizard
# helpText	          Help text that can be added to an input form
# numericInput	      A field to enter numbers
# radioButtons	      A set of radio buttons
# selectInput	        A box with choices to select from
# sliderInput	        A slider bar
# submitButton	      A submit button
# textInput	          A field to enter text

ui <- fluidPage(
  titlePanel("Basic widgets"),
  
  fluidRow(
    
    column(3,
           h3("Buttons"),
           actionButton("action", "Action"),
           br(),
           br(), 
           submitButton("Submit")),
    
    column(3,
           h3("Single checkbox"),
           checkboxInput("checkbox", "Choice A", value = TRUE)),
    
    column(3, 
           checkboxGroupInput("checkGroup", 
                              h3("Checkbox group"), 
                              choices = list("Choice 1" = 1, 
                                             "Choice 2" = 2, 
                                             "Choice 3" = 3),
                              selected = 1)),
    
    column(3, 
           dateInput("date", 
                     h3("Date input"), 
                     value = "2014-01-01"))   
  ),
  
  fluidRow(
    
    column(3,
           dateRangeInput("dates", h3("Date range"))),
    
    column(3,
           fileInput("file", h3("File input"))),
    
    column(3, 
           h3("Help text"),
           helpText("Note: help text isn't a true widget,", 
                    "but it provides an easy way to add text to",
                    "accompany other widgets.")),
    
    column(3, 
           numericInput("num", 
                        h3("Numeric input"), 
                        value = 1))   
  ),
  
  fluidRow(
    
    column(3,
           radioButtons("radio", h3("Radio buttons"),
                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                       "Choice 3" = 3),selected = 1)),
    
    column(3,
           selectInput("select", h3("Select box"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      "Choice 3" = 3), selected = 1)),
    
    column(3, 
           sliderInput("slider1", h3("Sliders"),
                       min = 0, max = 100, value = 50),
           sliderInput("slider2", "",
                       min = 0, max = 100, value = c(25, 75))
    ),
    
    column(3, 
           textInput("text", h3("Text input"), 
                     value = "Enter text..."))   
  )
)

shinyApp(ui, server)



















# Display reactive input

## Step 1: Add an R object to the UI

# - Shiny provides a family of functions that turn R objects into output for your user interface. Each function creates a specific type of output.

# Output function	    Creates
# dataTableOutput	    DataTable
# htmlOutput	        raw HTML
# imageOutput	        image
# plotOutput	        plot
# tableOutput	        table
# textOutput	        text
# uiOutput	          raw HTML
# verbatimTextOutput  text

ui <- fluidPage(
  titlePanel("Test input"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "var",
                  label = "Choose a variable to display",
                  choices = c("red", "blue", "green", "yellow"),
                  selected = "red"),
      
      sliderInput(inputId = "range",
                  label = "value",
                  min = 0, max = 100, value = c(0,100))
    ),
    
    mainPanel(textOutput("selected_var"), textOutput("selected_range"))
  )
)

server <- function(input, output) {
  output$selected_var <- renderText({
    paste("You have selected", input$var)
  })
  
  output$selected_range <- renderText({
    paste("and range from", input$range[1], "to", input$range[2])
  })
}

shinyApp(ui, server)



















# Use R scripts and data

library(maps)
library(mapproj)
source("helpers.R")

counties <- readRDS("counties.rds")

# User interface ----
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(plotOutput("map"))
  )
)

# Server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$var, 
                    "Percent White" = "darkgreen",
                    "Percent Black" = "black",
                    "Percent Hispanic" = "darkorange",
                    "Percent Asian" = "darkviolet")
    
    legend <- switch(input$var, 
                     "Percent White" = "% White",
                     "Percent Black" = "% Black",
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian")
    
    percent_map(data, color, legend, input$range[1], input$range[2])
  })
}

# Run app ----
shinyApp(ui, server)



















# literature

# - https://shiny.rstudio.com/tutorial/

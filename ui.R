library(shiny)

shinyUI(fluidPage(
  titlePanel("Image Recognition and Retrieval"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1","Upload Image"),
      helpText("Default max. file size is 5MB"),
      selectInput("algorithm", "SELECT THE ALGORITHM", c("Random Forest", "SVM"))
    ),
    mainPanel(
      htmlOutput('myImage')
    )
    
  )
))
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Coronary heart disease"),
  sidebarPanel(
    sliderInput('age', 'Age',value = 40, min = 15, max = 64, step = 1),
    sliderInput('ldl', 'Low density lipoprotein cholesterol',value = 5, min = 1, max = 15, step = 1),
    sliderInput('alcohol', 'Current alcohol consumption',value = 50, min = 0, max = 150, step = 1),   
    sliderInput('tobacco', 'Cumulative tobacco kg',value = 10, min = 0, max = 30, step = 1)
#    actionButton("submit", strong("Submit"))

  ),

  mainPanel(
    h2('Your input:'),
    verbatimTextOutput("oid1"),
    h2('Your risk for developing coronary heart disease is'),
    verbatimTextOutput("oid2"),
    h4(''),    
    h4('Note: please select your age, ldl level, alcohol and tobacco consumption history in the left panel.'),
    h4('It might take a few minute to build the regression model, please be patient!')
  )
  
))
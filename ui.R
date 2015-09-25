library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Body Mass Index (BMI) calculator"),
    sidebarPanel(
        numericInput('weight', 'Body weight (lbs)', 0), 
        p(strong('Height (feet, inches): ')), 
        numericInput('heightfeet', 'feet', 0), 
        numericInput('heightinch', 'inches', 0), 
        submitButton(strong('Compute BMI'))
    ),
    mainPanel(
        h4('BMI is a measure of body fat based on height and weight that applies to adult men and women.'), 
        h4('Instructions: '), 
        p('1. Enter your weight and height using standard measures.'),
        p('2. Click "Compute BMI" button. Your BMI and Category will appear below.'), 
        h4('Calculated BMI and Category: '), 
        verbatimTextOutput("bmictg")
    )
))
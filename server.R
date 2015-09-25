library(shiny)

calcBMI <- function(weight, htft, htinch) {
    if (weight == 0 || (htft == 0 && htinch == 0)) bmi <- 0
    else {
        heightInches <- (htft * 12) + htinch 
        bmi <- (weight * 703) / (heightInches ^ 2)
    }
    
    bmi <- round(bmi, 2)
    
    if (bmi < 18.5) ctgText <- "Underweight" 
    else if (bmi >= 18.5 && bmi <= 24.9) ctgText <- "Normal" 
    else if (bmi >= 25 && bmi <= 29.9) ctgText <- "Overweight" 
    else if (bmi >= 30) ctgText <- "Obese"
    
    outText <- paste(as.character(bmi), ctgText)
    
    outText
}

shinyServer(
    function(input, output) {
        output$bmictg <- renderPrint({calcBMI(input$weight, input$heightfeet, input$heightinch)})
    }
)
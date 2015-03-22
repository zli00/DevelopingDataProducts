library(shiny)
library(e1071)
library(shinyapps)
library(caret)
library(ElemStatLearn)
library(randomForest)
data(SAheart)
set.seed(8484)
train = as.data.frame(subset(SAheart, select= c("tobacco",  "ldl", "alcohol", "age", "chd")))
train$chd<-factor(train$chd)
mod<-train(chd~., train, model="glm")

shinyServer(
  
  function(input, output) {

    userInput <- reactive({
      data.frame(tobacco=input$tobacco,ldl=input$ldl,alcohol=input$alcohol, age=input$age, chd=0)                      
    })

    output$oid1 <- renderPrint(userInput()[1, 1:4])

    pred<-reactive({
      predict(mod, userInput())
    })

    risk<-reactive({
      if (pred()==1) {
        "High"
      }
      else if (pred()==0) {
        "Low"
      }
    })
    
    output$oid2 <- renderPrint(cat(risk()))
    
    }
)
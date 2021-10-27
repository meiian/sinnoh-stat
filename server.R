#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(fmsb)

pokemon.data <- read.table("Pokemon.csv",header=TRUE,sep=",")
pokemon.data <- subset(pokemon.data, select=c("number", "name", "type1", "type2", "hp", "attack", "defense", "sp_attack", "sp_defense", "speed"))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$radar <- renderPlot({
    render.data <- pokemon.data[pokemon.data$name==input$pokemonInput,]
    render.data <- subset(render.data, select=c("hp", "attack", "defense", "speed", "sp_defense", "sp_attack"))
    render.data <- rbind(rep(200,100) , rep(0,100) , render.data)
    radarchart(render.data, axistype=1 , 
               
               #custom polygon
               pcol=rgb(0.9,0.5,0.5,0.9) , pfcol=rgb(0.9,0.5,0.5,0.5) , plwd=4 , 
               
               #custom the grid
               cglcol="grey", cglty=1, axislabcol="black", caxislabels=c(0, 50, 100, 150, 200), cglwd=0.8,
               
               #custom labels
               vlcex=0.8,
               title= paste(input$pokemonInput, "stats"),
               vlabels=c("HP", "Attaque", "Défense", "Vitesse", "Défense Sp.", "Attaque Sp.")
    )
    
  })
})

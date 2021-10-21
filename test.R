library(fmsb)


pokemon.data <- read.table("Pokemon.csv",header=TRUE,sep=",")
pokemon.data <- subset(pokemon.data, select=c("number", "name", "type1", "type2", "hp", "attack", "defense", "sp_attack", "sp_defense", "speed"))
cbind(name = pokemon.data['name'], pokemon.data['number'])
list(number=pokemon.data["number"], name=pokemon.data["name"])
l <- list(number=pokemon.data["number"], name=pokemon.data["name"])
l$name
exemple = c(pokemon.data["number"] = pokemon.data["name"])
exemple
exemple["name"]["Turtwig"]
l$turtwig
l = setNames(pokemon.data["number"], pokemon.data["name"])
l
apply(pokemon.data, 1, cbind(pokemon.data["number"], pokemon.data["name"]))
as.integer(pokemon.data[pokemon.data$name=="Turtwig",]["number"])

pokemon.data
turtwig.data <- pokemon.data[pokemon.data$name=="Turtwig",]
turtwig.data <- subset(turtwig.data, select=c("hp", "attack", "defense", "sp_attack", "sp_defense", "speed"))
turtwig.data <- rbind(rep(200,100) , rep(0,100) , turtwig.data)
radarchart(turtwig.data, axistype=1 , 
           
           #custom polygon
           pcol=rgb(0.9,0.5,0.5,0.9) , pfcol=rgb(0.9,0.5,0.5,0.5) , plwd=4 , 
           
           #custom the grid
           cglcol="grey", cglty=1, axislabcol="black", caxislabels=c(0, 50, 100, 150, 200), cglwd=0.8,
           
           #custom labels
           vlcex=0.8,
           title= "Turtwig stats",
           vlabels=c("HP", "Attaque", "Défense", "Attaque Sp.", "Défense Sp.", "Vitesse")
)

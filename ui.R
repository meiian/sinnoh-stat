#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

pokemon.data <- read.table("Pokemon.csv",header=TRUE,sep=",")
pokemon.data <- subset(pokemon.data, select=c("number", "name", "type1", "type2", "hp", "attack", "defense", "sp_attack", "sp_defense", "speed"))

# Define UI for application that draws a histogram
navbarPage("Sinnoh et ses Pokémon",
           # ACCUEIL
           tabPanel("Accueil",
                    sidebarLayout(
                      sidebarPanel(
                        img(src='/images/sinnoh.png', align = "right", width="250")
                      ),
                      mainPanel(
                        h1("Bienvenue dans la région de Sinnoh !"),
                        tags$br(),
                        tags$div(
                          tags$p("De nombreux", tags$i(tags$b("Pokémon")), "vivent dans cette région."),
                          tags$p("Notre mission est d'en savoir le plus possible sur eux, pour cela
                                 nous avons répertorié des données sur chacun d'entre eux.")
                          
                        ),
                        tags$ul(
                          tags$li("Nombre de Pokémon étudiés : 107 (121 avec les différentes formes comprises)"),
                          tags$li("Nombre de variables : 7 quantitatives et 4 qualitatives",
                                  tags$ul(
                                    tags$li("Numéro du Pokémon dans le Pokédex"),
                                    tags$li("Nom du Pokémon"),
                                    tags$li("Type 1 du Pokémon"),
                                    tags$li("Type 2 du Pokémon"),
                                    tags$li("Total des statistiques du Pokémon"),
                                    tags$li("Nombre de PV (Points de Vie) du Pokémon"),
                                    tags$li("Attaque du Pokémon"),
                                    tags$li("Défense du Pokémon"),
                                    tags$li("Attaque Spéciale du Pokémon"),
                                    tags$li("Défense Spéciale du Pokémon"),
                                    tags$li("Vitesse du Pokémon")
                                  )
                                  
                          )
                        ),
                        tags$br(),
                        tags$div(
                          tags$p(tags$b("Sources :")),
                          tags$p(tags$a("@data-society : Pokemon With Stats", href="https://data.world/data-society/pokemon-with-stats")),
                          tags$p(tags$a("PokéAPI", href="https://pokeapi.co"))
                        ),
                        tags$table(
                          tags$tr(
                            tags$td(img(src='/images/Ouisticram.png', align = "left", height="250")),
                            tags$td(img(src='/images/Tortipouss.png', align = "left", height="250")),
                            tags$td(img(src='/images/Tiplouf.png', align = "left", height="250")),
                          )
                        )
                      ),
                      position= "right"
                    )
           ),
           
           tabPanel("Variable",
                    sidebarLayout(
                      sidebarPanel(
                        selectInput('zcol', 'Variable', names(pokemon.data)[-5]),
                      ),
                      mainPanel(
                      )
                    )
           ),
           
           tabPanel("Pokemon",
                    sidebarLayout(
                      sidebarPanel(
                        selectizeInput(inputId='pokemonInput', label='Pokemon :', choices= pokemon.data["name"],
                                       options = list(
                                         valueField = "name",
                                         labelField = "name",
                                         searchField = "name",
                                         optgroups = "name",
                                         options = list(),
                                         create = FALSE,
                                         render = I(
                                           "{
                                            option: function(item, escape) {
                                            console.log(item)
                                            return '<div><img src=\"images/' + escape(item.name) + '.png\" width = 20 />' + escape(item.name) + '</div>'
                                            }
                                            }")
                                          )
                                       ),
                      ),
                      mainPanel(
                      )
                    )
           )
)


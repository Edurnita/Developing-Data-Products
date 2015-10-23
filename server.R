###################################################
################### WINE EXAMPLE ##################
###################################################

# STEP 1: PREPARING DATA
library(HDclassif)
library(cluster);library(fpc)
library(permute);library(lattice);library(vegan)
library(shiny)
data(wine)
df <- scale(wine[-1]) # Wine data

# STEP 2: Define server logic required to draw a cluster plot
shinyServer(function(input, output) {

  
  # Return the requested number of clusters
  output$distPlot <- renderPlot({
    nclust <- seq(2, 5, length.out = input$nclust + 1)
    nclust <- input$nclust
    c <- kmeans(df, nclust)
    cmd <- cmdscale(dist(df)) # Multidimensional scaling
    groups <- levels(factor(c$cluster))
   ordiplot(cmd)
   for(i in seq_along(groups)){
     points(cmd[factor(c$cluster) == groups[i], ], col= i, pch = 16)
     
   }
   ordispider(cmd, factor(c$cluster), label = TRUE)
   ordihull(cmd, factor(c$cluster), lty = "dotted")
  })
})

###################################################
################### WINE EXAMPLE ##################
###################################################

# STEP 1: PREPARING DATA
library(rattle)
library(cluster)
library(fpc)
library(permute);library(lattice);library(vegan)
library(shiny)

data(wine)


# Define server logic required to draw a cluster plot
shinyServer(function(input, output) {
  
  # Expression that generates a cluster plot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    df <- scale(data(wine)[-1]) # Wine data
    nclust <- c(2:5)
   
    c <- kmeans(df,centers = nclust)
    data3_dist <- dist(df) # distance matrix
    cmd <- cmdscale(dist(df)) # Multidimensional scaling
    
    # draw the histogram with the specified number of bins
    groups <- levels(factor(c$cluster))
    ordiplot(cmd, type = "n")
    cols <- c("steelblue", "darkred", "darkgreen")
    for(i in seq_along(groups)){
      points(cmd[factor(c$cluster) == groups[i], ], col = cols[i], pch = 16)
    }
    # add spider and hull
    ordispider(cmd, factor(c$cluster), label = TRUE)
    ordihull(cmd, factor(c$cluster), lty = "dotted")
  })
})



# From wine dataset:



# STEP 2: EXPLORATION

# PASO 3: CLUSTER -KMEANS-

# plot MDS, with colors by groups from kmeans






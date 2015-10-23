

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wine clustering example"),
  br(),
  # Sidebar with a slider input for the number of cluster
  sidebarLayout(
    sidebarPanel(
      sliderInput("nclust", "Choose the number of clusters:", 
                  min = 2, max = 6, value = 3)
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),      
      h3(p(strong("Description"))),
      h4(p("A dataset containing 13 chemical measurements on 178 Italian wine samples 
        is analyzed. For that, a", strong("K-means cluster"), "analysis of the data is performed. 
        The number of clusters is determined by", strong("user."), "Since K-means cluster analysis 
        starts with k randomly chosen centroids, a different solution can be obtained each time the 
        function is invoked. Indeed, the variables vary in range, so they are", strong("standardized"), 
        "prior to clustering.")),
      h3(p(strong("Procedure"))),
      h4(p("I have read this page",a("http://www.r-statistics.com/2013/08/k-means-clustering-from-r-in-action/"), 
           "for ilustrating my example. Also I have used the following pages for building", 
           strong("my shiny app."), a("http://shiny.rstudio.com/tutorial/lesson2/")))
    )
  )
))

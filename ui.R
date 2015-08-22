shinyUI(fluidPage(
  headerPanel('Iris data plotting and point selection'),
  sidebarLayout(
      selectInput('xcol', 'X Variable - select column for x axis', names(iris)),
      selectInput('ycol', 'Y Variable - select column for y axis', names(iris),
                  selected=names(iris)[[2]])
    ),
  fluidRow(
    column(width = 4,
           plotOutput("plot1", height = 300,
                      # Equivalent to: click = clickOpts(id = "plot_click")
                      click = "plot1_click",
                      brush = brushOpts(
                        id = "plot1_brush"
                      )
           )
    )
  ),
  fluidRow(
    column(width = 6,
           h4("Points near click - click on the plot and see nearest points"),
           verbatimTextOutput("click_info")
    ),
    column(width = 6,
           h4("Brushed points - select an area on the plot and see points within the area"),
           verbatimTextOutput("brush_info")
    )
  )
))
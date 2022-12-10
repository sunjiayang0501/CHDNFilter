# This example is adapted from
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/

library(shiny)
library(shinyalert)

# Define UI
ui <- fluidPage(

  # Change title
  titlePanel("CHDNFilter"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("An R package for identifying heterozygous mutations and homozygous
             mutations from Whole exome sequencing (WES) and whole genome sequencing (WGS) data."),
      # br() element to introduce extra vertical spacing ----
      br(),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      # input
      tags$p("Instructions: Below, enter or select filess required to perform the analysis. Default
             files are shown. Then press 'Run'. Navigate through
             the different tabs to the right to explore the results."),

      # br() element to introduce extra vertical spacing ----
      br(),

      # input
      shinyalert::useShinyalert(force = TRUE),  # Set up shinyalert
      uiOutput("tab2"),
      actionButton(inputId = "data1",
                   label = "Dataset 1 Details"),
      uiOutput("tab1"),
      actionButton(inputId = "data2",
                   label = "Dataset 2 Details"),
      fileInput(inputId = "file1",
                label = "Select a VCF file to visualize. File should be in .vcf format.",
                accept = c(".vcf")),

      # br() element to introduce extra vertical spacing ----
      br(),

      # actionButton
      actionButton(inputId = "button2",
                   label = "Run"),

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot of VCF File",
                           h3("Instructions: Enter values and click 'Run' at the bottom left side."),
                           h3("Plot Analysis of Selected VCF file:"),
                           br(),
                           plotOutput("RNAseqPlot")),
                  tabPanel("Summary of Heterozygous Mutations in The File",
                           h3("Instructions: Enter values and click 'Run' at the bottom left side."),
                           h3("Heterozygous Mutations:"),
                           br(),
                           h4("Bayesian information criterion (BIC)"),
                           verbatimTextOutput("textOutBIC"),
                           h4("Integrated Complete Likelihood (ICL)"),
                           verbatimTextOutput("textOutICL"),
                           h4("Akaike Information Criterion (AIC)"),
                           verbatimTextOutput("textOutAIC")),
                  tabPanel("Summary of Homozygous Mutations in The File",
                           h3("Instructions: Enter values and click 'Run' at the bottom left side."),
                           h3("Homozygous Mutations:"),
                           br(),
                           br(),
                           plotOutput("OuputPlot"))
      )

    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {

  # Save input vcf as a reactive
  vcfInput <- eventReactive(eventExpr = input$button2, {
    if (! is.null(input$file1))
      vcffile <- vcfR::read.vcfR(infValues =  startanalysis())
    vcfsample <- CHDNFilter::readVCF()
  })

  # Analyze mutation information

  # Plotting VCF file
  output$OuputPlot <- renderPlot({
    if (! is.null(startanalysis))
      vcffile <- vcfR::read.vcfR(infValues =  startanalysis())
    CHDNFilter::vcfPlotter(vcffile)
  })


  # Plotting RNAseq dataset
  output$RNAseqPlot <- renderPlot({
    if (! is.null(startanalysis)) {
      pairs(log(matrixInput() + 0.1))
    }
  })


  # URLs for downloading data
  url1 <- a("individual2", href="https://github.com/sunjiayang0501/CHDNFilter/blob/master/inst/extdata/individual2.vcf")
  output$tab1 <- renderUI({
    tagList("Download:", url1)
  })

  observeEvent(input$data2, {
    # Show a modal when the button is pressed
    shinyalert(title = "individual2",
               text = "A sample VCF file for individual2. ",
               type = "info")
  })

  url2 <- a("individual1", href="https://github.com/sunjiayang0501/CHDNFilter/raw/master/inst/extdata/individual1.vcf")
  output$tab2 <- renderUI({
    tagList("Download:", url2)
  })

  observeEvent(input$data1, {
    # Show a modal when the button is pressed
    shinyalert(title = "individual1",
               text = "A sample VCF file for individual1.",
               type = "info")
  })


}

# Create Shiny app ----
shiny::shinyApp(ui, server)

# [END]


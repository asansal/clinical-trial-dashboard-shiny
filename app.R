# app.R
# Clinical Trial Dashboard - Modularized & Styled
# Author: [Tu Nombre Completo]
# Date: 2026-01-20
# Description: R Shiny dashboard for clinical data visualization. 
#              Built implementing reactive graph optimization, CSS styling, and modular architecture.
#              Developed using an AI-assisted learning workflow (LLM-augmented coding).

library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)

# Load Module
source("mod_scatter.R")

# Global Data
raw_data <- read.csv("clinical_data.csv", stringsAsFactors = FALSE)

ui <- dashboardPage(
  dashboardHeader(title = "PharmaCorp DS"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Raw Data", tabName = "data", icon = icon("table"))
    ),
    hr(),
    selectInput("treatment_selector", "Treatment:",
                choices = c("All", unique(raw_data$Treatment))),
    selectInput("gender_selector", "Gender:",
                choices = c("All", unique(raw_data$Gender))),
    actionButton("reset_btn", "Reset Filters", icon = icon("refresh"))
  ),
  
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                column(width = 12,
                       div(class = "urgent-box",
                           h4(icon("warning"), "Confidential Interim Analysis"),
                           p("Data freeze date: 2025-01-20. Do not distribute externally.")
                       )
                )
              ),
              br(), # Break line
              
              # KPIs
              fluidRow(
                valueBoxOutput("kpi_patient_count", width = 6),
                valueBoxOutput("kpi_avg_biomarker", width = 6)
              ),
              
              # Plots
              fluidRow(
                box(title = "Biomarker Response", width = 6, status = "primary",
                    plotlyOutput("boxplot_biomarker", height = "300px")),
                
                # Module Call
                box(title = "Age Analysis (Module)", width = 6, status = "primary",
                    scatterPlotUI(id = "analysis1") 
                )
              )
      ),
      
      tabItem(tabName = "data",
              tableOutput("clinical_table")
      )
    )
  )
)

server <- function(input, output, session) {

  dataset_filtered <- reactive({
    d <- raw_data
    if (input$treatment_selector != "All") d <- filter(d, Treatment == input$treatment_selector)
    if (input$gender_selector != "All") d <- filter(d, Gender == input$gender_selector)
    return(d)
  })
  
  scatterPlotServer(id = "analysis1", data_input = dataset_filtered)
  
  observeEvent(input$reset_btn, {
    updateSelectInput(session, "treatment_selector", selected = "All")
    updateSelectInput(session, "gender_selector", selected = "All")
  })
  
  output$kpi_patient_count <- renderValueBox({
    data <- dataset_filtered() 
    count <- nrow(data)
    valueBox(count, "Patients", icon = icon("users"), color = "teal")
  })
  
  output$kpi_avg_biomarker <- renderValueBox({
    data <- dataset_filtered()
    avg <- round(mean(data$Biomarker_FollowUp, na.rm=TRUE), 1)
    valueBox(avg, "Avg Follow-up", icon = icon("flask"), color = "purple")
  })
  
  output$boxplot_biomarker <- renderPlotly({
    data <- dataset_filtered()
    p <- ggplot(data, aes(x = Treatment, y = Biomarker_FollowUp, fill = Status)) +
      geom_boxplot() + theme_minimal() +
      scale_fill_manual(values = c("Non-Responded" = "#E74C3C", "Responded" = "#119900")) # Custom colors
    ggplotly(p)
  })
  
  output$clinical_table <- renderTable({ head(dataset_filtered(), 20) })
}

shinyApp(ui, server)
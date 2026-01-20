# mod_scatter.R
# Chapter 6: Shiny Module for Scatter Plot
# Author: Gemini (User Partner)

# --- MODULE UI ---
# Function that generates the HTML/UI for this specific component
# id: A unique string to identify this instance of the module
scatterPlotUI <- function(id) {
  
  # ns (Namespace) creates a unique ID environment
  # If id is "scatter1", ns("plot") becomes "scatter1-plot" automatically.
  ns <- NS(id)
  
  tagList(
    # We wrap the plot in a tagList to return multiple elements if needed
    plotlyOutput(outputId = ns("scatter_plot"), height = "300px")
  )
}

# --- MODULE SERVER ---
# Function that handles the logic
# id: Must match the UI id
# data_input: The reactive dataframe passed from the main app
scatterPlotServer <- function(id, data_input) {
  moduleServer(id, function(input, output, session) {
    
    # We render the plot INSIDE the module
    output$scatter_plot <- renderPlotly({
      
      # We access the reactive data passed from the main app
      # Note: data_input is a reactive expression, so we call it with ()
      df <- data_input()
      
      # Validation: Ensure we have data before plotting to avoid red errors
      validate(
        need(nrow(df) > 0, "No data available for these filters.")
      )
      
      # YOUR IMPROVED CODE
      q <- ggplot(df, aes(x = Age, y = Biomarker_Baseline, color = Gender)) +
        geom_point(alpha = 0.6) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(title = "Baseline Biomarker vs Age",
             y = "Biomarker Level (mg/dL)",
             x = "Age (years)") +
        theme_minimal() +
        # Fixed colors as you suggested
        scale_color_manual(values = c("Male" = "#3498DB", "Female" = "#FF69B4"))
      
      # Render plotly
      ggplotly(q, tooltip = c("x", "y", "color")) 
    })
    
  })
}
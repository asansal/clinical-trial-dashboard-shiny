# Clinical Trial Dashboard 📊

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Shiny](https://img.shields.io/badge/Shiny-Maintained?style=for-the-badge&logo=RStudio&logoColor=white)
![Status](https://img.shields.io/badge/Status-Live_Demo-success?style=for-the-badge)

> A modular R Shiny application designed to simulate and visualize clinical trial data, demonstrating advanced reactive programming and corporate-style UI customization.

**🚀 Live Demo:** [Link to your live app on shinyapps.io]

---

## 📖 Overview

This project represents a comprehensive exercise in building a **production-ready R Shiny application**. Instead of a simple monolithic script, this dashboard implements a **modular architecture** to ensure scalability and maintainability, mimicking real-world requirements in the Pharmaceutical and Biotech sectors.

The dashboard allows stakeholders to:
* Filter patient cohorts by treatment and demographics.
* Monitor Key Performance Indicators (KPIs) like patient recruitment and biomarker response.
* Interactively explore relationships between variables (e.g., Age vs. Baseline).

---

## 🛠 Key Technical Features

This project focuses on **engineering best practices** within the Shiny ecosystem:

### 1. Modular Architecture
* Implementation of **Shiny Modules** (`mod_scatter.R`) to encapsulate logic and UI components.
* Proper management of **Namespaces (`NS`)** to avoid ID collisions and allow component reusability.

### 2. Reactive Optimization
* Efficient management of the **Reactive Graph**.
* Use of `reactive()` conductors to cache filtered datasets, preventing redundant computations.
* Implementation of `eventReactive()` and `observeEvent()` for precise control over execution triggers (e.g., Reset Button).

### 3. Professional UI/UX
* **Custom CSS** integration (`www/styles.css`) to override default styles and implement a corporate color palette (Teal/Pharma style).
* Interactive visualizations using `ggplot2` wrapped in `plotly` for drill-down capabilities (hover, zoom).
* Use of `shinydashboard` for a structured, grid-based layout.

---

## 📂 Project Structure

```
├── app.R                   # Main application entry point (UI & Server integration)
├── mod_scatter.R           # Independent Shiny Module for Scatter Plots
├── clinical_data.csv       # Synthetic dataset used for the analysis
├── www/
│   └── styles.css          # Custom CSS for styling headers, boxes, and alerts
└── README.md               # Project documentation
```
---

### 🧠 Methodology & Learning Path
This project was developed as part of an intensive AI-Assisted Engineering Bootcamp.

The goal was to leverage Large Language Models (LLMs) not just to generate code, but to act as a Senior Technical Mentor. This workflow allowed for a deep dive into advanced concepts—such as the Shiny reactive lifecycle and CSS injection—facilitating a rapid transition from theoretical knowledge to a deployed, functional product.

## ⚖️ Data Disclaimer & Generation

The dataset used in this application (`clinical_data.csv`) is **100% synthetic and generated programmatically**.

* **Generation Method:** Data was created using R scripts utilizing random sampling and normal distributions (`rnorm`) to simulate biological variability (e.g., Biomarker levels).
* **Reproducibility:** A seed (`set.seed(123)`) was used to ensure the "random" data remains consistent across sessions.
* **Privacy:** No real patient data was accessed, used, or processed in the creation of this dashboard. Any resemblance to real clinical trials or individuals is purely coincidental.

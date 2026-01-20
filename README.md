# 🏥 Clinical Trial Dashboard (R Shiny)

![R](https://img.shields.io/badge/R-4.0%2B-blue)
![Shiny](https://img.shields.io/badge/Shiny-Modular-orange)
![Status](https://img.shields.io/badge/Status-Deployed-brightgreen)

## 🚀 Live Demo
**View the deployed application here:** 👉 [INSERT LINK TO YOUR SHINYAPPS.IO APP HERE]

---

## 📖 Overview

This project is a professional-grade **R Shiny Dashboard** designed to visualize synthetic clinical trial data. It simulates a monitoring tool for a pharmaceutical study, allowing stakeholders to filter patient cohorts, analyze biomarker responses, and track enrollment KPIs in real-time.

The main goal of this project was to move beyond basic scripting and implement **scalable software architecture** principles in R, including modularization, advanced reactivity control, and corporate styling.

## ✨ Key Technical Features

This application demonstrates the following Data Science & Engineering capabilities:

* **Modular Architecture:** Implementation of **Shiny Modules** (`mod_scatter.R`) and **Namespaces (`NS`)** to encapsulate logic, preventing ID collisions and enabling code reusability across different tabs.
* **Reactive Optimization:** Efficient management of the **Reactive Graph**.
    * Use of `reactive()` conductors to filter data once and cache results.
    * Use of `eventReactive()` and `actionButton` to prevent unnecessary computation (lazy evaluation) and improve UX.
* **Custom UI/UX:** Integration of a custom **CSS stylesheet** (`www/styles.css`) to override default Shiny styles, implementing a "Pharma-style" color palette and custom alert classes.
* **Interactive Visualization:** usage of `ggplot2` wrapped in `plotly` for interactive tooltips, zooming, and filtering capabilities.

## 📂 Project Structure

The project follows a clean production-ready structure:

```text
.
├── app.R                # Main application entry point (UI & Server)
├── mod_scatter.R        # Independent module for Scatter Plot logic
├── clinical_data.csv    # Synthetic dataset
├── www/                 # Static assets
│   └── styles.css       # Custom CSS for corporate styling
└── README.md            # Project documentation

# Instalar y cargar los paquetes necesarios
# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("DT")

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)

setwd("/home/milton/Downloads/dashboard")

# Proceso de datasets
hogares <- read.csv("hogares.csv", sep = ",")
personas <- read.csv("personas.csv", sep = ",")
viajes <- read.csv("viajes.csv", sep = ",")

bd <- viajes %>%
  inner_join(hogares, by = "CODIGO_HOGAR_SIMPLE")
bd$"HHMM.SALE" <- as.integer(bd$"HHMM.SALE")
bd$"HHMMLLEG" <- as.integer(bd$"HHMMLLEG")

# Creacion del UI
ui <- dashboardPage(
  dashboardHeader(title = "EST-383"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Inicio", tabName = "start", icon = icon("home")),
      menuItem(
        text = HTML("<i class='fas fa-table'></i> Base de Datos"),
        tabName = "datasets"
      ),
      menuItem("Metrics 1", tabName = "metrics1", icon = icon("chart-bar")),
      menuItem("Metrics 2", tabName = "metrics2", icon = icon("chart-bar")),
      menuItem("Metrics 3", tabName = "metrics3", icon = icon("chart-bar"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "start",
        fluidRow(includeMarkdown("info.md"),
        tags$style(".tab-content { padding: 20px; }"))
      ),
      tabItem(tabName = "datasets",
              h2("Base de datos"),
              DT::dataTableOutput("bdTable")
      ),
      tabItem(tabName = "metrics1",
              h2("¿Por que usa el teleferico?"),
              plotOutput("plotPorque"),

      ),
      tabItem(tabName = "metrics2",
              h2("Motivo de uso"),
              plotOutput("plotMotivo"),
              h2("Tiempo promedio de viaje"),
              DT::dataTableOutput("tiempoPromedioTable")
      ),
      tabItem(tabName = "metrics3",
              h2("¿Cuanto gasta en promedio antes de usar el teleferico?"),
              DT::dataTableOutput("gastoTari1Table")
      )
    )
  )
)

server <- function(input, output) {

  output$bdTable <- DT::renderDataTable(DT::datatable({
    bd
  }))

  output$tiempoPromedioTable <- DT::renderDataTable(DT::datatable({
    tiempo_promedio <- bd %>%
      mutate(tiempo = (HHMMLLEG - HHMM.SALE)) %>%
      group_by(MOTDES) %>%
      summarise(total = n(), promedio = round(mean(tiempo, na.rm = TRUE), 0))
    tiempo_promedio
  }))

  output$plotMotivo <- renderPlot({
    tabla_motivo <- table(viajes$MOTDES)
    tabla_motivo <- tabla_motivo[order(tabla_motivo, decreasing = TRUE)]
    total <- length(unique(viajes$MOTDES))
    barplot(tabla_motivo, main = "Motivo de uso", col = rainbow(total))
  })

  output$plotPorque <- renderPlot({
    tabla_porque <- table(viajes$PORQUE)
    tabla_porque <- tabla_porque[order(tabla_porque, decreasing = TRUE)]
    total <- length(unique(viajes$PORQUE))
    barplot(tabla_porque,
      main = "Razon del uso del teleferico", col = rainbow(total))
  })

  output$gastoTari1Table <- DT::renderDataTable(DT::datatable({
    gasto_tar1 <- bd %>%
      group_by(X10.MOD1) %>%
      summarise(total = n(), promedio = round(mean(TAR1, na.rm = TRUE), 0))
    gasto_tar1
  }))
}

shinyApp(ui, server, options = list(port = 3838))

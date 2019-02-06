## LOADING LIBRARIES
library(shiny)

## SHINY UI
shinyUI(
  navbarPage("Solar Radiation Prediction (Course Project) - Alvin Alon (Feb 6, 2019)",
             tabPanel("SOLAR RADIATION PREDICTION",
                      fluidPage(
                        
                        # Application title
                        titlePanel("APP Description"),
                        helpText("Solar Radiation is one of the main factors that determines the energy output of a photovoltaic system (Solar Panel). Solar radiation varies nonlinearly due to atmospheric events such as cloudy weather, rain, humudity etc. Therefore estimation of solar radiation is an attractive issue in solar energy field. Predicting solar radiation helps to predict the number of solar panels needed for a certain households."),
                        h3("FEATURES"),
                        # Sidebar with a slider input for number of bins 
                        sidebarLayout(
                          sidebarPanel(
                            sliderInput("barometric_pressure",
                                        "Barometric Pressure:",
                                        min = 30.19,
                                        max = 30.56,
                                        value = 30.42),
                            sliderInput("humidity",
                                        "Humidity:",
                                        min = 8,
                                        max = 265.8,
                                        value = 76),
                            sliderInput("temperature",
                                        "Temperature:",
                                        min = 34,
                                        max = 71,
                                        value = 51.05),
                            sliderInput("wind_direction",
                                        "Wind Direction:",
                                        min = 0.09,
                                        max = 459.95,
                                        value = 143.25),
                            sliderInput("wind_speed",
                                        "Wind Speed:",
                                        min = 1.0,
                                        max = 40.5,
                                        value = 6.22)
                          ),
                          
                          # Show a plot of the generated distribution
                          mainPanel(
                            tabsetPanel(
                              tabPanel("PREDICTED SOLAR RADIATION", tableOutput("solarRadDisplay"))
                            )
                          )
                        )
                      )
                      
             ),
             tabPanel("DATA DESCRIPTION",
                      h2("HI-SEAS Meteorological Data"),
                      hr(),
                      h3("Description"),
                      helpText("These datasets are meteorological data from the HI-SEAS weather station from four months (September through December 2016) between Mission IV and Mission V."),
                      h3("Format"),
                      p("A data frame with 35093 observations on 6 variables."),
                      
                      p("  [, 1]   Barometric pressure: Hg"),
                      p("  [, 2]	 Humidity: percent"),
                      p("  [, 3]	 Temperature: degrees Fahrenheit"),
                      p("  [, 4]	 Wind direction: degrees"),
                      p("  [, 5]	 Wind speed: miles per hour"),
                      p("  [, 6]	 Solar radiation: watts per meter^2")
             ),
             tabPanel("SOURCE CODE",
                      h4("All the Source code can be found on my github"),
                      hr(),
                      a("https://github.com/engrasa/ddpweek4Project")
             )
  )
)
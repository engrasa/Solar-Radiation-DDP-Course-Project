## LOADING LIBRARIES
library(shiny)



## SHINY SERVER
shinyServer(function(input, output) {
  
  output$solarRadDisplay <- renderTable({
    solarRadiationCsv <- read.csv("solarRadiation.csv");
    solarR_DF <- data.frame(baro = solarRadiationCsv$barometric_pressure[1:35092], humi = solarRadiationCsv$humidity[1:35092], temp = solarRadiationCsv$temperature[1:35092], wind_d = solarRadiationCsv$wind_direction[1:35092], wind_s = solarRadiationCsv$wind_speed[1:35092], solarR = solarRadiationCsv$solar_radiation[1:35092]);
    solarR_DF
    
    solarRadModel_lm <- lm(solarR ~ baro+humi+temp+wind_d+wind_s, data=solarR_DF)
    NewBaro <- data.frame(baro=input$barometric_pressure)
    NewHumi <- data.frame(humi=input$humidity)
    NewTemp <- data.frame(temp=input$temperature)
    NewWindD <- data.frame(wind_d=input$wind_direction)
    NewWindS <- data.frame(wind_s=input$wind_speed)
    
    NewBaro
    NewHumi
    NewTemp
    NewWindD
    NewWindS
    
    solarR_Value <- predict(solarRadModel_lm, c(NewBaro, NewHumi, NewTemp, NewWindD, NewWindS))
    solarR_Value
    
  })
})

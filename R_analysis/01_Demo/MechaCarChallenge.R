library(dplyr)

# Linear Regression to Predict MPG
MechaCarData <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCarData))

library(tidyverse)

# Summary Statistics on Suspension Coils
SuspensionCoilData <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors = F)
total_summary <- SuspensionCoilData %>% summarize(psiMean=mean(PSI), psiMedian=median(PSI), psiVariance=var(PSI), psiSD=sd(PSI), .groups = 'keep')
lot_summary <- SuspensionCoilData %>% group_by(Manufacturing_Lot) %>% summarize(psiMean=mean(PSI), psiMedian=median(PSI), psiVariance=var(PSI), psiSD=sd(PSI), .groups = 'keep')

# T-Tests on Suspension Coils
t.test(SuspensionCoilData$PSI, mu=1500)
t.test(subset(SuspensionCoilData$PSI, SuspensionCoilData$Manufacturing_Lot=="Lot1"), mu=1500)
t.test(subset(SuspensionCoilData$PSI, SuspensionCoilData$Manufacturing_Lot=="Lot2"), mu=1500)
t.test(subset(SuspensionCoilData$PSI, SuspensionCoilData$Manufacturing_Lot=="Lot3"), mu=1500)

download.file("https://www.fueleconomy.gov/feg/epadata/17data.zip",
              destfile = "processing/cars2017.zip")
unzip("processing/cars2017.zip", exdir = "processing/cars2017")
library(readxl)
library(dplyr)
cars2017 <- read_excel("processing/cars2017/2017 FE Guide for DOE-release dates before 9-20-2017-no sales-9-19-2017Audiforpublic.xlsx")
cars2017 <- cars2017 %>% 
  rename(make = `Mfr Name`, model = Carline, displacement = `Eng Displ`,
         cylinders = `# Cyl`, city_mpg = `City FE (Guide) - Conventional Fuel`,
         hwy_mpg = `Hwy FE (Guide) - Conventional Fuel`,
         gears = `# Gears`) %>% 
  select(make, model, displacement, cylinders, city_mpg, hwy_mpg, gears) %>% 
  distinct(make, model, displacement, cylinders, gears,.keep_all = TRUE) %>% 
  as.data.frame()
save(cars2017, file = "data/cars2017.rda")

library(DataComputing)
library(dplyr)
library(tigerTree)

diab <- subset(NCHS, death == "alive")
diab <- diab %>% select(sex:ethnicity, smoker:income)
diab <- subset(diab, complete.cases(diab))
diab$diabetic <- factor(ifelse(diab$diabetic == "0", "no","yes"))

dfs <- divideTrainTest(seed = 4040, prop.train = 0.8, data = diab)
diabetes <- dfs$train
diabetes2 <- dfs$test
save(diabetes, file = "data/diabetes.rda")
save(diabetes2, file = "processing/diabetes2.rda")

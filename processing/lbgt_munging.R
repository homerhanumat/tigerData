lbgt <- read.csv("Total Results-1.csv",header=TRUE)
names(lbgt) <- gsub(names(lbgt),pattern="\\.\\.",replace="Plus")

# Note two spuriously different levels in School.System
# unique(lbgt$School.System)

lgbtplus <- lbgt
save(lgbtplus,file="../data/lgbtplus.rda")



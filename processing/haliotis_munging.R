# I'm gonna cut don the famous abalone dataset.  For use in class projects.
library(AppliedPredictiveModeling)
data(abalone)
abalone$Age <- abalone$Rings+1.5
abalone$Rings <- NULL
names(abalone) <- c("Type","LongSh","Diam","Height","WhWt",
                    "ShuckWt","ViscWt", "ShellWt","Age")
n <- nrow(abalone)
trSize <- floor(0.7*n)
testSize <- n - trSize
bool <- c(rep(TRUE, trSize), rep(FALSE, testSize))
set.seed(3030)
inTrain <- sample(bool, n, replace = FALSE)
haliotis <- subset(abalone, inTrain)
haliotis2 <- subset(abalone, !inTrain)
sum(complete.cases(haliotis))

library(randomForest)
rf <- randomForest(x = haliotis[,1:8], y = haliotis$Age,
                   xtest = haliotis2[,1:8], ytest = haliotis2$Age,
                   do.trace = 50, keep.forest = T)
library(tree)

tr.mod <- tree(Age ~ ., data = haliotis)
plot(tr.mod)
text(tr.mod)
summary(tr.mod)


save(haliotis2, file = "processing/haliotis2.rda")
save(haliotis, file = "data/haliotis.rda")

names(haliotis)

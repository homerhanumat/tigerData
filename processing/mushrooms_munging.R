# I decided to get the expanded version from the site and read it in.
shrooms <- read.csv(file = "processing/expanded.txt", header = F, na.strings = "?")
temp <- c("class", "cap.shape", "cap.surface", "cap.color",
                    "bruises","odor","gill.attachment","gill.spacing","gill.size",
                    "gill.color","stalk.shape","stalk.root","stalk.surface.above.ring",
                    "stalk.surface.below.ring","stalk.color.above.ring",
                    "stalk.color.below.ring","veil.type","veil.color","ring.number",
                    "ring.type","spore.print.color","population","habitat")
length(temp)
names(shrooms) <- temp
levels(shrooms$class)

library(randomForest)

# I'll divide into training and test sets.
# Training set will go to students as a project.
# Test set will be used to check the "rules" they come up with.



n <- nrow(shrooms)
trSize <- floor(0.7*n)
testSize <- n - trSize
bool <- c(rep(TRUE, trSize), rep(FALSE, testSize))
set.seed(3030)
inTrain <- sample(bool, n, replace = FALSE)
shrooms1 <- subset(shrooms, inTrain)
shrooms2 <- subset(shrooms, !inTrain)
# missing values occur only in column 12
rf <- randomForest(x = shrooms1[,c(2:11,13:23)], y = shrooms1$class,
                   xtest = shrooms2[,c(2:11,13:23)], ytest = shrooms2$class,
                   do.trace = 50, keep.forest = T)
library(tree)
temp <- shrooms1[,c(1:11,13:23)]
tr.mod <- tree(class ~ cap.shape+cap.surface+cap.color+bruises+odor+gill.size, data = temp)

save(shrooms2, file = "processing/shrooms2.rda")
shrooms <- shrooms1
save(shrooms, file = "data/shrooms.rda")

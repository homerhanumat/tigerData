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

sum(is.na(shrooms$stalk.root))
# missing values occur only in column 12 (stalk.root)
# let's just call them "unrecorded"

temp <- as.character(shrooms$stalk.root)
temp[is.na(temp)] <- "unrecorded"
temp <- factor(temp)
shrooms$stalk.root <- temp


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

library(tree)

tr.mod <- tree(class ~ ., data = shrooms1)
tr.mod
summary(tr.mod)
plot(tr.mod); text(tr.mod)
preds <- predict(tr.mod, shrooms2, type = "class")
wrong <- preds != shrooms2$class
sum(wrong)
sum(wrong)/length(wrong)

preds.check <- predict(tr.mod, newdata = shrooms1, type ="class")
wrong.check <- preds.check != shrooms1$class
s1check <- subset(shrooms1, wrong.check)
xtabs(~stalk.root+class, data = s1check)

# So one might suggest a further division.
tr.mod2 <- tree(class ~ ., data = shrooms1, 
                control = tree.control(nobs = nrow(shrooms1), minsize = 5,
                                       mindev = 0))
tr.mod2
preds.new <- predict(tr.mod2, newdata = shrooms2, type ="class")
wrong.new <- predsnew != shrooms2$class
sum(wrong.new)

# doesn't miss at all

# what if we split first on whether or not stalk.root is unrecorded?
st1 <- subset(shrooms1, stalk.root == "unrecorded")
st2 <- subset(shrooms1, stalk.root != "unrecorded")
tr.mod1 <- tree(class ~ ., data = st1)
tr.mod2 <- tree(class ~ ., data = st2)
preds1 <- predict(tr.mod1, subset(shrooms2,stalk.root == "unrecorded"), 
                  type = "class")
preds2 <- predict(tr.mod2, subset(shrooms2,stalk.root != "unrecorded"), 
                  type = "class")
preds.new <- character(nrow(shrooms2))
preds.new[shrooms2$stalk.root == "unrecorded"] <- as.character(preds1)
preds.new[shrooms2$stalk.root != "unrecorded"] <- as.character(preds2)

wrong.new <- preds.new != shrooms2$class
sum(wrong.new)

# this also doesn't miss at all. 
# But it may be that neither is an important improvement.


save(shrooms2, file = "processing/shrooms2.rda")
shrooms <- shrooms1
save(shrooms, file = "data/shrooms.rda")

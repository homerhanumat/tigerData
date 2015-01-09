tA <- c(52,33,55,149,145,34,47,59,86,43,68,135,38,54,79,142,36,70,224)
tB <- c(55,73,56,49,323,97,149,131,94,128,57,312,83,99,43,111,60,114,52,83)
tC <- c(794,54,138,67,71,259,124,51,43,104,137,236,72,79,308,1319,180)
treatment <- rep(LETTERS[1:3],times=c(19,20,17))
sex <- c(rep(c("male","female"),times=c(7,12)),
         rep(c("male","female"),times=c(8,12)),
         rep(c("male","female"),times=c(6,11)))
times <- c(tA,tB,tC)
payphones <- data.frame(sex=factor(sex),treatment=factor(treatment),time=times)
save(payphones,file="../data/payphones.rda")

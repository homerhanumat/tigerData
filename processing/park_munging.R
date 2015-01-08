load(file="park.rda")
library(plyr)
park$day <- with(park,dmt - dmt %% 10000)

day <- with(park,mapvalues(day,
                        from=c(50000,60000,70000),
                        to=c("Thursday","Friday","Saturday")))
day <- factor(day,levels=c("Thursday","Friday","Saturday"))
park$day <- day

sex <- with(park,mapvalues(sex,
                 from=c(1,2),
                 to=c("male","female")))
# one person has sex 5.  What's this?  Let's guess that it's NA.
sex[sex=="5"] <- NA
sex <- factor(sex,levels=c("female","male"))
park$sex <- sex

park$miltime <- with(park,dmt %% 10000)

race <- with(park,mapvalues(race,
                                from=c(1,2,3),
                                to=c("white","black","other")))
race <- factor(race,levels=c("white","black","other"))
park$race <- race

horn <- with(park,mapvalues(horn,
                                 from=c(0,1,9,7),
                                 to=c("no_horn","yes_horn","drive_by","no_intrusion")))
horn <- factor(horn,levels=c("no_intrusion","drive_by","no_horn","yes_horn"))
park$horn <- horn

month <- with(park,mapvalues(month,
                                from=c(1,2),
                                to=c("March","May")))
month <- factor(month,levels=c("March","May"))
park$month <- month

park$dmt <- NULL

#given the uncertainty about time1, we'll just drop it
park$time1 <- NULL
park$time <- park$time2/100
park$time2 <- NULL

#guessing for now that 0 is the lexus
confcar <- with(park,mapvalues(confcar,
                                from=c(0,1,2),
                                to=c("Lexus","Q45","Maxima")))
confcar <- factor(confcar,levels=c("Maxima","Lexus","Q45"))
park$confcar <- confcar

ccstatus <- with(park,mapvalues(confcar,
                            from=c("Lexus","Q45","Maxima"),
                            to=c("high","high","low")))
ccstatus <- factor(ccstatus,levels=c("low","high"))
park$ccstatus <- ccstatus

# get differenc ein values between cars.  Use conf car values as given in
#journal article:
ccvals <- as.numeric(as.character(with(park,mapvalues(confcar,
                              from=c("Lexus","Q45","Maxima"),
                              to=c(43000,57000,5200)))))
park$valuediff <- with(park,ccvals-carval)


parkExp <- subset(park,horn %in% c("no_horn","yes_horn"))
parkExp$horn <- droplevels(parkExp$horn)
# table(parkExp$day)
# table(parkExp$race)
# table(parkExp$confcar)
parkExp$confcar <- droplevels(parkExp$confcar)
#table(parkExp$month)


write.csv(park,file="park.csv")
write.csv(parkExp,file="parkExp.csv")

parking <- park
save(parking,file="parking.rda")
save(parkExp,file="parkExp.rda")
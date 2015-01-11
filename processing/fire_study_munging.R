require(foreign)


fac.big <- read.spss("FactorAnalysis_merged_renamed0921.sav")

fac.big$acadeCBCL
fac <- with(fac.big,
            data.frame(age=age,sex=sex_RC,
                       race=RaceRC,
                       school.att=ScaleAttitudeREschool,
                       academic=AcademicPerf_Scale,
                       attention.raw=sc6raw_scoredCBCL,
                       attention.t=sc6t_scoredCBCL,
                       adhd.raw=dsm4raw_scoredCBCL,
                       adhd.t=dsm4t_scoredCBCL,
                       attention=attention,
                       attention.scaled=sc6t_scored,
                       adhd=ADHD,
                       adhd.scaled=dsm4t_scored,
                       fires=as.factor(q72_RC)
                      )
          )

require(plyr)


sex <- with(fac,mapvalues(sex,
                           from=c(0,1),
                           to=c("female","male")))
sex <- factor(sex,levels=c("female","male"))
fac$sex <- sex

race <- with(fac,mapvalues(race,
                          from=c(1,2,3),
                          to=c("white","black","other")))
race<- factor(race,levels=c("white","black","other"))
fac$race <- race



firesetting <- data.frame(
  age=fac$age,sex=fac$sex,race=fac$race,
  school.attitude=fac$school.att,
  academic=fac$academic,
  adhd=fac$adhd.scaled,
  fires=fac$fires)

save(firesetting,file="../data/firesetting.rda")

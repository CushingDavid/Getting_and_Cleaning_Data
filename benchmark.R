

library(rbenchmark)

benchmark("test1" = {
  test1 <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
},
#"test2" = {
#  rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#},
"test3" = {
  mean(DT$pwgtp15,by=DT$SEX)
},
"test4" = {
  tapply(DT$pwgtp15,DT$SEX,mean)
},
"test5" = {
  DT[,mean(pwgtp15),by=SEX]
},
"test6" = {
  sapply(split(DT$pwgtp15,DT$SEX),mean)
},
replications = 1000,
columns = c("test", "replications", "elapsed",
            "relative", "user.self", "sys.self"))

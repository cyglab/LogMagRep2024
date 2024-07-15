rm(list=ls())   # 

library(lme4) 
library(lmerTest) 
 
data <- read.csv("Y:\\Working\\MyPaper\\时空信息对数神经表征_HCN\\DataAnalysis\\Analysis20240314\\ERP\\lmmP2P3.csv")


names(data) <-c("sub","Dur","Dis","logDur","logDis","P2","P3","logP2","logP3")


mod1 <- lmer(P2 ~ Dur + Dis + (1|sub) + (0 + Dur + Dis |sub), data=data, REML=T)
            
summary(mod1)
anova(mod1)
dataClass = predict(mod1)

write.csv(dataClass,file = "Y:\\Working\\MyPaper\\时空信息对数神经表征_HCN\\DataAnalysis\\Analysis20240314\\ERP\\ClassPredicP2.csv", row.names = F)

mod2 <- lmer(P2 ~ logDur + logDis + (1|sub) + (0 + logDur + logDis |sub), data=data, REML=T)

summary(mod2)
anova(mod2)
dataLog = predict(mod2)
write.csv(dataLog,file = "Y:\\Working\\MyPaper\\时空信息对数神经表征_HCN\\DataAnalysis\\Analysis20240314\\ERP\\LogPredicP2.csv", row.names = F)

anova(mod1, mod2) 
   

mod1 <- lmer(P3 ~ Dur + Dis + (1|sub) + (0 + Dur + Dis |sub), data=data, REML=T)

summary(mod1)
anova(mod1)
dataClass = predict(mod1)

write.csv(dataClass,file = "Y:\\Working\\MyPaper\\时空信息对数神经表征_HCN\\DataAnalysis\\Analysis20240314\\ERP\\ClassPredicP3.csv", row.names = F)

mod2 <- lmer(P3 ~ logDur + logDis + (1|sub) + (0 + logDur + logDis |sub), data=data, REML=T)

summary(mod2)
anova(mod2)
dataLog = predict(mod2)
write.csv(dataLog,file = "Y:\\Working\\MyPaper\\时空信息对数神经表征_HCN\\DataAnalysis\\Analysis20240314\\ERP\\LogPredicP3.csv", row.names = F)

anova(mod1, mod2)   
                              
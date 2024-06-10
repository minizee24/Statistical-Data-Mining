library(dplyr)

titanic = read.csv("/Users/minipalepu/Desktop/titanic.csv")

head(titanic)

titanic$age_group <- ifelse(titanic$Age<=12, 1, 0)

summary(titanic$Sex) 
summary(titanic$Age)
summary(titanic$Survived)

prop.table(table(titanic$Sex, titanic$Age, titanic$Survived), margin = c(1, 2))

titanic %>% filter(age_group == 1) %>% summarize(Child_Prob_Survived = mean(Survived)) 
titanic %>% filter(age_group == 0) %>% summarize(Adult_Prob_Survived = mean(Survived))
titanic %>% filter(age_group == 1, Sex == "female") %>% summarize(Female_Child_Prob_Survived = mean(Survived)) 
titanic %>% filter(age_group == 1, Sex == "male") %>% summarize(Male_Child_Prob_Survived = mean(Survived)) 

g <- table(titanic$Survived, titanic$Sex)
age <- table(titanic$Survived, titanic$age_group)

prop.table(g, margin =1)
prop.table(age, margin =1)

class <- table(titanic$Survived, titanic$Pclass)
prop.table(class, margin =1)

titanic %>% filter(Pclass == 1, Sex == "female") %>% summarize(Class1_F_Prob_Survived = mean(Survived)) 
titanic %>% filter(Pclass == 3, Sex == "male") %>% summarize(Class3_M_Prob_Survived = mean(Survived)) 


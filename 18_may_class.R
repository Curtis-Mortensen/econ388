library(wooldridge)
library(car)


data(meap93, package='wooldridge')
math <- meap93$math10
expend <- meap93$expend
salary <- meap93$salary
benefits <- meap93$benefits
staff <- meap93$staff

mean(math)
mean(expend)
mean(salary)
mean(benefits)
mean(staff)

model_1 <- lm(math~expend)
summary(model_1)

m2 <- lm(math~expend+salary+benefits+staff)
summary(m2)

m3 <- lm(math~expend+benefits)
summary(m3)

vif(m2)
vif(m3)
#so it looks like vif is actually part of cars 

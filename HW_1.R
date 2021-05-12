---
  title: "Chapter 1 Homework"
Name: "Curtis Mortensen"
output:
  pdf_document: default
html_document: default
---
  
  \clearpage

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Homework Chapter 1 {.tabset}



## Question 1

### Suppose that you are asked to conduct a study to determine whether smaller class sizes lead to improved student performance of fourth graders.

#### a) If you could conduct any experiment you want, what would you do? Be specific. 



Assuming I could have an infinite population of fourth graders, I would group them into classes ranging from 1-100 and measure the outcomes. I would have to hold all other factors constant, so they would have to be identical fourth graders with the same upbringing (identical sextuplets maybe?), being taught the same subject, by the same teacher, at the same time, in the same school, with their diet and extracurricular activities held the same, among other things. 



#### b) More realistically, suppose you can collect observational data on several thousand fourth graders in a given state. You can obtain the size of their fourth grade class and a standardized test score taken at the end of fourth grade. Why might you expect a negative correlation between class size and test score?



I can think of two reasons: firstly, the bigger the class size, the less interaction a student has with the teacher, and the less personalized their education becomes. They have less chances to ask questions, get help, etc. Secondly, there are usually less students in advanced subjects, or those subjects are prioritized, so advanced classes have smaller sizes. Basically, this selection bias means students in smaller classes tend to be better at academics to begin with. 



#### c) Would a negative correlation necessarily show that smaller class sizes cause better performance? Explain.



No. To begin with, correlation doesn't equal causation. Like I explained above, there is likely some selection bias, so that academically gifted students are put into smaller classes. 




## Question 2

### States (and provinces) that have control over taxation sometimes reduce taxes in an attempt to spur economic growth. Suppose that you are hired by a state to estimate the effect of corportate tax rates on, say, the growth in per capita gross state product (GSP).

#### a) What kind of data would you need to collect to undertake a statistical analysis?



I would need data on all possible explanatory variables, including the specializations or sectors of the economy and their projected worldwide growth rate, unemployment rate, competition within the state, and foreign and domestic investment, along with other variables.  



#### b) Is it feasible to do a controlled experiment? What would be required?



Not at all feasible. We would need to create two completely identical states, with identical populations, identical pressures from the outside, and identical conditions on the inside, and then measure the effect of different tax rates. 



#### c) Is a correlation analysis between GSP growth and tax rates likely to be convincing? Explain.



I doubt that it will be convincing because there are so many possible confounding variables. It is very possible that GSP growth could be caused solely by investment from inside or outside the state, or world economic trends, and be unrelated to tax rates. 




## Question 3

### Use the data in COUNTYMURDERS to answer this question. Use only the year 1996. The variable murders is the number of murders reported in the county. The variable execs is the number of executions that took place of people sentenced to death in the given county. Most states in the United States have the death penalty, but several do not.

#### a) How many counties are there is the data set Of these, how many have zero murders? What percentage of counties have zero executions? (Remember, use only the 1996 data)



```{r}
library(readr)
cm <- read_csv("countymurders.csv")


```


#### b) What is the largest number of murders? What is the largest number of executions? Why is the average number of executions so small? 



```{r}
murders <- cm$murders
execs <- cm$execs

(max(murders))
(max(execs))
(mean(execs))

# The avg execs is small because counties are small, and typically don't have any executions. I also suspect that it includes data from states and counties that don't allow executions.

```

\clearpage

#### c) Compute the correlation coefficient between murders and execs and describe what you find.



```{r}
#murders = y 

xvar <- c(var(execs))
covar <- c(cov(murders, execs))
y <- c(mean(murders))
mean(execs)

b <- c(covar / xvar)
a <- c(y - b)
a
  
```

#### d) You should have computed a positive correlation in part c. Do you think that more executions cause more muders to occur? What might explain the positive correlation? 






Unfortunately I didn't get a positive value, and I wasn't able to figure out why... 


---
  title: "Chapter 2 Homework"
Name: "Curtis Mortensen"
output:
  pdf_document: default
html_document: default
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(wooldridge)
library(tidyverse)
library(pander)
library(mosaic)
library(foreign)
library(effects)
library(stats)

```
# Homework Chapter 2 {.tabset}

## Question 1

### Consider the standard simple regression model 
$$y= \beta_0 + \beta_1x + \mu $$ 
  under the Markov Assumptions SLR.1 through SLR.5. The usual OLS estimators $$ \hat{\beta}_0 {and} \hat{\beta}_1 $$ are unbiased for their respective population parameters. Let $$ \tilde{\beta}_1 $$ be the estimator of $$\beta_1$$ obtained by assuming the intercept is zero. 

#### a) Find 
$$ E( \tilde{\beta_1})$$ in terms of the xi, $$\beta_0 $$ and $$ \beta_1 $$ 
  Verify that $$ E( \tilde{\beta_1})$$  is unbiased for $$ \beta_1 $$ when the population intercept ($$\beta_0 $$) is zero. Are there other cases where $$ E( \tilde{\beta_1})$$ is unbiased? 
  
  
  
  
  
  
  
  #### b) Find the variance of 
  $$ E( \tilde{\beta_1})$$ 
  
  
  
  
  
  
  ## Question 2
  
  The data set in ceosal2 contains information on chief executive officers for U.S. corporations. The variable *salary* is annual compensation in thousands of dollars, and *ceoten* is prior number of years as company CEO. 

#### a)

Find the average salary and the average tenure in the sample.

```{r}
data(ceosal2, package='wooldridge')

# extract variables as vectors:
sal <- ceosal2$salary
ceoten <- ceosal2$ceoten

avg_sal <- mean(sal)
avg_sal

avg_ten <- mean(ceoten)
avg_ten

```



#### b)

How many CEOs are in their first year as CEO (that is, *ceoten* = 0)? 
  
  
  
  ```{r}
filter(ceosal2, ceoten == 0)

# 5 CEOs are in their first year 
```



#### c)

Estimate the simple regression model.

```{r}
# model <-lm(y ~ x, dataset)
model <- lm(sal~ceoten, ceosal2)
summary(model)
```





## Question 3

To complete this exercise you need a software package that allows you to generate data from the uniform and normal distributions.

#### a) Start by generating 500 observations on $x_i$ - the explanatory variable- from the uniform distribution with range [0,10]. (Most statistical packages have a command for the Uniform(0,1) distribution: just multiply those observations by 10.) What are the sample mean and sample standard deviation of $x_i$.


```{r}
x <- (runif(500)*10)

mean(x)
sd(x)

```





#### b) Randomly generate 500 errors, $u_{i}$ from the Normal(0,36) distribution. (if you generate a Normal(0,1), as commonly available, simply multiply the outcomes by six.) Is the sample average of the $u_{i}$ exactly zero? Why or why not? What is the sample standard deviation of $u_{i}$?

```{r}
u <- (rnorm(500)*6)
mean(u)
sd(u)

```





#### c) Now, generate the $y_i$ as
$$ y_i = 1 + 2x_{i} + u_{i} \equiv \beta_0 + \beta_1x_i + u_i $$
  
  That is, the population intercept is one and the population slope is two. Use the data to run the regression on $y_i$ on $x_i$. What are you estimates of the intercept and slope? Are they equal to the population values in the above equation? Explain.

```{r}
y_i <- 1 + 2*x + u
model_1 <- lm(y_i~x)
summary(model_1)

# My estimate of the intercept is 1.16513 and my slope is 1.90758. Naturally they aren't equal to the true population values because they are based on randomly generated numbers. Just like with any sample, we can create confidence intervals that we are confident contain the true values, but unless our sample encompasses the population, or goes to infinity, we can't be sure. 

```






#### d) Obtain the OLS residuals, $\hat{u_i}$, and verify that equation (2.60) holds(subject to rounding error).


```{r}
resid <- resid(model_1)
mean(resid)

```





#### e) Compute the same quantities in equation (2.60) but use the errors $u_i$ in place of the residuals.

```{r}



```






#### f) Repeat parts (i), (ii), and (iii) with a new sample of data, starting with generating the $x_i$. Now what do you obtain for $\hat{\beta_0}$ and $\hat{\beta_1}$ ? Why are these different from what you obtained in part (iii)?

```{r}
new_x <- (runif(500)*10)

```






## Question 4

Use the data in COUNTYMUDERS to answer these questions. Use only data for 1996.

#### a) How many counties had zero murders in 1996? How many counties had at least one execution? What is the largest number of executions?

```{r}
require(readr)
cm <- read_csv("countymurders.csv")
zero_mur <- c(filter(cm, cm$murders == "0"))


```







#### b) Estimate the equation 
$$ murders = \beta_0 + \beta_1execs + u $$
  
  by OLS and report the results in the usual way, including sample size and Rsquared.



```{r}
murders <- c(cm$murders)
execs <- c(cm$execs)
cm_model <- lm(murders~execs, cm)
summary(cm_model)
```


#### c)  Interpret the slope coefficient reported in part ii. Does the estimated equation suggest a deterrent effect of capital punishment?





#### d) What is the smallest number of murders that can be predicted by the equation? What is the residual for a county with zero executions and zero murders?

6.8 murders is the intercept, or the smallest amount that can be predicted. The residual for a county with zero executions and murders could be 6.8. 



#### e) Explain why a simple regression analysis is not well suited for determining whether capital punishment has a deterrent effect on murders.
Unfortunately not all of the underlying assumptions needed for OLS are satisfied. In the example of murders explained by executions here are other variables which would be part of the error term that will affect both murders and executions, such as state population size. If we factored those in to our model it would be better, but currently it is not a good model. 


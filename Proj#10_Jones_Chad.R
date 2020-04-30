## Part 1. Learn to understand the significance level α in hypothesis testing.

## a) a) Generate a matrix "ss" with 1000 rows and 10 columns. 
## The elements of "ss" are random samples from standard normal distribution.

ss <- matrix(rnorm(10000, 0, 1), 1000, 10)

print(ss)
## b) Run the following lines:
  
mytest <- function(x) 
{
    
  return(t.test(x,mu=0)$p.value)
    
}
  
mytest(rnorm(100))

## Note that, when you input a vector in the function mytest, 
## you will get the p-value for the one sample t-test H0 : µ = 0 vs Ha : µ =/= 0.

## c) Conduct one sample t-test H0 : � = 0 vs Ha : � =/= 0 for each row of "ss". 
## (Hint: use either functions apply() or for() and a function  mytest())

p_value <- apply(ss, 1, mytest)
print(p_value)

  
## d) For the 1000 tests you conducted in c), what is the ratio of rejection if the 
## significance level  α = 0.05? How about α = 0.1 or 0.01?

# α = 0.05

ratio_reject_5 = length(p_value[which(p_value<=0.05)])/1000
print(ratio_reject_5)
## [1] 0.056

# α = 0.1

ratio_reject_1 = length(p_value[which(p_value<=0.1)])/1000
print(ratio_reject_1)
## [1] 0.107

# α = 0.01
ratio_reject_01 = length(p_value[which(p_value<=0.01)])/1000
print(ratio_reject_01)
## [1] 0.015

#########################################################################################################
## Part 2 Let's revisit the weight loss example in the lecture notes, 
## but change the data a little bit.

## a) Create a vector "weight.loss" with the elements below 
## (recall that negative values mean weight gain and positive values mean weight loss):

##                 -12,1.1,0.7,1.8,1.3,2.3,1.9,0.1,1.2,1.5   

weight.loss <- c(-12,1.1,0.7,1.8,1.3,2.3,1.9,0.1,1.2,1.5)

## b) Conduct one sample t-test H0: µ = 0 vs Ha: µ > 0 using  α = 0.05. Comment on the decision rule and conclusion.

t.test(weight.loss, alternative = "two.sided", mu = 0, var.equal = FALSE, conf.level = 0.95)
## 	One Sample t-test
## data:  weight_loss
## t = -0.0074254, df = 9, p-value = 0.9942
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##   -3.056493  3.036493
## sample estimates:
##   mean of x 
## -0.01

## Our calculated p-value = 0.9942 and because our p-value > 0.05, we fail to reject the null hypothesis
## Because the significance level of alpha = .05, we don't have enough evidence to conclude that the
## mean weight loss is not zero


## c) Conduct one sample Wilcoxon signed-rank test H0: m = 0 vs Ha: m > 0 using α = 0.05. 
## Comment on the decision rule and conclusion.

wilcox.test(weight.loss, alternative = "greater", mu = 0, conf.level = 0.95)

## Wilcoxon signed rank test
## data:  weight_loss
## V = 45, p-value = 0.04199
## alternative hypothesis: true location is greater than 0

## Our calculated p-value = 0.04199 < 0.05, therefore we reject the null hypothesis
## Because our alpha = 0.05, we have evidence to conclude that the mean weight loss is greater than 0


## d) Conduct one sample Kolmogorov-Smirnov test, where H0: the distribution is normal vs Ha: the distribution is not normal using α = 0.05. 
## Comment on the decision rule and conclusion.

ks.test(weight.loss, pnorm)

## 	One-sample Kolmogorov-Smirnov test
## data:  weight_loss
## D = 0.56433, p-value = 0.001559
## alternative hypothesis: two-sided

## Decision: p-value = 0.001559 < .05, therefor we reject H0
## Conclusion: At the alpha = 0.05 level of significance, we have sufficient evidence to conclude
## that the distribution of the population is NOT normal.

## Based upon the Kolmogorov-Smirnov test results, would you recommend using the T-test 
## or the Wilcoxon Signed Rank Test to test the hypothesis above (H0: mu = 0 vs. HA: mu =/= 0)?

## Since we concluded from the Kolmogorov-Smirnov test that the population was NOT normally
## distributed, we should use the Wilcoxon Signed Rank Test
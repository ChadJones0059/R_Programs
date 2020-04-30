## Draw 1000 samples from the following distributions and create histograms for each.  
## Be sure to comment about each histogram.  
## Remember all histograms should have four items addressed.

sample_n <- 1000

## X ~ N (0, 1) using rnorm function

pop_mean <- 0

std_dev <- 1

Norm <- rnorm(sample_n, pop_mean, std_dev)

hist(Norm, col = "blueviolet", xlab = "1000 Trials", main = "Normal Distribution")

## This histogram shows a normal distribution with a mean centered around 0 and a normal bell shaped curve

## X ~ Gamma(2, 3) using the rgamma function

alpha <- 2

beta <- 3

Gamma <- rgamma(sample_n, alpha, beta)

hist(Gamma, col = "cornflowerblue", xlab = "1000 Trials", main = "Gamma Distribution")

## This histogram shows a positively right skewed distribution of our sample numbers

## X+Y where X ~ N(5,2) and Y ??? ??2(15)  ## (Chi-Squared)

Norm_2 <- rnorm(sample_n, 5, 2)

Chi <- rchisq(sample_n, 15)   ## DF = 15

Mixed <- Norm_2 + Chi

hist(Mixed, col = "cyan", xlab = "1000 Trials", main = "Normal + Chi Distribution")

## This histogram shows that our distribution is almost symmetrical with a mean around 20

## X ~ Binomial(1, 0.3)

Binom <- rbinom(sample_n, 1, 0.3)

hist(Binom, col = "darkolivegreen1", xlab = "1000 Trials", main = "Binomial Distribution")

## This histogram shows only two bars where one bar is around 0 and the other is around 1

## Calculate a mean of a vector X = (X1, X2, ..., Xn ) 1000 times, where Xi ~ Binomial(1, 0.4) for n = 2, 5, 10, 20, 50, 100 
## and create a histogram of the means. Each n should be dealt with separately. 
## For example, you draw 1000 samples of size n = 2 (you may use for() loop for that). Every time a sample is drawn, you calculate its mean. 
## Once you end up with n means, you create a histogram of those means. Then repeat for n = 5, 10, etc.  
## There should be 6 separate histograms with comments for each.  Restrict the x-axis to stay at 0 to 1 for all plots.  
## Comment on the differences between plots as n increases

x1 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x1 <- rbinom(2, 1, 0.4)
  x1[i] <- mean(v_x1)
  mean(x1)
}
hist(x1, col = "lightgreen", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 2", xlim = c(0,1))

## This histogram shows us three bars around 0, 0.45, and 1

x2 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x2 <- rbinom(5, 1, 0.4)
  x2[i] <- mean(v_x2)
  mean(x2)
}
hist(x2, col = "limegreen", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 5", xlim = c(0,1))

## This histogram shows bars again, but with not much symmetry 

x3 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x3 <- rbinom(10, 1, 0.4)
  x3[i] <- mean(v_x3)
  mean(x3)
}
hist(x3, col = "seagreen1", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 10", xlim = c(0,1))

## This histogram is almost symmetrical and with a mean around 4 and a range from 0 to 0.9

x4 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x4 <- rbinom(20, 1, 0.4)
  x4[i] <- mean(v_x4)
  mean(x4)
}
hist(x4, col = "turquoise1", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 20", xlim = c(0,1))

## This histogram has a tighter spread and closer symmetry with a mean around 4 and a reduced spread

x5 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x5 <- rbinom(50, 1, 0.4)
  x5[i] <- mean(v_x5)
  mean(x5)
}
hist(x5, col = "steelblue1", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 50", xlim = c(0,1))

## This histogram has a tighter spread on the x-axis and a reduced spread on the x-axis between 0.2 and 0.7

x6 <- rep(0, sample_n)

for(i in 1:sample_n)
{
  v_x6 <- rbinom(100, 1, 0.4)
  x6[i] <- mean(v_x6)
  mean(x6)
}
hist(x6, col = "slateblue1", xlab = "Mean Number of Sucesses Per Trial", main = "Binomial Distribution, n = 100", xlim = c(0,1))

## This histogram has an even tighter spread and closer symmetry with a distribution between 0.2 and 0.6 on the x-axis

## We can see than as n increases, the binomial distribution starts to turn into a normal distribution
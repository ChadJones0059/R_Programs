## Draw 1000 samples from the following distributions and create histograms for each. 
## Be sure to comment about each histogram.

sample_n <- 1000

## a) X ~ N (5, 10) using rnorm function. (10pts)

pop_mean <- 5
std_dev <- 10

Norm <- rnorm(sample_n, pop_mean, std_dev)

hist(Norm, col = "blueviolet", xlab = "1000 Trials", main = "Normal Distribution")

## This histogram shows a normal distribution with a mean centered around 5 and a normal bell shaped curve

## b) X ~ Gamma(4, 8) using the rgamma function. (10 pts)

alpha <- 4
beta <- 8

Gamma <- rgamma(sample_n, alpha, beta)

hist(Gamma, col = "cornflowerblue", xlab = "1000 Trials", main = "Gamma Distribution")

## This histogram shows a positively right skewed distribution of our sample numbers

## c) X+Y where X ~ N(6,3) and Y ~ Chi-Squared (10). (15pts)

Norm_2 <- rnorm(sample_n, 6, 3)

Chi <- rchisq(sample_n, 10)   ## DF = 10

Mixed <- Norm_2 + Chi

hist(Mixed, col = "cyan", xlab = "1000 Trials", main = "Normal + Chi Distribution")

## This histogram shows that our distribution is almost symmetrical with a mean around 15

## d) X ~ Binomial(2, 0.5). (15 pts)

Binom <- rbinom(sample_n, 2, 0.5)

hist(Binom, col = "darkolivegreen1", xlab = "1000 Trials", main = "Binomial Distribution")

## This histogram shows only three bars where one bar is around 0 and the other is around 1 and the last around 2

##########################################################################################
## Part 2

## a) Load dataset sleep and open the description file. - 5 points hint: try data<-sleep.

data <- sleep

## b) Draw histogram for column "extra". Comment on the shape of the histogram. - 5 points

hist(sleep$extra, col = "mediumorchid2", main = "extra column")

summary(sleep$extra)

## Histogram appears to be skewed rightwards with a gap between 2 and 3.
## Shape is not uniform and has a plateu between -1 and 2
##    Min. 1st Qu.  Median  Mean  3rd Qu.    Max. 
## -1.600  -0.025   0.950   1.540   3.400   5.500 

## c) Define two vectors "x" and "y" as following:
##      x<-sleep$extra[1:10]
##      y<-sleep$extra[11:20]

x <- sleep$extra[1:10]
y <- sleep$extra[11:20]

## d) Conduct two-sample t-test to check whether the means of x and y are 
##    different. - 10 points. Hint: t.test(x,y,...)

print(t.test(x, y, alternative = "two.sided", paired = TRUE))
print(t.test(x, y, alternative = "two.sided", paired = TRUE)$p.value)

## [1] 0.00283289
## At alpha = .05 significance level, we have sufficient evidence to conclude that
## the means of x and y are significantly different

## e) Conduct two-sample Wilcoxon signed-rank test to check whether the 
##    medians of x and y are significantly different. - 10 points. Hint: wilcox.test(x,y,...)

print(wilcox.test(x, y, paired = TRUE))
print(wilcox.test(x, y, paired = TRUE)$p.value)

## [1] 0.009090698
## At alpha = .05 significance level, we have sufficient evidence to conclude that the
## medians of x and y are signficantly different

## f) Define a vector "z" as following:
##      z<-x-y

z <- x-y

## g) Conduct one-sample t-test to check whether the mean of z is significantly 
##    different from 0. - 10 points

print(t.test(z, alternative = "two.sided", mu = 0))
print(t.test(z, alternative = "two.sided", mu = 0)$p.value)

## [1] 0.00283289
## At alpha = .05 significance level, we have sufficient evidence to conclude that the
## mean of z is significantly different from 0 

## h) Conduct one-sample Wilcoxon signed-rank test to check whether the 
## medians of z is significantly different from 0. - 10 points

print(wilcox.test(z, alternative = "two.sided", md = 0))
print(wilcox.test(z, alternative = "two.sided", md = 0)$p.value)

## [1] 0.009090698
## At alpha = .05 significance level, we have sufficient evidence to conclude that the
## median of z is significantly different from 0

summary(z)

## Min. 1st Qu.  Median    Mean   3rd Qu.    Max. 
## -4.60   -1.70   -1.30   -1.58   -1.05    0.00 

## The 2-sided paired T-test and the Wilcox tests generate the same
## p-value as the one-sided T-test and Wilcox tests.
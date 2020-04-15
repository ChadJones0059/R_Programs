## A regional manager is interested in the monthly sales for each store.  He also wants to see how the stores are performing.  

## Create a scatterplot of revenue versus month with correct titles for the plot. Comment on your plot. What do you observe?
setwd("C:/Users/Jones/Desktop/VCU/Spring2020/STAT 321/Project 8")

getwd()

library(rio)

sales <- import("StoreSales.csv")

plot(sales$Month, sales$Revenue, xlab = "Month", ylab = "Revenue", 
     main = "Stores by Month and Revenue")

## Most of the years revenue between stores are evenly distributed, but sales drastically increased in month 12 (December)
## Month 4 (April) seems to have the lowest revenue for the year.

## Create a wide dataset with each row corresponding to a store and the remaining columns are the monthly revenue values.

library(reshape2)

rev_by_store <- dcast(sales, Store ~ Month, fill = NULL, drop = FALSE, value.var = "Revenue")

## subset the data by months

m1 <- sales[sales$Month == 1,c(1:3)]
m2 <- sales[sales$Month == 2,c(1:3)]
m3 <- sales[sales$Month == 3,c(1:3)]
m4 <- sales[sales$Month == 4,c(1:3)]
m5 <- sales[sales$Month == 5,c(1:3)]
m6 <- sales[sales$Month == 6,c(1:3)]
m7 <- sales[sales$Month == 7,c(1:3)]
m8 <- sales[sales$Month == 8,c(1:3)]
m9 <- sales[sales$Month == 9,c(1:3)]
m10 <- sales[sales$Month == 10,c(1:3)]
m11 <- sales[sales$Month == 11,c(1:3)]
m12 <- sales[sales$Month == 12,c(1:3)]

## change the name of the column to revenue 1,2,3,..12 by each month

names(m1)[2] <- "Revenue1"
names(m2)[2] <- "Revenue2"
names(m3)[2] <- "Revenue3"
names(m4)[2] <- "Revenue4"
names(m5)[2] <- "Revenue5"
names(m6)[2] <- "Revenue6"
names(m7)[2] <- "Revenue7"
names(m8)[2] <- "Revenue8"
names(m9)[2] <- "Revenue9"
names(m10)[2] <- "Revenue10"
names(m11)[2] <- "Revenue11"
names(m12)[2] <- "Revenue12"

## create a wide dataset with each row corresponding to a store and the remainig columns are the monthly revenue values

store2 <- merge(m1,m2, by = "Store")
store3 <- merge(store2,m3, by = "Store")
store4 <- merge(store3,m4, by = "Store")
store5 <- merge(store4,m5, by = "Store")
store6 <- merge(store5,m6, by = "Store")
store7 <- merge(store6,m7, by = "Store")
store8 <- merge(store7,m8, by = "Store")
store9 <- merge(store8,m9, by = "Store")
store10 <- merge(store9,m10, by = "Store")
store11 <- merge(store10,m11, by = "Store")
store12 <- merge(store11,m12, by = "Store")

## create a dataset to separate each store and its revenue


Storesales1 <- sales[sales$Store=="NM0034",]
Storesales2 <- sales[sales$Store=="NE0041",]
Storesales3 <- sales[sales$Store=="SC0345",]
Storesales4 <- sales[sales$Store=="NM0331",]
Storesales5 <- sales[sales$Store=="SC0001",]
Storesales6 <- sales[sales$Store=="SC0041",]
Storesales7 <- sales[sales$Store=="NC0041",]
Storesales8 <- sales[sales$Store=="VA0031",]
Storesales9 <- sales[sales$Store=="RI0031",]
Storesales10 <- sales[sales$Store=="MA0041",]
Storesales11 <- sales[sales$Store=="NM0004",]
Storesales12 <- sales[sales$Store=="NM0003",]
Storesales13 <- sales[sales$Store=="MA0044",]
Storesales14 <- sales[sales$Store=="ME0003",]

names(rev_by_store) <- c("Store_ID", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
                         "Aug", "Sep", "Oct", "Nov", "Dec")


## Create a summary of revenues for each store.  Note that summaries must include Mean, Median, Standard Deviation, IQR, Min, Max, Q1 and Q3.  
## Be sure to put these in the comments of your code.

Sum1<-summary(Storesales1$Revenue) ## summary function does not include sd and IQR
sd(Storesales1$Revenue) ## sd function
IQR(Storesales1$Revenue) ## IQR function

Sum2<-summary(Storesales2$Revenue)
sd(Storesales2$Revenue)
IQR(Storesales2$Revenue)

Sum3<-summary(Storesales3$Revenue)
sd(Storesales3$Revenue)
IQR(Storesales3$Revenue)

Sum4<-summary(Storesales4$Revenue)
sd(Storesales4$Revenue)
IQR(Storesales4$Revenue)

Sum5<-summary(Storesales5$Revenue)
sd(Storesales5$Revenue)
IQR(Storesales5$Revenue)

Sum6<-summary(Storesales6$Revenue)
sd(Storesales6$Revenue)
IQR(Storesales6$Revenue)

Sum7<-summary(Storesales7$Revenue)
sd(Storesales7$Revenue)
IQR(Storesales7$Revenue)

Sum8<-summary(Storesales8$Revenue)
sd(Storesales8$Revenue)
IQR(Storesales8$Revenue)

Sum9<-summary(Storesales9$Revenue)
sd(Storesales9$Revenue)
IQR(Storesales9$Revenue)

Sum10<-summary(Storesales10$Revenue)
sd(Storesales10$Revenue)
IQR(Storesales10$Revenue)

Sum11<-summary(Storesales11$Revenue)
sd(Storesales11$Revenue)
IQR(Storesales11$Revenue)

Sum12<-summary(Storesales12$Revenue)
sd(Storesales12$Revenue)
IQR(Storesales12$Revenue)

Sum13<-summary(Storesales13$Revenue)
sd(Storesales13$Revenue)
IQR(Storesales13$Revenue)

Sum14<-summary(Storesales14$Revenue)
sd(Storesales14$Revenue)
IQR(Storesales14$Revenue)

Sum1
sd(Storesales1$Revenue)
IQR(Storesales1$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1541627 1633940 1670653 1758293 1766750 2705793  307288.4    132810.2

Sum2
sd(Storesales2$Revenue)
IQR(Storesales2$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
##  1549432 1680505 1706902 1763524 1765550 2412215   217042.9  85045.07

Sum3
sd(Storesales3$Revenue)
IQR(Storesales3$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
##  1458647 1580413 1641650 1684606 1688573 2415358   245318.9  108160.2

Sum4
sd(Storesales4$Revenue)
IQR(Storesales4$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
##  1940277 2031838 2112982 2161467 2185176 2826570  229514.1   153338.3

Sum5
sd(Storesales5$Revenue)
IQR(Storesales5$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1605479 1663882 1699951 1755348 1768147 2341589  197305.3    104264.4

Sum6
sd(Storesales6$Revenue)
IQR(Storesales6$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1595935 1614426 1674327 1739878 1765870 2404866  221901.7    151444.3

Sum7
sd(Storesales7$Revenue)
IQR(Storesales7$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1538689 1590793 1634213 1726232 1733783 2452462 249654.9    142989.5

Sum8
sd(Storesales8$Revenue)
IQR(Storesales8$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1470841 1577802 1677447 1705482 1737004 2378423  241826.6    159201.6

Sum9
sd(Storesales9$Revenue)
IQR(Storesales9$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1515876 1574373 1654064 1698196 1667253 2458571  252218.8    92880.15

Sum10
sd(Storesales10$Revenue)
IQR(Storesales10$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1596073 1646386 1687540 1773216 1752071 2676496  292648.4    105684.8

Sum11
sd(Storesales11$Revenue)
IQR(Storesales11$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1542016 1640866 1669338 1731194 1701121 2507212  251985.8    60255.12

Sum12
sd(Storesales12$Revenue)
IQR(Storesales12$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1491877 1616153 1679170 1734061 1728049 2560826  72780.7     111896.4

Sum13
sd(Storesales13$Revenue)
IQR(Storesales13$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1556242 1686696 1738690 1791352 1787414 2608373  271824.1    100717.7

Sum14
sd(Storesales14$Revenue)
IQR(Storesales14$Revenue)

##   Min.   1st Qu. Median  Mean   3rd Qu.  Max.      SD          IQR   
## 1468065 1608150 1637824 1720529 1733007 2468168  255887.4    124856.3



#######################################################################################
################################ Alternative Method ###################################
#######################################################################################

##### rev_summary <- apply(rev_by_store[,c(2:13)], 1, summary)
##### colnames(rev_summary) <- c(rev_by_store$Store_ID)

##### rev_summary_df <- data.frame(rev_summary)

##### add the Std Dev and IQR into columns 

##### rev_by_store$SD = apply(rev_by_store[,c(2:13)], 1, sd)
##### rev_by_store$IQR = apply(rev_by_store[,c(2:13)], 1, IQR)

##### print(rev_summary_df)
##### print(rev_by_store)

##          MA0041  MA0044    ME0003    NC0041    NE0041    NM0003    NM0004    NM0034    NM0331    RI0031    SC0001    SC0041    SC0345    VA0031
## Min.    1596073  1556242   1468064   1538689   1549432   1491877   1542016   1541627   1940277   1515876   1605479   1595935   1458647   1470841
## 1st Qu. 1646386  1686696   1608150   1590793   1680505   1616153   1640866   1633940   2031838   1574373   1663882   1614426   1580413   1577802
## Median  1687540  1738690   1637824   1634213   1706901   1679170   1669338   1670653   2112982   1654064   1699951   1674327   1641650   1677447
## Mean    1773216  1791352   1720529   1726232   1763524   1734061   1731194   1758293   2161466   1698196   1755348   1739878   1684606   1705482
## 3rd Qu. 1752071  1787414   1733007   1733783   1765550   1728049   1701121   1766750   2185176   1667253   1768147   1765870   1688573   1737004
## Max.    2676496  2608373   2468168   2452462   2412215   2560826   2507212   2705793   2826570   2458571   2341589   2404866   2415358   2378423
## SD      292648.4 271824.1  255887.4  249654.9  217042.9  272780.7  251985.8  307288.4  229514.1  252218.8  197305.3  221901.7  245318.9  241826.6
## IQR    105684.83 100717.72 124856.29 142989.54 85045.07  111896.42 60255.12  132810.19 153338.29 92880.15  104264.41 151444.30 108160.19 159201.62



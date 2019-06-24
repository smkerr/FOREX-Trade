# FOREX-Trade
## This project examines the effects of the U.S. dollar/Japanese yen exchange rate on the U.S.-Japan bilateral trade balance.

# Load packages
library(RCurl)
library(vars)

# Read csv file into data frame
x <- getURL("https://raw.githubusercontent.com/smkerr/FOREX-Trade/master/FOREX-Trade_Data.csv")
FOREX_Trade.data <- read.csv(text = x)

# Create time-series objects from data set
FOREX_JP <- ts(FOREX_Trade.data$FOREX_JP, start = c(1985,1), end = c(2019, 2),frequency = 12)
BAL_JP <- ts(FOREX_Trade.data$BAL_JP, start = c(1985,1), end = c(2019, 2),frequency = 12)

# Plot USD/JPY FOREX and U.S.-Japan trade data  
plot(FOREX_JP, xlab = "Year", ylab = "USD/JPY Exchange Rate", bty = "l", main = "Time Series: USD/JPY Exchange Rate")
plot(BAL_JP, xlab = "Year", ylab = "U.S.-Japan Trade Balance", bty = "l", main = "Time Series: U.S.-Japan Trade Balance")

# Eliminate objects with missing values  
CurrencyWar.data <- cbind(FOREX_JP, BAL_JP)
CurrencyWar2.data <- na.omit(CurrencyWar.data)

# Obtain information criteria for VAR selection 
VARselect(CurrencyWar2.data, lag.max = 10)

# Estimate VAR(3) by OLS per equation
JP.VAR <- VAR(CurrencyWar2.data, p = 3)
summary(JP.VAR)

# Perform a test for Granger causality
grangertest(FOREX_JP ~ BAL_JP, order = 3)
grangertest(BAL_JP ~ FOREX_JP, order = 3)

# Plot impulse response coefficients of VAR system 
## Due to different scales of FOREX and trade data, two sets of plots are required to observe both 
plot(irf(JP.VAR),ylim = c(-1,1))
plot(irf(JP.VAR))

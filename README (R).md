# FOREX-Trade
This project examines the effects of the U.S. dollar/Japanese yen exchange rates on U.S.-Japantrade balances.

# Load package
library(vars)

# Read csv file into data frame
library(RCurl)
x <- getURL("https://raw.github.com/smkerr/FOREX-Trade/master/FOREX-Trade_Data.csv")
Trade.data <- read.csv(text = x)

US_Trade.data <- read.csv("/Users/Steve/Desktop/410/Thesis/US_CURRENCY_TRADE.csv")
View(US_Trade.data)

FOREX_JP <- ts(US_Trade.data$FOREX_JP, start = c(1985,1), end = c(2019, 2),frequency = 12)
BAL_JP <- ts(US_Trade.data$BAL_JP, start = c(1985,1), end = c(2019, 2),frequency = 12)

FOREX_JP
BAL_JP

plot(FOREX_JP, xlab = "Year", ylab = "USD/JPY Exchange Rate", bty = "l", main = "Time Series: USD/JPY Exchange Rate")
plot(BAL_JP, xlab = "Year", ylab = "U.S.-Japan Trade Balance", bty = "l", main = "Time Series: U.S.-Japan Trade Balance")

# Japan
CurrencyWarJP <- cbind(FOREX_JP, BAL_JP)
CurrencyWarJP
FOREX_BAL_JP <- na.omit(CurrencyWarJP)
FOREX_BAL_JP
VARselect(FOREX_BAL_JP, lag.max = 10)

JP_VAR <- VAR(FOREX_BAL_JP, p = 3)
summary(JP_VAR)

grangertest(FOREX_JP ~ BAL_JP, order = 3)
grangertest(BAL_JP ~ FOREX_JP, order = 3)

plot(irf(JP_VAR),ylim = c(-1,1))
plot(irf(JP_VAR))

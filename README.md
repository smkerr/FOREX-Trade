# FOREX-Trade
This project examines the effects of the U.S. dollar/Japanese yen exchange rate on the U.S.-Japan bilateral trade balance. Since taking office, President Trump has accused a number of foreign governments of engaging in currency manipulation to boost their respective economies at the expense of American firms. Rather than debate the validity of President Trump’s claims, I work to examine historical U.S. dollar-Japanese yen (USD/JPY) exchange rates and U.S.-Japan bilateral trade data in order to determine the degree to which fluctuations in foreign exchange rates help to predict the United States’ bilateral trade balance with Japan. 

# Data
Monthly Country and Product Trade Data detailing the amount (in USD) of U.S. exports and imports by country was retrieved from the United States Census Bureau (United States Census Bureau 2019). Data for the U.S.-Japan bilateral trade balance was available dating back to 1985. Due to the fact that bilateral trade balances between the United States and Japan were not explicitly listed in the data, trade balances were calculated by subtracting the total amount of U.S. imports
from Japan from the total amount of U.S. exports to Japan for a given year.

Monthly U.S. Foreign Exchange Rate data was obtained from the Federal Reserve Economic
Database (FRED) for the USD/JPY.

# Methodology 
I employ a vector autoregression (VAR) system to conduct both a Granger test and an impulse response analysis to discover whether any causal relationship exists between our two variables. 

# Conclusion 
Ultimately, the analysis fails to establish the USD/JPY exchange rate as a reliable predictor of the U.S.-Japan trade balance, illustrating that the relationship between foreign exchange rates

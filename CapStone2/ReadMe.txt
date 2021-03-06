** Folders: **
1) Reports: Contains itinial ideas, proposals, progress reports and slides
2) Data_CSV : Contains intermediat data files generated from wrangling data
3) Data_Twitter: Contains raw json content downloaded from Twitter web api
4) Stock_Price: Contains stock price historical data from yahoo finance website


** Notebooks: **

1. Data Gathering
1) https://github.com/yulmee/springboard/blob/master/CapStone2/Get_Twitter_Feed_Full_Archive_WC.ipynb
(Read data from api and store in text file)
2) https://github.com/yulmee/springboard/blob/master/CapStone2/Store_twitter_data_in_Pymongo.ipynb
(read data from text file and store in MongoDB)

2. Wrangling and clean up
1) https://github.com/yulmee/springboard/blob/master/CapStone2/Wrangle_data_in_Pymongo.ipynb
(read data from MongoDB and clean up data)

3. Sentiment Analysis
1) https://github.com/yulmee/springboard/blob/master/CapStone2/Sentiment_Analysis_Twitter_Vader.ipynb 
    Using Vader package. 
2) https://github.com/yulmee/springboard/blob/master/CapStone2/Sentiment_Analysis_Twitter_TextBlob.ipynb
    Using TextBlob package. 

EDA
1) https://github.com/yulmee/springboard/blob/master/CapStone2/Stock_Prices.ipynb 
    Stock price
2) https://github.com/yulmee/springboard/blob/master/CapStone2/Stock_Prices-Difference.ipynb
    Changes in stock price from each day. 
2) https://github.com/yulmee/springboard/blob/master/CapStone2/Explore_data_in_Pymongo_Twitter.ipynb
    Twitter sentiment analysis data 

Modeling
1) https://github.com/yulmee/springboard/blob/master/CapStone2/Sentiment_Analysis_Twitter_Explore_Stock_and_Twitter.ipynb 
2) https://github.com/yulmee/springboard/blob/master/CapStone2/Sentiment_Analysis_Twitter_Explore_with_bootstrap-and_weighting-against_stock_price.ipynb
   Regression for stock price using sentiment scores as predictor variables.
3) https://github.com/yulmee/springboard/blob/master/CapStone2/Sentiment_Analysis_Twitter_Explore_with_bootstrap-and_weighting-against_stock_price-difference.ipynb
   Regression for stock price changes using sentiment scores as predictor variables.

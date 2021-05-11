## Datasets

1. Twitter Sentiment Analysis:
	- [Reference](https://www.kaggle.com/crowdflower/twitter-airline-sentiment)
	- About the dataset: A sentiment analysis job about the problems of each major U.S. airline. Twitter data was scraped from February of 2015 and contributors were asked to first classify positive, negative, and neutral tweets, followed by categorizing negative reasons (such as "late flight" or "rude service").
	- Size: 8MB
	- Also available as a SQLite database
	- Code for import: `pd.read_csv('data/Tweets.csv', header=True)`
	- Alternatively, use SQLite:
	```python
	import pandas as pd
	import sqlite3

	# Read sqlite query results into a pandas DataFrame
	con = sqlite3.connect("data/portal_mammals.sqlite")
	df = pd.read_sql_query("SELECT * from surveys", con)

	# Verify that result of SQL query is stored in the dataframe
	print(df.head())

	con.close()
	```
2. Breast cancer

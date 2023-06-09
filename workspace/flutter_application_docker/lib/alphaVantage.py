import requests
import json
# Se debe importar websocket para hacerlo con èl


ALPHAVANTAGE_API_KEY= 'R4DL9NMJNFPX0OKV'

# replace the "demo" api key below with your own key from https://www.alphavantage.co/support/#api-key
url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey={ALPHAVANTAGE_API_KEY}'
r = requests.get(url)

input = r.json()

fileName = 'data.json'
# 3. Write json file

f = open(fileName, "w")

json.dump(input, f)

f.close()

print(input)
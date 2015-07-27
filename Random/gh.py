###Open a Github repo from the command line by passing the repo name as an argument. 

import json
import requests
import sys
import webbrowser

name = sys.argv[1]

url = "https://api.github.com/search/repositories?q=%s&fork=false&in=html_url&order=desc" % name

try:
    data = requests.get( url)
except requests.exceptions.RequestException as e:
    print e
    sys.exit(1)

x = data.json()
print x["items"][0]["html_url"]
repo = x["items"][0]["html_url"]
webbrowser.open(repo)

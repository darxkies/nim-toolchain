import httpclient
import json
import strformat
import re

var client = newHttpClient()

let fruit = client.getContent("https://support.oneskyapp.com/hc/en-us/article_attachments/202761627/example_1.json").parseJson()["fruit"]

let regex = re"pp"

echo fmt"Fruit: {fruit}"

let newFruit = fruit.getStr().replace(regex, "bb")

echo fmt"New Fruit: {newFruit}"


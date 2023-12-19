import re

text = "Your input text here hello word and more text"
pattern = r'hello word'

match = re.search(pattern, text)
if match:
    print("Found:", match.group())
else:
    print("Not found")
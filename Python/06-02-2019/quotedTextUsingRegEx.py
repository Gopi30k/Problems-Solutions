#EXTRACTING TEXT QUOTED WITHING STRINGS USING REGEX

import re
regex=r"[(\")|(\')][a-z]*[(\")|(\')]"
reg=r"[(\")(\')].*?[(\")|(\')]"
m=re.search(regex,"gopi is in \"quoted\"")
print m.group(0)
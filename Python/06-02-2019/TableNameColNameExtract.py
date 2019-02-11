#EXTRACTING TABLE NAME AND COLUMN NAMES OF AN SQL QUERY USING REGEX

import re
sqlQuery="Create Table ADDR(name varchar[10], age integer[2], location text, current_time date-fromat('YYYY-MM-DD'))"
tl= re.split(r'\((.*)\)',sqlQuery)
newL= tl[1].split()
colnames=[]
for i in range(len(newL)):
    if i%2==0:
        colnames.append(newL[i])
#print colnames
tList=tl[0].split()
print 'Table Name-{}\nColnames {}'.format(tList[-1],colnames)
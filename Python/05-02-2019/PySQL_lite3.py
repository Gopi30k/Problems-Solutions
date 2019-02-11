import csv
import sqlite3
conn=sqlite3.connect('one.db')
print 'db Created'
with open('values.csv', 'r') as csvFile:
    reader = csv.reader(csvFile)
    datavalues=[]
    for row in reader:
        datavalues.append((tuple(row)))
fd=open('DataQuery.sql','r')
sqlFile = fd.read()
crsr = conn.cursor()
sqlCommands = sqlFile.split(';')
for command in sqlCommands:
     try:
         if 'INSERT' in command:
                crsr.executemany(command,datavalues)
                print datavalues
         else:
             crsr.execute(command)
         conn.commit()
     except Exception:
         print "Command skipped: "

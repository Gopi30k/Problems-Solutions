import csv
import sqlite3
conn=sqlite3.connect('app.db')
print 'db Created'
fd=open('DataAppSql.sql','r')
sqlFile = fd.read()
crsr = conn.cursor()
sqlCommands = sqlFile.split(';')
#print sqlCommands
for command in sqlCommands:
     try:
         crsr.execute(command)
         conn.commit()
     except Exception:
         print "Command skipped: "+command
get_y_n=input('Enter 1. To fetch from dept table \n 2. to fetch from emp table\n')
f=open('Table.txt','w')
if get_y_n==1:
    crsr.execute("Select * from dept")
for i in crsr.fetchall():
    print i
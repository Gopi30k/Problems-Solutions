import mysql.connector as m
fd=open('Student_montly_report.sql','r')
sqlFile = fd.read()
sqlCommands = sqlFile.split(';')
print sqlCommands
import mysql.connector
import pandas as pd
fd=open('TestSQL.sql','r')
sqlFile = fd.read().replace('\n','')
#sqlcommands=sqlFile.split(';')
# temp=[]
# keyindex=[]
# valindex=[]
# for i in sqlcommands:
#     temp.append(i.split('::'))
# print temp
# sqlcommands=sqlFile.split(';')
# print sqlcommands
# lval=[]
# for i in sqlcommands:
#     dict(i.split(':'))
# cnx = mysql.connector.connect(user='root', password='root',
# 								  host='localhost',database='Student_monthly_report')
# query = open('Student_monthly_report.sql', 'r')
# DF = pd.read_sql_query(query.read(),cnx)
#
# print DF
#print dict(x.split(':') for x in sqlFile.split(';'))

sqlcmds=sqlFile.split(';')
sqlcmds.pop()




query_strs={}
query_strs=dict(i.split(':') for i in sqlcmds)




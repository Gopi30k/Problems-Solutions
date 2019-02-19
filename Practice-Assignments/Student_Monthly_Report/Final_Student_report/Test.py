fd=open('TestSQL.sql','r')
sqlFile = fd.read()
sqlcommands=sqlFile.split(';')
temp=[]
keyindex=[]
valindex=[]
for i in sqlcommands:
    temp.append(i.split('::'))
print temp[0]
x=len(temp)-1
print x
for i in temp:
    if(x==0):
        break
    else:
        keyindex=i[x][0]
        valindex=i[x][1]

        x-=1
print keyindex
print valindex
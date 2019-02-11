#SEPERATING SCHEMA NAME AND TABLE NAME FROM STRING USING REGEX

import re
string="Provider data is in ccq_view_INT.Prov.Provider address data is in ccw_view_SYS.prov_adrress."
valsList= re.split('[\.]*[\.]',string)
tabname=[]
schemaname=[]
dList=[]
for i in range(len(valsList)):
    if i%2!=0:
        tabname.append(valsList[i])
    else:
        sent = re.split(" ", valsList[i])
        schemaname.append(sent[-1])

a=zip(schemaname,tabname)
for i in a:
    print i
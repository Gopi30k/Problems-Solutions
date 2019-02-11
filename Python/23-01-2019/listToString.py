list1=['gopi',11634007,'g.krishnan.gajendran',22.8]
#
# str1=','.join(list1)
# print str1
print str(list1).strip('[]')
print ','.join(map(str,list1))

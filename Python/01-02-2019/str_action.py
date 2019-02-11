#SEPERATE STRING AND NUMBERS USING TRY AND EXCEPT
str1='aaabb2321bhj'
list1=[]
list2=[]
for i in str1:
	try:
		j=int(i)
		list1.append(j)
	except:
		list2.append(i)
print (list1,list2)
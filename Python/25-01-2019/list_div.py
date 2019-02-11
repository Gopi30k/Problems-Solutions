list1=[1,2,3,4,5]
list2=[1,0,2,0,3]
zero_indx=[]
for i in range(0,len(list1)):
	try:
		list1[i]/list2[i]
	except:
		zero_indx.append(i)
print zero_indx
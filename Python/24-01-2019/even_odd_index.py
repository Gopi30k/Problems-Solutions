#SEPERATING EVEN AND ODD INDEX FROM LIST AND LIST SUBTRACTION 

str1='cccenturee'
list1=list(str1)
list_even_index=list1[::2]
list_odd_index=list1[1::2]
#list_odd_index=[i for i in list1 if i not in list_even_index] 
print list_even_index
print list_odd_index
#out_list=[i for i in list_even_index if i not in list_odd_index ]
out_list=[]
if len(list_even_index)<len(list_odd_index):
	length=len(list_even_index)
else:
	length=len(list_odd_index)
count=0
for i in range(length):
	count+=1
	if list_even_index[i]==list_odd_index[i]:
		continue
	else:
		out_list.append(list_even_index[i])
		out_list.append(list_odd_index[i])
while len(list_odd_index)!=count:
	out_list.append(list_odd_index[count])
	count+=1
while len(list_even_index)!=count:
	out_list.append(list_even_index[count])
	count+=1

print out_list
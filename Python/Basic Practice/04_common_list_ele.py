
def func1(a,b):
	ret_list=[]
	for i in a:
		for j in b:
			if i==j and i not in ret_list:
				ret_list.append(i)
	print ret_list

def func2(a,b):
	print set(a) & set(b)

def func3(a,b):
	temp_list=[]
	ret_list=[i for i in a for j in b if i==j and i not in temp_list]
	print ret_list
	
	
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
func1(a,b)
func2(a,b)
func3(a,b)
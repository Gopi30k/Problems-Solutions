def findAnEven(l):
	for i in l:
		if i%2==0:
			return i
			break
	else:
		raise ValueError			
try:
	get_list=[int(x) for x in input().split()]
	print ('First Even number found : ',findAnEven(get_list))
except ValueError:
	print 'No Even Number found in the list'
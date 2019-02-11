def sumDigits(s): 
	sum=0
	for i in s:
		if i.isdigit():
			sum=sum+int(i)
	return sum
try:
	print sumDigits('a2b3c')
except:
	print 'ERR'

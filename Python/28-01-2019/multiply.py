#PRINT MULTIPLICATION TABLES
num=raw_input('Enter Multiplication table number')

if num.isdigit():
	num=int(num)
	lim=raw_input('Enter limit range of table')
	if lim.isdigit():
		lim=int(lim)
		for i in range(1,lim+1):
			print('{0} x {1} ='.format(num,i),num*i)
	else:
		print 'Enter Limit range in Number Format only'
else:
	print 'Enter Multiplication Table number in Number Format only'
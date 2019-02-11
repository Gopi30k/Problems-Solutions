def factI(n):
	fact=1
	for i in range(1,n+1):
		fact=fact*i
	return fact
def factR(n):
	if n==0:
		return 1
	else:
		return n*factR(n-1)

f_inp=input('Enter a number to find its factorial: ')
print factI(f_inp)
print factR(f_inp)
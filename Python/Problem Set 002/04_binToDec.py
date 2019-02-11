#METHOD1 USING INT
def func1(binp):
	sum=0
	i=0
	while binp!=0:
		rem=binp%10
		sum=sum+(2**i)*rem
		binp/=10
		i+=1
	return sum
#METHOD2 USING STRING
def func2(binp):
	sum=0
	length=len(binp)-1
	for i in binp:
		sum+=int(i)*(2**length)
		length-=1
	return sum

binary_inp=raw_input('Enter a binary Input')
print ('METHOD1 using int',func1(int(binary_inp)))
print ('METHOD2 using String',func2(binary_inp))
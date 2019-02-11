#PROGRAM TO PRINT SUM OF DIGITS ENTERED
inp_dig=input('Enter any number of your choice to find its sum')
sum=0
temp=inp_dig
while temp!=0:
	rem=temp%10
	sum+=rem
	temp/=10
print ('Sum of digits of {0}'.format(inp_dig),sum)
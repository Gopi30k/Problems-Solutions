def gcd(num1,num2):
	if(num2!=0):
		return gcd(num2,num1%num2)
	else:
		return num1
def gcd1(num1,num2):
	while num1!=num2:
		if(num1>num2):
			num1-=num2
		else:
			num2-=num1
	return num1
num1=input("Enter Number 1 ")
num2=input("Enter Number 2 ")
print ('1.GCD OF {0} and {1} is '.format(num1,num2),gcd(num1,num2))
print ('2.GCD OF {0} and {1} is '.format(num1,num2),gcd1(num1,num2))
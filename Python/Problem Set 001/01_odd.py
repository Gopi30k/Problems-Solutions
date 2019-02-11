#Q1:Write a program that examines three variables—x, y, and z— and prints the largest odd number among them.
#If none of them are odd, it should print a message to that effect.

#METHOD 1 <using List>
def func1(x,y,z):
	print '\n using List'
	inp_list=[x,y,z]
	odd_list=[]
	for i in inp_list:
		if i%2!=0:
			odd_list.append(i)
	if odd_list.count==0:
		print 'No odd Numbers Found'
	else:
		print 'Odd numbers are :' + str(odd_list) + '\nMax Odd Number is '+ str(max(odd_list))
	print '\n using List Comprehension'	
#METHOD 2 <using List Comprehension>
def func2(x,y,z):
		inp_list=[x,y,z]
		odd_list=[i for i in inp_list if i%2!=0]
		if odd_list.count==0:
			print 'No odd Numbers Found'
		else:
			print 'Odd numbers are :' + str(odd_list) + '\nMax Odd Number is '+ str(max(odd_list))
		print '\n'	
		

		
x=input('Enter Num1 ')
y=input('Enter Num2 ')
z=input('Enter Num3 ')

func1(x,y,z)
func2(x,y,z)

#Q3.Write a program that asks the user to input 10 integers, and then prints the largest odd number that was entered.
#If no odd number was entered, it should print a message to that effect.
'''numbers=[int(numbers) for numbers in raw_input("Enter 10 Integers ").split()]
print numbers'''

'''num = []
for i in xrange(1, 10):
    num.append(raw_input('Enter the '+str(i)+' number: '))'''

user_integer=[int(raw_input('Enter the '+str(i)+' number: ')) for i in xrange(1, 11) ]
print user_integer

odd_list=[i for i in user_integer if i%2!=0]
if odd_list.count==0:
	print 'No odd Numbers Found'
else:
	print 'Odd numbers are :' + str(odd_list) + '\nMax Odd Number is '+ str(max(odd_list))
		
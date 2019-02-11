#Q5.Write a program that asks the user to enter an integer and prints two integers, root and pwr, such that 0 < pwr < 6 and root**pwr is equal to the integer entered by the user.
#If no such pair of integers exists, it should print a message to that effect.

from __future__ import division
import mathinp1=input('Enter an integer')
'''sqroot=inp1**(1/3)
x=int(sqroot)
print x**3
if x**3==inp1:
	print ('found')'''
	

for i in range(1,6):
	sqroot=inp1**(1/i)
	print('For ',i)
	
	if int(sqroot)**i==inp1:
		print ("\t\troot-{0}\tpwr-{1}".format(sqroot,i))
	else:
		print 'not found'
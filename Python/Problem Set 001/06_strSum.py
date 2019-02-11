#Let s be a string that contains a sequence of decimal numbers separated by commas, e.g., s = '1.23,2.4,3.123'. 
#Write a program that prints the sum of the numbers in s.

s = '1.23,2.4,3.123'
out_sum=0.0
x=[float(fl) for fl in s.split(',')]
for i in x:
	out_sum=out_sum+i
print out_sum
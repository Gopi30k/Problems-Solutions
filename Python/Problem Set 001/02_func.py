#Q2.Python provides a built-in function called len that returns the length of a string, so the value of len('Cigna') is 5.
#Write a function named right_justify that takes a string named s as a parameter and prints the string with enough leading spaces so that 
#the last letter of the string is in column 70 of the display.

#METHOD1:with inbuilt func
def right_justify(string_par):
	print string_par.rjust(70)
#METHOD2:without inbuilt Func
def right_justify2(str2):
	print ' '*70 + str2
right_justify('cigna')
right_justify2('cigna')


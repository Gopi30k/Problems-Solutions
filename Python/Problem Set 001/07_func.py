#Q7.Write a function isIn() that accepts two strings as arguments and returns True if either string occurs anywhere in the other, and False otherwise.
#Hint: you might want to use the built-in str operation in
def isln(str1,str2):
	if str1.find(str2)>=0:
		return True
	else:
		return False
		
str1=raw_input("Enter String 1")
str2=raw_input("Enter String 2")
print isln(str1,str2)
#Q8.Implement a function that satisfies the specification. Use a try-except block.

#def getRatios(vect1, vect2):
	#"""Assumes: vect1 and vect2 are lists of equal length of numbers
	#Returns: a list containing the meaningful values of
	#vect1[i]/vect2[i]"""

def getRatios(vect1, vect2):
	vect3=[]
	for i in range(0,len(vect1)):
		vect3.append(vect1[i]/vect2[i])
	return vect3
try:
	print getRatios([1,2,78,32,85],[1,43,45,98,0])
except ZeroDivisionError:
	print 'ZeroDivisionError'
except:
	print 'error occured'
else:
	print 'ELSE BLOCK'
finally:
	print 'FINALLY BLOCK'
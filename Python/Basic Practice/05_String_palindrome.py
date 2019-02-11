#STRING PALINDROME

def func1(val):
    str1=''.join(list(reversed(val)))
    if val == str1:
        print 'PALINDROME'
    else:
        print 'NOT A PALINDROME'

def func2(val):
    if val==val[::-1]:
        print "YES"
    else:
        print "NO"

def func3(val):
	rev_str=''
	l=len(val)
	for i in range(l-1,-1,-1):
		rev_str=rev_str+val[i]
	print  rev_str

def func4(val):
	rev_str=''
	for i in val:
		rev_str=i+rev_str
	print rev_str

user_inp=raw_input("enter a String ")
func1(user_inp)
func2(user_inp)
func3(user_inp)
func4(user_inp)

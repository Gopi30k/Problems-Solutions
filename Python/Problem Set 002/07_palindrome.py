import string
def isPalindrome(s):
	s=s.lower()
	rev=''
	refined_str=''
	for i in s:
		if i in string.punctuation or i in ' ' :
			s.replace(i,"")
		else:
			refined_str+=i
	#print refined_str
	for i in range(0,len(refined_str)):
		rev=refined_str[i]+rev
	if rev==refined_str:
		return True
	else:
		return False

def testIsPalindrome():
	if(isPalindrome(raw_input('Enter String of any format '))==True):
		print 'Test Case Passed and the entered String has Palindrome'
	else:
		print 'Test Case Failed and the entered String does not contain Palindrome'
testIsPalindrome()
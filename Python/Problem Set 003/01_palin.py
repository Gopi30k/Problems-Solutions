#A string slice can take a third index that specifies the "step size;"that is, the number of spaces between successive characters.
#A step size of 2 means every other character; 3 means every third, etc.
#>>> fruit = 'banana'
#>>> fruit[0:5:2]
#'bnn'
#A step size of -1 goes through the word backwards,
#so the slice [::-1] generates a reversed string. Use this idiom to write a one-line version of is_palindrome

def is_palindrome(m_str):
    if m_str[::-1]==m_str:
        return True
if is_palindrome((raw_input('Enter a String to check Palindrome')).lower())==True:
    print "Palindrome"
else:
    print "Not a palindrome"
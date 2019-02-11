'''Two words are anagrams if you can rearrange the letters from one to spell the other.
Write a function called is_anagram that takes two strings and returns True if they are anagrams.'''


def is_anagram(str1,str2):
    if sorted(str1.lower())==sorted(str2.lower()):
        return True
    else:
        return False
print is_anagram('Elbow','Below')

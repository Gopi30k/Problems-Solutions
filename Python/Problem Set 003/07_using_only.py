'''Write a function named using_only() that takes a word and a string of letters,
 and that returns True if the word contains only letters in the list.
Can you make a sentence using only the letters acefhlo? Other than "Hoe alfalfa?"'''


def using_only(str1,list_of_strings):
    flag=True
    for i in str1.lower():
        if i in list_of_strings:
            flag= True
            continue
        else:
            flag=False
            break
    return flag
print using_only('Hello Face',['a','c','e','f','h','l','o',' '])
#Write a function named avoids that takes a word and a string of forbidden letters,
#  and that returns True if the word doesn’t use any of the forbidden letters.
def avoids(words,forb_str):
    flag=True
    for i in forb_str.lower():
        print i
        if i in words:
            flag=True
            break
        else:
            flag=False
            continue
    return flag


if avoids('gopi krishnan','XmDAS g')==True:
    print 'Forbidden Match Found'
else:
    print 'No forbidden Match found'

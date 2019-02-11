#Modify the above program to print only the words that have no “e” and compute the percentage of the words in the list have no “e.”

def has_no_e(string_check):
    no_of_words=len(list(string_check.split()))
    no_has_e=0
    no_has_no_e=0
    for ind_words in list(string_check):
        if 'e' in ind_words:
            no_has_e+=1
            #print ind_words
    prcntge_of_e=((no_of_words-no_has_e)/no_of_words)*0.01
    print str(prcntge_of_e)+"%"
    print no_has_e
has_no_e('Enter the word with e')
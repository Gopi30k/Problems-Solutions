#Write a function called is_abecedarian that returns True if the letters in a word appear in alphabetical order (double letters are ok).
# How many abecedarian words are there? (i.e) "Abhor" or "Aux" or "Aadil" should return "True" Banana should return "False"

def is_abecedarian(str_check):
    if sorted(str_check)==list(str_check):
        return True
    else:
        return False
print ('Aadhil',is_abecedarian("Aadhil"))
print ('Abhor',is_abecedarian("Abhor"))
print ('Aux',is_abecedarian("Aux"))
print ('Banana ',is_abecedarian("Banana"))


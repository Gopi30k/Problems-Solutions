#Write a function called rotate_word() that takes a string and an integer as parameters,
#and that returns a new string that contains the letters from the original string "rotated" by the given amount.
#For example, "cheer" rotated by 7 is "jolly" and "melon" rotated by -10 is "cubed".
#You might want to use the built-in functions ord, which converts a character to a numeric code, and chr, which converts numeric codes to characters.

def rotate_word(str_to_rot,n_to_rot):
    rotated_str=''
    for i in str_to_rot:
        rotated_str+=chr(ord(i)+n_to_rot)
    return  rotated_str
print rotate_word(raw_input('Enter String to rotate'),7)
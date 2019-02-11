names_dict={'Albert Einstein':'01/17/1706',
'Benjamin Franklin':'02/15/2000',
'Ada Lovelace':'07/30/1978'}
print 'Welcome to the birthday dictionary. We know the birthdays of:'
print '\n'.join(names_dict.keys())
get_key=raw_input("Who's birthday do you want to look up?")
print "{}'s birthday is {}".format(get_key,names_dict[get_key])

#PROGRAM TO GET USER CHOICE AND ITERATE TILL EXIT
#REMOVING SPACES FROM GIVEN STRING AND ADDING CUSTOM DELIMETER OF USER CHOICE

while True:
	str_inp=raw_input('Enter a String	')
	temp_str=str_inp
	if str_inp.isdigit():
		print 'Enter a String without any Number\n'
		continue
	else:
		break
while True:
	get_choice=raw_input('\n Enter 1 to REMOVE SPACES IN STRING \n Enter 2 to ADD CUSTOM DELIMETER TO STRING \n Enter 3 to PRINT STRING \n Enter 4 to Exit	\n')
	if get_choice.isdigit():
		if get_choice=='1':
			y_n_conf=raw_input('Do you want to remove spaces Yes\ No.Reply in any Format of your choice	')
			if 'y' in y_n_conf or 'Y' in y_n_conf:
				str_inp=str_inp.split(' ')
				print ('String Without Any spaces',''.join(str_inp))
				continue
			else:
				print 'Spaces Not Removed \n'
				continue
		if get_choice=='2':
			get_delim=raw_input('Enter delimeter to insert	')
			print temp_str.replace(' ',get_delim)
		
		if get_choice=='3':
			print ''.join(str_inp)
		if get_choice=='4':
			break
	else:
		continue
	
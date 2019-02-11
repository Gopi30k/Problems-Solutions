import random as gen
random_num=gen.randrange(0,9)
print random_num
print type(random_num)
count =0
while True:
	guess_num=raw_input("Can u Guess the number which is betweeen 0 to 9 or ENTER (exit) to QUIT\n\t")
	count=count+1
	if random_num is guess_num:
		print ("\t\t\tU got the Right Number ")
		break
	elif random_num>guess_num:
		print ("\t\t\tUr Guess is Lower than the actual")
		continue
	elif guess_num=='exit':
		print ("\t\t\tGame Over")
		break
	else:
		print ("\t\t\tUr Guess is Higher than the actual")
		continue
print ("No.of Guesses "+str(count))
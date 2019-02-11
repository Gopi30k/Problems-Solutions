def eval_loop ():
	list1=[]
	while True:
		str_inp=raw_input('Enter a Expression to calculate')
		if str_inp=='done':
			print list1.pop()
			break
		else:
			list1.append(eval(str_inp))
			continue
eval_loop()
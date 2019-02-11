def is_power(a,b):

	r=a/b
	while r!=b:
		print r
		if r!=b:
			if a%b==0 and r%b==0:
				return True
			else:
				return False
			continue
		else:
			break
print is_power(32,2)
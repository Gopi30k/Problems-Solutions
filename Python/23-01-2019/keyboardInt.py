#KEYBOARD INTERRUPT ON ctrl+c

import sys
while True:
	try:

		inp=raw_input('Enter anything to print')
		a=str(inp)
		print a
	except :
		print " naslkn"
		sys.exit(0)
'''
print("Calculating a lot... Can be canceled with CTRL+C")
try:
    while True:
        print("Heavy task!")
        
except KeyboardInterrupt:
    print("KeyboardInterrupt has been caught.")

print("Continuing script execution")'''
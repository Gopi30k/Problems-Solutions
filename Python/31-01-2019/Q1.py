'''Create a file called new_world.txt.First add a new line to the file:Welcome to robotics time.. And then print the content of new_world.txt.'''

f=open('new_world.txt','w')
f.write('Welcome to robotics time.. ')
f.close()
f1=open('new_world.txt','r')
print f1.read()
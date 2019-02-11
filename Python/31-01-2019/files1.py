import  os
f1=open('sample.txt','w+')
f1.write('hello Krihsnan')
f=open('sample.txt','rb')
print f.readline()
if os.path.exists('samplee.txt'):
    os.remove('samplee.txt')
else:
    print 'file not found'
#Dir Delete
import os
os.rmdir("myfolder")

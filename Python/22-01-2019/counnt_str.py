
'''inp_str='aaabbbaacccccaaad'
#print (inp_str.count('a'))
#for i in inp_str:
temp= set(inp_str)
str_out=''
for i in temp:
	#print(i+ str(inp_str.count(i))),
	str_out =str_out+(i+ str(inp_str.count(i)))
print (str_out)'''


inp_str='aaabbbaacccccaaad'
str_out=''
for i in set(inp_str):
	str_out =str_out+(i+ str(inp_str.count(i)))
print (str_out)


'''a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
out=[]
for itr in a:
    if itr<5:
      out.append(itr)
print out'''

a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

out_list=[itr for itr in a if itr<5]
print out_list

def p(a):
  for i in range(0,len(a),3):
    yield a[i:i+3]

a=[1,2,3,4,5,6,7,8,9]
print list(p(a))


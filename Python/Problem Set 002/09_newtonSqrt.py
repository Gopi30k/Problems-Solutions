from __future__ import division
from tabulate import tabulate
import math
def NewtonSqrt(a):
	x=a/2
	y=(x+ a/x)/2
	while y!=x:
		x=y
		y=(x+ a/x) / 2
	return x
def NewtonSqrt1(a,itr):
	x=a/2
	for i in range(itr):
		y=(x+ a/x)/2
		x=y
	return x

def math_sqr(num):
    return math.sqrt(num)

def difference(num):
    return abs(NewtonSqrt(num)-math_sqr(num))

#print ('Number |  NewtonSqrt  |    math.sqr  | Difference ' )
for num_inp in range(1,9):
    print tabulate([[float(num_inp),NewtonSqrt(num_inp),math_sqr(num_inp),difference(num_inp)]],headers=['Number ','NewtonSqrt  ','math.sqr  ','Difference '])
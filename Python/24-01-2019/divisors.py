num=int(input("Enter a number to find its divisors"))

div_list=[i for i in range(1,num) if num%i==0]
print div_list

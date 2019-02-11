
import datetime 
name = raw_input("Enter your name: ")
age = input("Enter your age: ")

cur_year=datetime.datetime.now().year
rem_yrs=100-age
age100=rem_yrs+cur_year

print name +" You'll reach 100 years by ", age100


#SOLUTION
"""name = input("What is your name: ")
age = int(input("How old are you: "))
year = str((2014 - age)+100)
print(name + " will be 100 years old in the year " + year)"""
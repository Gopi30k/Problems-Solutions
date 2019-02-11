#Define a class Person and its two child classes: Male and Female.
#  All classes have a method "getGender" which can print "Male" for Male class and "Female" for Female class.

class Person:
    def getGender(self):
        print 'Default Gender'
class Male(Person):
    def getGender(self):
        print 'MALE'
class FeMale(Person):
    def getGender(self):
        print 'FEMALE'

personobj=Person()
personobj.getGender()
maleobj=Male()
maleobj.getGender()
femaleobj=FeMale()
femaleobj.getGender()
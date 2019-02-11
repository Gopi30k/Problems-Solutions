#Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument.
# Both classes have a area function which can print the area of the shape where Shape's area is 0 by default.

class Shape:
    shape_area=0
    def area(self):
        print 'area of shape is {} by default'.format(self.shape_area)
class Square(Shape):
    def __init__(self,length):
        self.length=length
    def area(self):
        print 'area of square is ',self.length**2
a=Shape()
a.area()
x=Square(2)

x.area()

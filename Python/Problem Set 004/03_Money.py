#Design and implement a Money class that stores monetary values in dollars and cents.
#  Special method init should have the following function header, def init(self, dollars, cents)
#  Include special method repr (str) for displaying values in dollars and cents: $ 0.45, $ 1.00, $ 1.25.
#  Also include special method add, and three getter methods that each provide the monetary value in another currency.
#  Choose any three currencies to convert to.

class Money:
    def __init__(self,dollars,cents):
        self.dollars=dollars
        self.cents=cents
    def __repr__(self):
        return '${}.{}'.format(self.dollars,self.cents)
    def __add__(self, other):
        self.dollars=self.dollars+other.dollars
        self.cents+=other.cents
        return (self.dollars,self.cents)
x=Money(12,23)
print x.__repr__()
y=Money(1,2)
z=x+y
print z

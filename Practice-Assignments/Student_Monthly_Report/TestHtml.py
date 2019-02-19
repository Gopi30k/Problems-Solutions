import HTML

HTMLFILE = 'HTML_tutorial_output.html'
f = open(HTMLFILE, 'w')

table_data = [
        ('Last name',   'First name',   'Age'),
        ('Smith',       'John',         30),
        ('Carpenter',   'Jack',         47),
        ('Johnson',     'Paul',         62),
    ]

htmlcode = HTML.table(table_data)
print htmlcode
f.write(htmlcode)

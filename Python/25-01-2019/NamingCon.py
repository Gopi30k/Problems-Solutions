#NAME CONVERSIONS

names=[]
with open('NamesList.txt') as f:
    for i in f:
        names.append( i.replace('\n',''))

def degreePrint1(i):
    if i.find('M') == 0:
        # print i
        for itr in Honorifics:
            if itr in i:
                # print itr +"." + i[len(itr):]
                # print itr+"GHOPI"
                i = itr + "." + i[len(itr):]

        if i.rfind('M') or i.rfind('B'):
            if (i[i.rfind('M'):]) in Degrees.keys():
                print i[:i.rfind('M')] + " " + Degrees.get(i[i.rfind('M'):])
            if (i[i.rfind('B'):]) in Degrees.keys():
                print i[:i.rfind('B')] + " " + Degrees.get(i[i.rfind('B'):])
            else:
                print i
    else:
        if i.rfind('M') or i.rfind('B'):
            if (i[i.rfind('M'):]) in Degrees.keys():
                print i[:i.rfind('M')] + " " + Degrees.get(i[i.rfind('M'):])
            if (i[i.rfind('B'):]) in Degrees.keys():
                print i[:i.rfind('B')] + " " + Degrees.get(i[i.rfind('B'):])

Honorifics=['Mr','Mrs', 'Miss', 'Ms', 'Mx', 'Sir', 'Dr']

Degrees={
  'BArch':'Bachelor of Architecture',
  'Ms':'Master of Surgery',
  'MSc':'Master of Science',
  'MBBS':'Bachelor of Medicine and Bachelor of Surgery',
  'MEd':'Master of Education',
  'BTech':'Bachelor of Technology'
}
for i in names:
    degreePrint1(i)


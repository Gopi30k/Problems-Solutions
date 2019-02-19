import mysql.connector

def query_mysql(query):
	cnx = mysql.connector.connect(user='root', password='root',
								  host='localhost',database='Student_monthly_report')
	cursor = cnx.cursor()
	cursor.execute(query)
	#get header and rows
	header = [i[0] for i in cursor.description]
	rows = [list(i) for i in cursor.fetchall()]
	#append header to rows
	rows.insert(0,header)
	cursor.close()
	cnx.close()
	return rows

#take list of lists as argument	
def nlist_to_html(list2d,monthName):
	#bold header
	htable='<b>' + monthName + '</b>'+'<table border="1" bordercolor=000000 cellspacing="0" cellpadding="1" >'
	list2d[0] = ['<b>' + i + '</b>' for i in list2d[0]] 
	for row in list2d:
		newrow = '<tr>' 
		newrow += '<td align="left" style="padding:1px 4px">'+unicode(row[0])+'</td>'
		row.remove(row[0])
		newrow = newrow + ''.join(['<td align="right" style="padding:1px 4px">' + unicode(x) + '</td>' for x in row])  
		newrow += '</tr>' 
		htable+= newrow
	htable += '</table>'
	return htable
	



	
monthdict={
'January':"'%-01-%'",
'February':"'%-02-%'",
'March':"'%-03-%'",
'April':"'%-04-%'",
'May':"'%-05-%'",
'June':"'%-06-%'",
'July':"'%-07-%'",
'August':"'%-08-%'",
'September':"'%-09-%'",
'October':"'%-10-%'",
'November':"'%-11-%'",
'December':"'%-12-%'"

}
#usage example
def queryExe(monthdict,monthName):
	query = "select s.sId as Id,s.sName as Name,s.sClassNo as Class,m.examDate as ExamDate,m.English,m.Tamil,m.Maths,m.Science,m.Social,(m.English+m.Tamil+m.Maths+m.Science+m.Social) as Total from Student s join Marks m on m.sId=s.sId where examDate like "+ monthdict[monthName]
	return nlist_to_html(query_mysql(query),monthName)

def writeToHtml():
	result=""
	templist=['January','February','March','April','May','June','July','August','September','October','November','December']
	monthNameQuery="select monthname(examdate) from marks group by month(examdate);"
	monthList=query_mysql(monthNameQuery)
	print str(monthList[1])
	for i in templist:
		result+=queryExe(monthdict,i)
	f = open('Student_Monthly_report.html','w')
	f.write(result)
	f.close()

writeToHtml()


import HTML
import mysql.connector as m
def printOut(dated):
	print dated
	res=[]
	db = m.connect(host="localhost",user="root",password="root",db="Student_monthly_report")
	cursor = db.cursor()
	#query="select s.sId,s.sName,s.sClassNo,m.English,m.Tamil,m.Maths,m.Science,m.Social from Student s join Marks m on m.sId=s.sId where examDate like "+dated
	query="""select s.sId as Id,s.sName as Name,s.sClassNo as Class,
	m.examDate as ExamDate,
	m.English,m.Tamil,m.Maths,m.Science,m.Social,
	(m.English+m.Tamil+m.Maths+m.Science+m.Social) as Total,	
	dense_rank() over (order by (m.English+m.Tamil+m.Maths+m.Science+m.Social) desc) as Ranking
	from Student s join Marks m on m.sId=s.sId where examDate like """+dated
	cursor.execute(query)
	#header = [i[0] for i in cursor.description]
	res=cursor.fetchall()
	#res.insert(0,header)
	return res


HTMLFILE = 'HTML_tutorial_output.html'
f = open(HTMLFILE, 'w')


def createHTMLtable(table_data,monthname):
	htmlcode='<b>'+monthname+'</b><br><br>'
	htmlcode += HTML.table(table_data)
	print htmlcode
	f.write(htmlcode)

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

monthList=['January','February','March','April','May','June','July','August','September','October','November','December']

put=[]
for i in monthList:
		put.append( printOut(monthdict[i]))



for i in put :
	createHTMLtable(i,'df')



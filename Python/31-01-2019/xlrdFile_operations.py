import xlrd
import os
def open_File(file_path):
	if os.path.isfile(file_path):
		wb=xlrd.open_workbook(file_path)
		sheetNames=wb.sheet_names()
		for i in sheetNames:
			sheets=wb.sheet_by_name(i)
			if sheets.ncols==0 and sheets.nrows==0:
				continue
			else:
				#print (sheets.cell_value(1,0))
				dataTypeList = [type(sheets.cell_value(1,i)) for i in range(0, sheets.ncols)]
				print dataTypeList
				for x in range(sheets.ncols):

					for y in range(1,sheets.nrows):
						print (sheets.cell_value(y, x), type(sheets.cell_value(y, x)))
						itr=0
						# print ('{} and {}'.format(y ,x))
						print (sheets.cell_value(y,x) ,type(sheets.cell_value(y,x)))
						# print sheets.cell(1,1).value
						# if type(sheets.cell_value(y,x))==dataTypeList[0]:
						# 	continue
						# 	#print (sheets.cell_value(y, x), type(sheets.cell_value(y, x)))
						# else:
						# 	print (sheets.cell_value(y, x), type(sheets.cell_value(y, x)))





	else:
		print 'File not found'
open_File('C:\Users\g.krishnan.gajendran\Desktop\Python\Test\Files\empDetails.xlsx')
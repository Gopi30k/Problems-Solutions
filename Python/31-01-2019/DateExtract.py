import xlrd
import os
def open_File(file_path):
	if os.path.isfile(file_path):
		wb=xlrd.open_workbook(file_path)
        sheet=wb.sheet_by_index(0)
        val= sheet.cell_value(1,3)
        wedate=wb.datemode
        dateList= xlrd.xldate_as_tuple(val,wb.datemode)
        print str(dateList[1])+"/"+str(dateList[2])+"/"+str(dateList[0])
        print int(sheet.cell_value(1,0))
open_File('C:\Users\g.krishnan.gajendran\Desktop\Python\Test\Files\empDetails.xlsx')
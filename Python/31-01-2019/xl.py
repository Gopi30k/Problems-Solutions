from __builtin__ import set

import xlrd
import os
def open_File(file_path):
	if os.path.isfile(file_path):
		wb=xlrd.open_workbook(file_path)
        sheet=wb.sheet_by_index(0)
        keys=[sheet.cell_value(0,col) for col in range(sheet.ncols)]
        print keys
        dic_list=[]
        for row_ind in range(1,sheet.nrows):
            d={
                keys[col]:sheet.cell_value(row_ind,col) for col in range(sheet.ncols)
            }
            dic_list.append(d)
        # for itr in range(len(dic_list)):
        #     print (dic_list[itr].['salary'])
        for key in keys:
            key_list=[val['EmpID'] for val in dic_list]
        print key_list

open_File('C:\Users\g.krishnan.gajendran\Desktop\Python\Test\Files\empDetails.xlsx')

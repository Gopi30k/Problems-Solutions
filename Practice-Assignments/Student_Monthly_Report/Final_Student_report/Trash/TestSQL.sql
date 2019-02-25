CREATE_DB : create Database Student_monthly_report;
USE_DB : use Student_monthly_report;
CREATE_STUDENT :
create table IF NOT EXISTS Student
(
sId integer PRIMARY KEY,sName varchar(40) NOT NULL,sDOB Date NOT NULL,sClassNo varchar(3) NOT NULL
);

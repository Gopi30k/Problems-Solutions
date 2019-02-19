create Database Student_monthly_report;
use Student_monthly_report;

create table IF NOT EXISTS Student 
(
sId integer PRIMARY KEY,sName varchar(40) NOT NULL,sDOB Date NOT NULL,sClassNo varchar(3) NOT NULL
);

desc Student;

create table IF NOT EXISTS Marks
(
sId integer,examDate Date NOT NULL,English varchar(3),Tamil varchar(3),Maths varchar(3),Science varchar(3),Social varchar(3),
FOREIGN KEY(sId) REFERENCES Student(sId)
);

desc Marks;

insert into Student values(1001,'Ashok','1996-01-30','10A');
insert into Student values(1002,'Mahesh','1996-11-23','10B');
insert into Student values(1003,'Kannan','1997-12-12','10C');
insert into Student values(1004,'Mani','1997-05-06','10A');
insert into Student values(1005,'Jacob','1996-07-23','10B');
insert into Student values(1006,'Surendar','1997-03-11','10C');

select * from Student;

insert into Marks values(1001,'2018-01-22','78','89','58','69','78');
insert into Marks values(1001,'2018-02-22','89','76','68','92','95');
insert into Marks values(1001,'2018-03-22','56','89','58','69','56');
insert into Marks values(1001,'2018-04-22','78','89','58','69','78');
insert into Marks values(1002,'2018-01-22','78','89','58','69','75');
insert into Marks values(1002,'2018-02-22','71','89','58','69','70');
insert into Marks values(1002,'2018-03-22','71','89','58','69','75');
insert into Marks values(1002,'2018-04-22','70','89','58','69','72');
insert into Marks values(1003,'2018-01-22','70','89','58','69','76');
insert into Marks values(1003,'2018-02-22','60','45','36','69','73');
insert into Marks values(1003,'2018-03-22','73','89','58','69','77');
insert into Marks values(1003,'2018-04-22','72','89','58','69','74');
insert into Marks values(1004,'2018-01-22','76','89','58','69','72');
insert into Marks values(1004,'2018-02-22','78','89','58','69','72');
insert into Marks values(1004,'2018-03-22','78','89','58','69','83');
insert into Marks values(1004,'2018-04-22','78','89','58','69','58');
insert into Marks values(1005,'2018-01-22','78','89','58','69','79');
insert into Marks values(1005,'2018-02-22','78','89','58','69','73');
insert into Marks values(1005,'2018-03-22','78','89','58','69','76');
insert into Marks values(1005,'2018-04-22','78','89','58','69','70');

select * from Marks;


select s.sId,s.sName,s.sClassNo,m.examDate,m.English,m.Tamil,m.Maths,m.Science,m.Social from Student s join Marks m on m.sId=s.sId where examDate like '%-01-%';

select s.sId as Id,s.sName as Name,s.sClassNo as Class,
m.examDate as ExamDate,
m.English,m.Tamil,m.Maths,m.Science,m.Social,
(m.English+m.Tamil+m.Maths+m.Science+m.Social) as Total,
dense_rank() over (order by (m.English+m.Tamil+m.Maths+m.Science+m.Social) desc) as Ranking
from Student s join Marks m on m.sId=s.sId where examDate like '%-01-%';


select monthname(examdate) from marks group by month(examdate );
 


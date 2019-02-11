create database StudentRanking;
use StudentRanking;
create Table Student(sno integer(4) primary key,
sname varchar(20));

create TABLE Marks(sno integer(4) references Student(sno),
semName varchar(5),
mark1 integer,
mark2 integer,
mark3 integer,
mark4 integer);

insert into Student values(1,'gopi');
insert into Student values(2,'krishnan');
insert into Student values(3,'sam');

insert into Marks values(1,'SEM1',60,56,78,76);
insert into Marks values(2,'SEM1',60,56,78,76);
insert into Marks values(3,'SEM2',60,56,78,89);
insert into Marks values(4,'SEM1',60,56,78,76);
insert into Marks values(1,'SEM2',60,56,78,56);
insert into Marks values(2,'SEM3',60,90,78,78);
insert into Marks values(2,'SEM2',60,68,78,79);
insert into Marks values(3,'SEM1',60,77,78,96);
insert into Marks values(4,'SEM3',60,23,78,76);
insert into Marks values(4,'SEM2',60,56,45,76);
insert into Marks values(1,'SEM3',60,56,78,96);


--1--
select s.sno,s.sname,m.mark1,m.mark2,m.mark3,m.mark4,(m.mark1+m.mark2+m.mark3+m.mark4) as 'Total',
If(m.mark1<50 or m.mark2<50 or m.mark3<50 or m.mark4<50 ,'FAIL','PASS')as 'Status'
from Student s inner join Marks m on s.sno=m.sno where m.semName='SEM1';

--2--
select s.sno,s.sname,m.mark1,m.mark2,m.mark3,m.mark4,(m.mark1+m.mark2+m.mark3+m.mark4) as 'Total',
CASE 
	WHEN m.mark1='A' or m.mark2='A' or m.mark3='A' or m.mark4='A' Then 'Absent'
	WHEN m.mark1<50 or m.mark2<50 or m.mark3<50 or m.mark4<50 Then 'FAIL'
	ELSE 'PASS'
END AS Status
from Student s inner join Marks m on s.sno=m.sno;
--3--
select s.sno,s.sname,m.mark1,m.mark2,m.mark3,m.mark4,(m.mark1+m.mark2+m.mark3+m.mark4) as Total,
CASE 
	WHEN m.mark1='A' or m.mark2='A' or m.mark3='A' or m.mark4='A' Then 'Absent'
	WHEN m.mark1<50 or m.mark2<50 or m.mark3<50 or m.mark4<50 Then 'FAIL'
	ELSE 'PASS'
END AS Status
from Student s inner join Marks m on s.sno=m.sno where m.semName='SEM1' order by Total desc ;


--4--

select s.sno,s.sname,m.mark1,m.mark2,m.mark3,m.mark4,(m.mark1+m.mark2+m.mark3+m.mark4) as Total,
CASE 
	WHEN m.mark1='A' or m.mark2='A' or m.mark3='A' or m.mark4='A' Then 'Absent'
	WHEN m.mark1<50 or m.mark2<50 or m.mark3<50 or m.mark4<50 Then 'FAIL'
	ELSE 'PASS'
END AS Status
from Student s inner join Marks m on s.sno=m.sno where m.semName='SEM1' order by Total desc ;


--5--
select @rankGen:=0;
select s.sno,s.sname,m.mark1,m.mark2,m.mark3,m.mark4,(m.mark1+m.mark2+m.mark3+m.mark4) as Total,
CASE 
	WHEN m.mark1='A' or m.mark2='A' or m.mark3='A' or m.mark4='A' Then 'Absent'
	WHEN m.mark1<50 or m.mark2<50 or m.mark3<50 or m.mark4<50 Then 'FAIL'
	ELSE 'PASS'
END AS Status, @rankGen:=@rankGen+1 AS Ranking
from Student s inner join Marks m on s.sno=m.sno where m.semName='SEM1' order by Total desc ;

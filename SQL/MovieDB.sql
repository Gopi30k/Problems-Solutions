Movie
	mov_id primary key
	mov_Title
	mov_lang
	mov_rel_date
	certification

Screen
	screen_id primary key
	movie_casted
	screen_Type
	movie_Date
	show_time
	
	
Customer
	c_id primary key
	c_name
	emailId
	password
	phnno
	age
	
	
Booking
	booking_id
	mov_id
	screen_id
	seat_nos
	no_of_seats
	show_Date_time
	c_id
	
mov_id	mov_Title		mov_lang	mov_rel_date	certification
105		URI				Hindi		4/1/2019			U/A
106		Dev				Tamil		14/02/2019			U
107		2.o				Tamil		12/12/2018			U/A
108		2.o				Telugu		12/12/2018			U/A
109		pettai			Tamil		14/01/2019			U
110		Amavas			Hindi		14/01/2019			A
111		Oru Adaar Love	Malayalam	14/02/2019			U/A
121		Viswasam		Tamil		14/01/2019			A
122		Yatra			Telugu		15/02/2019			U
123		Escape Room		English		2/2/2019			A
124		Gully Boy		Hindi		15/02/2019			U/A
125		Peranbu			Tamil		7/2/2019			U/A

create DATABASE movie_DB;


use movie_DB;


create table If not exists movie (mid integer primary key,mov_title varchar(30),lang varchar(10),start_date Date ,end_date Date ,certify char(3));

insert into movie values(105,'URI','Hindi','2019-01-14','2019-02-18','U/A');
insert into movie values(106,'Dev','Tamil','2019-01-14','2019-02-18','U');
insert into movie values(107,'2.0','Tamil','2019-02-01','2019-02-18','U/A');
insert into movie values(108,'Dev','Telugu','2019-02-26','2019-02-18','U');

create table If not exists screen (sid varchar(3) primary key ,sname varchar(10),mid integer,screen_Type varchar(20),show_time varchar(10),price  double(5,2));

insert into screen values('s1','Blush',105,'Lounge','2:30',180.00);
insert into screen values('s2','Wave',105,'Executive','2:45',220.00);
insert into screen values('s3','Spot',106,'Lounge','7:30',180.00);
insert into screen values('s4','Blush',107,'Lounge','9:00',180.00);
insert into screen values('s5','Blush',108,'Executive','7:30',220.00);


create table If not exists customer (cid varchar(3) primary key,name varchar(40),age integer);

insert into customer values ('c1','AAA',18);
insert into customer values ('c2','BBB',28);
insert into customer values ('c3','CCC',45);
insert into customer values ('c4','DDD',12);
insert into customer values ('c5','EEE',78);
insert into customer values ('c6','FFF',43);

create table If not exists Booking (Bid varchar(3) primary key,mid integer,sid varchar(3) ,cid varchar(3),no_of_seats integer,show_date Date);

insert into Booking values('B1',105,'S1','C1',2,'2019-02-14');
insert into Booking values('B2',106,'S3','C2',2,'2019-02-15');
insert into Booking values('B3',107,'S4','C2',3,'2019-02-15');
insert into Booking values('B4',105,'S2','C3',4,'2019-02-14');
insert into Booking values('B5',108,'S5','C6',4,'2019-02-14');


mysql> select * from Booking;
+------+------+------+------+-------------+------------+
| Bid  | mid  | sid  | cid  | no_of_seats | show_date  |
+------+------+------+------+-------------+------------+
| B1   |  105 | S1   | C1   |           2 | 2019-02-14 |
| B2   |  106 | S3   | C2   |           2 | 2019-02-15 |
| B3   |  107 | S4   | C2   |           3 | 2019-02-15 |
| B4   |  105 | S2   | C3   |           4 | 2019-02-14 |
| B5   |  108 | S5   | C6   |           4 | 2019-02-14 |
+------+------+------+------+-------------+------------+

mysql> select * from Screen;
+-----+-------+------+-------------+-----------+--------+
| sid | sname | mid  | screen_Type | show_time | price  |
+-----+-------+------+-------------+-----------+--------+
| s1  | Blush |  105 | Lounge      | 2:30      | 180.00 |
| s2  | Wave  |  105 | Executive   | 2:45      | 220.00 |
| s3  | Spot  |  106 | Lounge      | 7:30      | 180.00 |
| s4  | Blush |  107 | Lounge      | 9:00      | 180.00 |
| s5  | Blush |  108 | Executive   | 7:30      | 220.00 |
+-----+-------+------+-------------+-----------+--------+

mysql> select * from Movie;
+-----+-----------+--------+------------+------------+---------+
| mid | mov_title | lang   | start_date | end_date   | certify |
+-----+-----------+--------+------------+------------+---------+
| 105 | URI       | Hindi  | 2019-01-14 | 2019-02-18 | U/A     |
| 106 | Dev       | Tamil  | 2019-01-14 | 2019-02-18 | U       |
| 107 | 2.0       | Tamil  | 2019-02-01 | 2019-02-18 | U/A     |
| 108 | Dev       | Telugu | 2019-02-26 | 2019-02-18 | U       |
+-----+-----------+--------+------------+------------+---------+

mysql> select * from customer;
+-----+------+------+
| cid | name | age  |
+-----+------+------+
| c1  | AAA  |   18 |
| c2  | BBB  |   28 |
| c3  | CCC  |   45 |
| c4  | DDD  |   12 |
| c5  | EEE  |   78 |
| c6  | FFF  |   43 |
+-----+------+------+
                  


insert into Booking values('B6',108,'S3','C7',2,'2019-02-19');
 
 
select mov_title from Movie where mid=
(
select mid from (select b.mid,no_of_seats*price as total_cost from Screen s left join Booking b on s.sid=b.sid ) as Temp 
group by mid order by sum(total_cost) desc limit 1
);


select mov_title from movie m join(select mid,ranking from (select mid,rank() over (order by TT desc) as ranking from (select mid,sum(total_cost)as TT from (select b.mid,no_of_seats*price as total_cost from Screen s inner join Booking b on s.sid=b.sid) as Temp group by mid)as temp2)as temp3)as drvTable on m.mid =drvTable.mid where ranking=1;



select b.mid,no_of_seats*price as total_cost from Screen s inner join Booking b on s.sid=b.sid;
+------+------------+
| mid  | total_cost |
+------+------------+
|  105 |     360.00 |
|  106 |     360.00 |
|  107 |     540.00 |
|  105 |     880.00 |
|  108 |     880.00 |
|  108 |     360.00 |
+------+------------+


select mid,sum(total_cost)as TT from (select b.mid,no_of_seats*price as total_cost from Screen s inner join Booking b on s.sid=b.sid) as Temp group by mid

+------+---------+
| mid  | TT      |
+------+---------+
|  105 | 1240.00 |
|  106 |  360.00 |
|  107 |  540.00 |
|  108 | 1240.00 |
+------+---------+

select mid,rank() over (order by TT desc) as ranking from (select mid,sum(total_cost)as TT from (select b.mid,no_of_seats*price as total_cost from Screen s inner join Booking b on s.sid=b.sid) as Temp group by mid)as temp2

+------+---------+
| mid  | ranking |
+------+---------+
|  105 |       1 |
|  108 |       1 |
|  107 |       3 |
|  106 |       4 |
+------+---------+

Select mov_title from movie m join (select mid,rank() over (order by TT desc) as ranking from (select mid,sum(total_cost)as TT from (select b.mid,no_of_seats*price as total_cost from Screen s inner join Booking b on s.sid=b.sid) as Temp group by mid)as temp2)as drvTable on m.mid =drvTable.mid where ranking=1;
 
 +-----------+
| mov_title |
+-----------+
| URI       |
| Dev       |
+-----------+


select m.mov_Title,sum(b.no_of_seats*s.price) as amt from booking b join screen s join movie m on s.sid=b.sid and m.mid=s.mid group by m.mov_Title order by amt desc limit 1;
+-----------+---------+
| mov_Title | amt     |
+-----------+---------+
| Dev       | 1600.00 |
+-----------+---------+
///////////////////////////////////////////       COMPLETED DATE - 14-02-2019          ///////////////////////////////////////////////

/*DB CREATION*/

create Database Hotel_DB;
use Hotel_DB;

/*Hotel Table Creation*/

create table Hotel(Hotel_No varchar(5)  primary key,Name varchar(20),City varchar(15));

/* view Hotel Table*/
desc Hotel;

/*Room Table Creation*/

create table Room(Room_No  integer(5) primary key,Hotel_No varchar(5)  references Hotel(Hotel_No),RType varchar(2),Price double(5,2));

/* view Room Table*/
desc Room;

/*Guest Table Creation*/

create table Guest(Guest_No varchar(5) primary key,Name varchar(15),City varchar(15));

/* view Guest Table*/
desc Guest;

/*Booking Table Creation*/

create table Booking(Hotel_No varchar(5) references Room(Hotel_No),Guest_No  varchar(5) references Guest(Guest_No),Date_From date,Date_To date,Room_No integer(5) references Room(Room_No));

/* view Booking Table*/
desc Booking;

/*Inserting into Hotel Table*/

insert into Hotel values('H111','Empire Hotel','New York');
insert into Hotel values('H235','Park Place','New York');
insert into Hotel values('H432','Brownstone Hotel','Toronto');
insert into Hotel values('H498','James Plaza','Toronto');
insert into Hotel values('H193','Devon Hotel','Boston');
insert into Hotel values('H437','Clairmont Hotel','Boston');

/* view Hotel table*/

select * from Hotel;


/*Inserting into Room Table*/

insert into Room values(313,'H111','S',145.00);
insert into Room values(412,'H111','N',145.00);
insert into Room values(1267,'H235','N',175.00);
insert into Room values(1289,'H235','N',195.00);
insert into Room values(876,'H432','S',124.00);
insert into Room values(898,'H432','S',124.00);
insert into Room values(345,'H498','N',160.00);
insert into Room values(467,'H498','N',180.00);
insert into Room values(1001,'H193','S',150.00);
insert into Room values(1201,'H193','N',175.00);
insert into Room values(257,'H437','N',140.00);
insert into Room values(223,'H437','N',155.00);

/* view Room table*/

select * from Room;


/*Inserting into Guest Table*/

insert into Guest values('G256','Adam Wayne','Pittsburgh');
insert into Guest values('G367','Tara Cummings','Baltimore');
insert into Guest values('G879','Vanessa Parry','Pittsburgh');
insert into Guest values('G230','Tom Hancock','Philadelphia');
insert into Guest values('G467','Robert Swift','Atlanta');
insert into Guest values('G190','Edward Cane','Baltimore');


/* view Guest table*/

select * from Guest;


/*Inserting into Booking Table*/

insert into Booking values('H111','G256','1999-08-10','1999-08-15',412);
insert into Booking values('H111','G367','1999-08-18','1999-08-21',412);
insert into Booking values('H235','G879','1999-09-05','1999-09-12',1267);
insert into Booking values('H498','G230','1999-09-15','1999-09-18',467);
insert into Booking values('H498','G256','1999-11-30','1999-12-02',345);
insert into Booking values('H498','G467','1999-11-03','1999-11-05',345);
insert into Booking values('H193','G190','1999-11-15','1999-11-19',1001);
insert into Booking values('H193','G367','1999-09-12','1999-09-14',1001);
insert into Booking values('H193','G367','1999-10-01','1999-10-06',1201);
insert into Booking values('H437','G190','1999-10-04','1999-10-06',223);
insert into Booking values('H437','G879','1999-09-14','1999-09-17',223);

/* view Booking table*/

select * from Booking;


/*Queries:*/

/*1)List full details of all hotels.*/

select h.Hotel_No,h.Name,h.City,r.Room_No,r.RType,r.Price,b.Guest_No,b.Date_From,b.Date_To from Hotel h join Room r on h.Hotel_No=r.Hotel_No join Booking b on b.Hotel_No=r.Hotel_No;

/*2)List full details of all hotels in New York.*/

select  h.Hotel_No,h.Name,h.City,r.Room_No,r.RType,r.Price,b.Guest_No,b.Date_From,b.Date_To from Hotel h join Room r on h.Hotel_No=r.Hotel_No join Booking b on b.Hotel_No=r.Hotel_No where h.City='New York';

/*3)List the names and cities of all guests, ordered according to their cities.*/

select g.Name,g.City from Guest g group by g.City;

/*4)List all details for non-smoking rooms in ascending order of price.*/

select * from Room r where r.RType='N' order by r.Price;

/*5)List the number of hotels there are.*/

select count(Hotel_No) from Hotel ;

select count(distinct(Hotel_No)) from Room;

/*6)List the cities in which guests live. Each city should be listed only once*/





//////////////////////////////////////////////////////////////////SOLUTIONS WITH TABLES////////////////////////////////////////////////////////////////////////




mysql> /*DB CREATION*/
mysql>
mysql> create Database Hotel_DB;
Query OK, 1 row affected (0.15 sec)

mysql> use Hotel_DB;
Database changed
mysql>
mysql> /*Hotel Table Creation*/
mysql>
mysql> create table Hotel(Hotel_No varchar(5)  primary key,Name varchar(20),City varchar(15));
Query OK, 0 rows affected (0.80 sec)

mysql>
mysql> /* view Hotel Table*/
mysql> desc Hotel;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Hotel_No | varchar(5)  | NO   | PRI | NULL    |       |
| Name     | varchar(20) | YES  |     | NULL    |       |
| City     | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>
mysql> /*Room Table Creation*/
mysql>
mysql> create table Room(Room_No  integer(5) primary key,Hotel_No varchar(5)  references Hotel(Hotel_No),RType varchar(2),Price double(5,2));
Query OK, 0 rows affected (0.48 sec)

mysql>
mysql> /* view Room Table*/
mysql> desc Room;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Room_No  | int(5)      | NO   | PRI | NULL    |       |
| Hotel_No | varchar(5)  | YES  |     | NULL    |       |
| RType    | varchar(2)  | YES  |     | NULL    |       |
| Price    | double(5,2) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql>
mysql> /*Guest Table Creation*/
mysql>
mysql> create table Guest(Guest_No varchar(5) primary key,Name varchar(15),City varchar(15));
Query OK, 0 rows affected (0.61 sec)

mysql>
mysql> /* view Guest Table*/
mysql> desc Guest;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| Guest_No | varchar(5)  | NO   | PRI | NULL    |       |
| Name     | varchar(15) | YES  |     | NULL    |       |
| City     | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>
mysql> /*Booking Table Creation*/
mysql>
mysql> create table Booking(Hotel_No varchar(5) references Room(Hotel_No),Guest_No  varchar(5) references Guest(Guest_No),Date_From date,Date_To date,Room_No integer(5) references Room(Room_No));
Query OK, 0 rows affected (0.45 sec)

mysql>
mysql> /* view Booking Table*/
mysql> desc Booking;
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| Hotel_No  | varchar(5) | YES  |     | NULL    |       |
| Guest_No  | varchar(5) | YES  |     | NULL    |       |
| Date_From | date       | YES  |     | NULL    |       |
| Date_To   | date       | YES  |     | NULL    |       |
| Room_No   | int(5)     | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql>
mysql> /*Inserting into Hotel Table*/
mysql>
mysql> insert into Hotel values('H111','Empire Hotel','New York');
Query OK, 1 row affected (0.34 sec)

mysql> insert into Hotel values('H235','Park Place','New York');
Query OK, 1 row affected (0.13 sec)

mysql> insert into Hotel values('H432','Brownstone Hotel','Toronto');
Query OK, 1 row affected (0.09 sec)

mysql> insert into Hotel values('H498','James Plaza','Toronto');
Query OK, 1 row affected (0.12 sec)

mysql> insert into Hotel values('H193','Devon Hotel','Boston');
Query OK, 1 row affected (0.12 sec)

mysql> insert into Hotel values('H437','Clairmont Hotel','Boston');
Query OK, 1 row affected (0.07 sec)

mysql>
mysql> /* view Hotel table*/
mysql>
mysql> select * from Hotel;
+----------+------------------+----------+
| Hotel_No | Name             | City     |
+----------+------------------+----------+
| H111     | Empire Hotel     | New York |
| H193     | Devon Hotel      | Boston   |
| H235     | Park Place       | New York |
| H432     | Brownstone Hotel | Toronto  |
| H437     | Clairmont Hotel  | Boston   |
| H498     | James Plaza      | Toronto  |
+----------+------------------+----------+
6 rows in set (0.00 sec)

mysql>
mysql>
mysql> /*Inserting into Room Table*/
mysql>
mysql> insert into Room values(313,'H111','S',145.00);
Query OK, 1 row affected (0.17 sec)

mysql> insert into Room values(412,'H111','N',145.00);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Room values(1267,'H235','N',175.00);
Query OK, 1 row affected (0.30 sec)

mysql> insert into Room values(1289,'H235','N',195.00);
Query OK, 1 row affected (0.10 sec)

mysql> insert into Room values(876,'H432','S',124.00);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Room values(898,'H432','S',124.00);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Room values(345,'H498','N',160.00);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Room values(467,'H498','N',180.00);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Room values(1001,'H193','S',150.00);
Query OK, 1 row affected (0.17 sec)

mysql> insert into Room values(1201,'H193','N',175.00);
Query OK, 1 row affected (0.09 sec)

mysql> insert into Room values(257,'H437','N',140.00);
Query OK, 1 row affected (0.09 sec)

mysql> insert into Room values(223,'H437','N',155.00);
Query OK, 1 row affected (0.07 sec)

mysql>
mysql> /* view Room table*/
mysql>
mysql> select * from Room;
+---------+----------+-------+--------+
| Room_No | Hotel_No | RType | Price  |
+---------+----------+-------+--------+
|     223 | H437     | N     | 155.00 |
|     257 | H437     | N     | 140.00 |
|     313 | H111     | S     | 145.00 |
|     345 | H498     | N     | 160.00 |
|     412 | H111     | N     | 145.00 |
|     467 | H498     | N     | 180.00 |
|     876 | H432     | S     | 124.00 |
|     898 | H432     | S     | 124.00 |
|    1001 | H193     | S     | 150.00 |
|    1201 | H193     | N     | 175.00 |
|    1267 | H235     | N     | 175.00 |
|    1289 | H235     | N     | 195.00 |
+---------+----------+-------+--------+
12 rows in set (0.00 sec)

mysql>
mysql>
mysql> /*Inserting into Guest Table*/
mysql>
mysql> insert into Guest values('G256','Adam Wayne','Pittsburgh');
Query OK, 1 row affected (0.35 sec)

mysql> insert into Guest values('G367','Tara Cummings','Baltimore');
Query OK, 1 row affected (0.19 sec)

mysql> insert into Guest values('G879','Vanessa Parry','Pittsburgh');
Query OK, 1 row affected (0.22 sec)

mysql> insert into Guest values('G230','Tom Hancock','Philadelphia');
Query OK, 1 row affected (0.10 sec)

mysql> insert into Guest values('G467','Robert Swift','Atlanta');
Query OK, 1 row affected (0.07 sec)

mysql> insert into Guest values('G190','Edward Cane','Baltimore');
Query OK, 1 row affected (0.07 sec)

mysql>
mysql>
mysql> /* view Guest table*/
mysql>
mysql> select * from Guest;
+----------+---------------+--------------+
| Guest_No | Name          | City         |
+----------+---------------+--------------+
| G190     | Edward Cane   | Baltimore    |
| G230     | Tom Hancock   | Philadelphia |
| G256     | Adam Wayne    | Pittsburgh   |
| G367     | Tara Cummings | Baltimore    |
| G467     | Robert Swift  | Atlanta      |
| G879     | Vanessa Parry | Pittsburgh   |
+----------+---------------+--------------+
6 rows in set (0.00 sec)

mysql>
mysql>
mysql> /*Inserting into Booking Table*/
mysql>
mysql> insert into Booking values('H111','G256','1999-08-10','1999-08-15',412);
Query OK, 1 row affected (0.06 sec)

mysql> insert into Booking values('H111','G367','1999-08-18','1999-08-21',412);
Query OK, 1 row affected (0.34 sec)

mysql> insert into Booking values('H235','G879','1999-09-05','1999-09-12',1267);
Query OK, 1 row affected (0.17 sec)

mysql> insert into Booking values('H498','G230','1999-09-15','1999-09-18',467);
Query OK, 1 row affected (0.08 sec)

mysql> insert into Booking values('H498','G256','1999-11-30','1999-12-02',345);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Booking values('H498','G467','1999-11-03','1999-11-05',345);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Booking values('H193','G190','1999-11-15','1999-11-19',1001);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Booking values('H193','G367','1999-09-12','1999-09-14',1001);
Query OK, 1 row affected (0.08 sec)

mysql> insert into Booking values('H193','G367','1999-10-01','1999-10-06',1201);
Query OK, 1 row affected (0.20 sec)

mysql> insert into Booking values('H437','G190','1999-10-04','1999-10-06',223);
Query OK, 1 row affected (0.14 sec)

mysql> insert into Booking values('H437','G879','1999-09-14','1999-09-17',223);
Query OK, 1 row affected (0.40 sec)

mysql>
mysql> /* view Booking table*/
mysql>
mysql> select * from Booking;
+----------+----------+------------+------------+---------+
| Hotel_No | Guest_No | Date_From  | Date_To    | Room_No |
+----------+----------+------------+------------+---------+
| H111     | G256     | 1999-08-10 | 1999-08-15 |     412 |
| H111     | G367     | 1999-08-18 | 1999-08-21 |     412 |
| H235     | G879     | 1999-09-05 | 1999-09-12 |    1267 |
| H498     | G230     | 1999-09-15 | 1999-09-18 |     467 |
| H498     | G256     | 1999-11-30 | 1999-12-02 |     345 |
| H498     | G467     | 1999-11-03 | 1999-11-05 |     345 |
| H193     | G190     | 1999-11-15 | 1999-11-19 |    1001 |
| H193     | G367     | 1999-09-12 | 1999-09-14 |    1001 |
| H193     | G367     | 1999-10-01 | 1999-10-06 |    1201 |
| H437     | G190     | 1999-10-04 | 1999-10-06 |     223 |
| H437     | G879     | 1999-09-14 | 1999-09-17 |     223 |
+----------+----------+------------+------------+---------+
11 rows in set (0.00 sec)

mysql>
mysql>
mysql> /*Queries:*/
mysql>
mysql> /*1)List full details of all hotels.*/
mysql>
mysql> select h.Hotel_No,h.Name,h.City,r.Room_No,r.RType,r.Price,b.Guest_No,b.Date_From,b.Date_To from Hotel h join Room r on h.Hotel_No=r.Hotel_No join Booking b on b.Hotel_No=r.Hotel_No;
+----------+-----------------+----------+---------+-------+--------+----------+------------+------------+
| Hotel_No | Name            | City     | Room_No | RType | Price  | Guest_No | Date_From  | Date_To    |
+----------+-----------------+----------+---------+-------+--------+----------+------------+------------+
| H437     | Clairmont Hotel | Boston   |     223 | N     | 155.00 | G190     | 1999-10-04 | 1999-10-06 |
| H437     | Clairmont Hotel | Boston   |     223 | N     | 155.00 | G879     | 1999-09-14 | 1999-09-17 |
| H437     | Clairmont Hotel | Boston   |     257 | N     | 140.00 | G190     | 1999-10-04 | 1999-10-06 |
| H437     | Clairmont Hotel | Boston   |     257 | N     | 140.00 | G879     | 1999-09-14 | 1999-09-17 |
| H111     | Empire Hotel    | New York |     313 | S     | 145.00 | G256     | 1999-08-10 | 1999-08-15 |
| H111     | Empire Hotel    | New York |     313 | S     | 145.00 | G367     | 1999-08-18 | 1999-08-21 |
| H498     | James Plaza     | Toronto  |     345 | N     | 160.00 | G230     | 1999-09-15 | 1999-09-18 |
| H498     | James Plaza     | Toronto  |     345 | N     | 160.00 | G256     | 1999-11-30 | 1999-12-02 |
| H498     | James Plaza     | Toronto  |     345 | N     | 160.00 | G467     | 1999-11-03 | 1999-11-05 |
| H111     | Empire Hotel    | New York |     412 | N     | 145.00 | G256     | 1999-08-10 | 1999-08-15 |
| H111     | Empire Hotel    | New York |     412 | N     | 145.00 | G367     | 1999-08-18 | 1999-08-21 |
| H498     | James Plaza     | Toronto  |     467 | N     | 180.00 | G230     | 1999-09-15 | 1999-09-18 |
| H498     | James Plaza     | Toronto  |     467 | N     | 180.00 | G256     | 1999-11-30 | 1999-12-02 |
| H498     | James Plaza     | Toronto  |     467 | N     | 180.00 | G467     | 1999-11-03 | 1999-11-05 |
| H193     | Devon Hotel     | Boston   |    1001 | S     | 150.00 | G190     | 1999-11-15 | 1999-11-19 |
| H193     | Devon Hotel     | Boston   |    1001 | S     | 150.00 | G367     | 1999-09-12 | 1999-09-14 |
| H193     | Devon Hotel     | Boston   |    1001 | S     | 150.00 | G367     | 1999-10-01 | 1999-10-06 |
| H193     | Devon Hotel     | Boston   |    1201 | N     | 175.00 | G190     | 1999-11-15 | 1999-11-19 |
| H193     | Devon Hotel     | Boston   |    1201 | N     | 175.00 | G367     | 1999-09-12 | 1999-09-14 |
| H193     | Devon Hotel     | Boston   |    1201 | N     | 175.00 | G367     | 1999-10-01 | 1999-10-06 |
| H235     | Park Place      | New York |    1267 | N     | 175.00 | G879     | 1999-09-05 | 1999-09-12 |
| H235     | Park Place      | New York |    1289 | N     | 195.00 | G879     | 1999-09-05 | 1999-09-12 |
+----------+-----------------+----------+---------+-------+--------+----------+------------+------------+
22 rows in set (0.00 sec)

mysql>
mysql> /*2)List full details of all hotels in New York.*/
mysql>
mysql> select  h.Hotel_No,h.Name,h.City,r.Room_No,r.RType,r.Price,b.Guest_No,b.Date_From,b.Date_To from Hotel h join Room r on h.Hotel_No=r.Hotel_No join Booking b on b.Hotel_No=r.Hotel_No where h.City='New York';
+----------+--------------+----------+---------+-------+--------+----------+------------+------------+
| Hotel_No | Name         | City     | Room_No | RType | Price  | Guest_No | Date_From  | Date_To    |
+----------+--------------+----------+---------+-------+--------+----------+------------+------------+
| H111     | Empire Hotel | New York |     313 | S     | 145.00 | G256     | 1999-08-10 | 1999-08-15 |
| H111     | Empire Hotel | New York |     313 | S     | 145.00 | G367     | 1999-08-18 | 1999-08-21 |
| H111     | Empire Hotel | New York |     412 | N     | 145.00 | G256     | 1999-08-10 | 1999-08-15 |
| H111     | Empire Hotel | New York |     412 | N     | 145.00 | G367     | 1999-08-18 | 1999-08-21 |
| H235     | Park Place   | New York |    1267 | N     | 175.00 | G879     | 1999-09-05 | 1999-09-12 |
| H235     | Park Place   | New York |    1289 | N     | 195.00 | G879     | 1999-09-05 | 1999-09-12 |
+----------+--------------+----------+---------+-------+--------+----------+------------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> /*3)List the names and cities of all guests, ordered according to their cities.*/
mysql>
mysql> select g.Name,g.City from Guest g group by g.City;
+--------------+--------------+
| Name         | City         |
+--------------+--------------+
| Edward Cane  | Baltimore    |
| Tom Hancock  | Philadelphia |
| Adam Wayne   | Pittsburgh   |
| Robert Swift | Atlanta      |
+--------------+--------------+
4 rows in set (0.00 sec)

mysql>
mysql> /*4)List all details for non-smoking rooms in ascending order of price.*/
mysql>
mysql> select * from Room r where r.RType='N' order by r.Price;
+---------+----------+-------+--------+
| Room_No | Hotel_No | RType | Price  |
+---------+----------+-------+--------+
|     257 | H437     | N     | 140.00 |
|     412 | H111     | N     | 145.00 |
|     223 | H437     | N     | 155.00 |
|     345 | H498     | N     | 160.00 |
|    1201 | H193     | N     | 175.00 |
|    1267 | H235     | N     | 175.00 |
|     467 | H498     | N     | 180.00 |
|    1289 | H235     | N     | 195.00 |
+---------+----------+-------+--------+
8 rows in set (0.00 sec)

mysql>
mysql> /*5)List the number of hotels there are.*/
mysql>
mysql> select count(Hotel_No) from Hotel ;
+-----------------+
| count(Hotel_No) |
+-----------------+
|               6 |
+-----------------+
1 row in set (0.04 sec)

mysql>
mysql> select count(distinct(Hotel_No)) from Room;
+---------------------------+
| count(distinct(Hotel_No)) |
+---------------------------+
|                         6 |
+---------------------------+
1 row in set (0.10 sec)





/////////////////////////////////////////////////////////////       COMPLETED DATE - 22-02-2019          //////////////////////////////////////////////////////


/*6)List the cities in which guests live. Each city should be listed only once*/


mysql>  select g.city from booking b join guest g on b.guest_no=g.guest_no group by g.city;
+--------------+
| city         |
+--------------+
| Pittsburgh   |
| Baltimore    |
| Philadelphia |
| Atlanta      |
+--------------+
4 rows in set (0.00 sec)

mysql> select distinct(g.city) from guest g ;
+--------------+
| city         |
+--------------+
| Baltimore    |
| Philadelphia |
| Pittsburgh   |
| Atlanta      |
+--------------+
4 rows in set (0.02 sec)

/*7.)List the average price of a room.*/

 select avg(r.Price),b.Room_No from booking b join room r on r.Hotel_No=b.Hotel_No group by b.Room_no;
+--------------+---------+
| avg(r.Price) | Room_No |
+--------------+---------+
|   147.500000 |     223 |
|   145.000000 |     412 |
|   170.000000 |     467 |
|   170.000000 |     345 |
|   162.500000 |    1001 |
|   162.500000 |    1201 |
|   185.000000 |    1267 |
+--------------+---------+


/*8.)List hotel names, their room numbers, and the type of that room.*/


 select h.name,r.room_no,r.rtype from hotel h join room r on h.hotel_no=r.hotel_no;
+------------------+---------+-------+
| name             | room_no | rtype |
+------------------+---------+-------+
| Clairmont Hotel  |     223 | N     |
| Clairmont Hotel  |     257 | N     |
| Empire Hotel     |     313 | S     |
| James Plaza      |     345 | N     |
| Empire Hotel     |     412 | N     |
| James Plaza      |     467 | N     |
| Brownstone Hotel |     876 | S     |
| Brownstone Hotel |     898 | S     |
| Devon Hotel      |    1001 | S     |
| Devon Hotel      |    1201 | N     |
| Park Place       |    1267 | N     |
| Park Place       |    1289 | N     |
+------------------+---------+-------+

/*9)List the hotel names, booking dates, and room numbers for all hotels in New York.*/

select h.name,b.date_from,b.date_to,b.room_no from booking b join hotel h on h.hotel_no=b.hotel_no where h.city='New York';
+--------------+------------+------------+---------+
| name         | date_from  | date_to    | room_no |
+--------------+------------+------------+---------+
| Empire Hotel | 1999-08-10 | 1999-08-15 |     412 |
| Empire Hotel | 1999-08-18 | 1999-08-21 |     412 |
| Park Place   | 1999-09-05 | 1999-09-12 |    1267 |
+--------------+------------+------------+---------+

/*10)What is the number of bookings that started in the month of September? */

select b.guest_no from booking b where b.date_from like '%-09-%';
+----------+
| guest_no |
+----------+
| G879     |
| G230     |
| G367     |
| G879     |
+----------+

select count(b.guest_no) from booking b where b.date_from like '%-09-%';
+-------------------+
| count(b.guest_no) |
+-------------------+
|                 4 |
+-------------------+


/*11)List the names and cities of guests who began a stay in New York in August.*/

 select g.name,g.city from guest g join booking b on g.guest_no=b.guest_no join hotel h on h.hotel_no=b.hotel_no where b.date_from like '%-08-%' and h.city='New York';
+---------------+------------+
| name          | city       |
+---------------+------------+
| Adam Wayne    | Pittsburgh |
| Tara Cummings | Baltimore  |
+---------------+------------+

/*12)List the hotel names and room numbers of any hotel rooms that have not been booked.*/

select h.name,r.room_no from hotel h join room r on r.hotel_no=h.hotel_no where r.room_no not in (select b.room_no from booking b);
+------------------+---------+
| name             | room_no |
+------------------+---------+
| Clairmont Hotel  |     257 |
| Empire Hotel     |     313 |
| Brownstone Hotel |     876 |
| Brownstone Hotel |     898 |
| Park Place       |    1289 |
+------------------+---------+

/*13)List the hotel name and city of the hotel with the highest priced room.*/
select h.name,h.city,r.price from hotel h join room r where r.price=(select max(price ) from room);
+------------------+----------+--------+
| name             | city     | price  |
+------------------+----------+--------+
| Empire Hotel     | New York | 195.00 |
| Devon Hotel      | Boston   | 195.00 |
| Park Place       | New York | 195.00 |
| Brownstone Hotel | Toronto  | 195.00 |
| Clairmont Hotel  | Boston   | 195.00 |
| James Plaza      | Toronto  | 195.00 |
+------------------+----------+--------+

/*14)List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.*/

/*15.)List the average price of a room grouped by city.*/



select room_no,avg(price) from room r join hotel h on h.hotel_no=r.hotel_no group by h.city;
+---------+------------+
| room_no | avg(price) |
+---------+------------+
|     223 | 155.000000 |
|     313 | 165.000000 |
|     345 | 147.000000 |
+---------+------------+
3 rows in set (0.00 sec)












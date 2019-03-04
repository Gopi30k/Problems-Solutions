Create table Location (locationid integer primary key, name varchar(30), sunlight integer, water integer); 
Create table Gardener (gardenerid integer primary key, name varchar(30), age integer); 
Create table Plant (plantid integer primary key, name varchar(30), sunlight integer, water integer, weight integer); 
Create table planted (plantFK integer, gardenerFK integer, locationFK integer, date1 date, seeds integer, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 
Create table picked (plantFK integer, gardenerFK integer, locationFK integer, date1 date, amount integer, weight integer, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 



mysql> desc location;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| locationid | int(11)     | NO   | PRI | NULL    |       |
| name       | varchar(30) | YES  |     | NULL    |       |
| sunlight   | int(11)     | YES  |     | NULL    |       |
| water      | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.07 sec)

mysql> desc gardener;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| gardenerid | int(11)     | NO   | PRI | NULL    |       |
| name       | varchar(30) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc plant;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| plantid  | int(11)     | NO   | PRI | NULL    |       |
| name     | varchar(30) | YES  |     | NULL    |       |
| sunlight | int(11)     | YES  |     | NULL    |       |
| water    | int(11)     | YES  |     | NULL    |       |
| weight   | int(11)     | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc planted;
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| plantFK    | int(11) | YES  | MUL | NULL    |       |
| gardenerFK | int(11) | YES  | MUL | NULL    |       |
| locationFK | int(11) | YES  | MUL | NULL    |       |
| date1      | date    | YES  |     | NULL    |       |
| seeds      | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
5 rows in set (0.05 sec)

mysql> desc picked;
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| plantFK    | int(11) | YES  | MUL | NULL    |       |
| gardenerFK | int(11) | YES  | MUL | NULL    |       |
| locationFK | int(11) | YES  | MUL | NULL    |       |
| date1      | date    | YES  |     | NULL    |       |
| amount     | int(11) | YES  |     | NULL    |       |
| weight     | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
6 rows in set (0.00 sec)


/* Set-up for location Table */
Insert into location values(0, 'East', .28, .80); 
Insert into location values(1, 'North', .17, .84); 
Insert into location values(2, 'West', .38, .48); 
Insert into location values(3, 'South', .45, .66); 

/* Set-up for gardener Table */
Insert into gardener values(0, 'Mother', 36); 
Insert into gardener values(1, 'Father', 38); 
Insert into gardener values(2, 'Tim', 15); 
Insert into gardener values(3, 'Erin', 12); 

/* Set-up for plant Table */
Insert into plant values(0, 'Carrot', .26, .82, .08); 
Insert into plant values(1, 'Beet', .44, .80, .04); 
Insert into plant values(2, 'Corn', .44, .76, .26); 
Insert into plant values(3, 'Tomato', .42, .80, .16); 
Insert into plant values(4, 'Radish', .28, .84, .02); 
Insert into plant values(5, 'Lettuce', .29, .85, .03); 

/* Set-up for planted Table */
Insert into planted values(0, 0, 0 , '2012-04-18', 28); 
Insert into planted values(0, 1, 1 , '2012-04-14', 14); 
Insert into planted values(1, 0, 2 , '2012-04-18', 36); 
Insert into planted values(2, 1, 3 , '2012-04-14', 20); 
Insert into planted values(2, 2, 2 , '2012-04-19', 12); 
Insert into planted values(3, 3, 3 , '2012-04-25', 38); 
Insert into planted values(4, 2, 0 , '2012-04-30', 30); 
Insert into planted values(5, 2, 0 , '2012-04-15', 30); 

/* Set-up for picked Table */
Insert into picked values(0, 2, 0 , '2012-08-18', 28, 2.32); 
Insert into picked values(0, 3, 1 , '2012-08-16', 12, 1.02); 
Insert into picked values(2, 1, 3 , '2012-08-22', 52, 12.96); 
Insert into picked values(2, 2, 2 , '2012-08-28', 18, 4.58); 
Insert into picked values(3, 3, 3 , '2012-08-22', 15, 3.84); 
Insert into picked values(4, 2, 0 , '2012-07-16', 23, 0.52); 

mysql> select * from location;
+------------+-------+----------+-------+
| locationid | name  | sunlight | water |
+------------+-------+----------+-------+
|          0 | East  |        0 |     1 |
|          1 | North |        0 |     1 |
|          2 | West  |        0 |     0 |
|          3 | South |        0 |     1 |
+------------+-------+----------+-------+
4 rows in set (0.00 sec)

mysql> select * from gardener;
+------------+--------+------+
| gardenerid | name   | age  |
+------------+--------+------+
|          0 | Mother |   36 |
|          1 | Father |   38 |
|          2 | Tim    |   15 |
|          3 | Erin   |   12 |
+------------+--------+------+
4 rows in set (0.00 sec)

mysql> select * from plant;
+---------+---------+----------+-------+--------+
| plantid | name    | sunlight | water | weight |
+---------+---------+----------+-------+--------+
|       0 | Carrot  |        0 |     1 |      0 |
|       1 | Beet    |        0 |     1 |      0 |
|       2 | Corn    |        0 |     1 |      0 |
|       3 | Tomato  |        0 |     1 |      0 |
|       4 | Radish  |        0 |     1 |      0 |
|       5 | Lettuce |        0 |     1 |      0 |
+---------+---------+----------+-------+--------+
6 rows in set (0.00 sec)

mysql> select * from planted;
+---------+------------+------------+------------+-------+
| plantFK | gardenerFK | locationFK | date1      | seeds |
+---------+------------+------------+------------+-------+
|       0 |          0 |          0 | 2012-04-18 |    28 |
|       0 |          0 |          0 | 2012-04-18 |    28 |
|       0 |          1 |          1 | 2012-04-14 |    14 |
|       1 |          0 |          2 | 2012-04-18 |    36 |
|       2 |          1 |          3 | 2012-04-14 |    20 |
|       2 |          2 |          2 | 2012-04-19 |    12 |
|       3 |          3 |          3 | 2012-04-25 |    38 |
|       4 |          2 |          0 | 2012-04-30 |    30 |
|       5 |          2 |          0 | 2012-04-15 |    30 |
+---------+------------+------------+------------+-------+
9 rows in set (0.00 sec)

mysql> select * from picked;
+---------+------------+------------+------------+--------+--------+
| plantFK | gardenerFK | locationFK | date1      | amount | weight |
+---------+------------+------------+------------+--------+--------+
|       0 |          2 |          0 | 2012-08-18 |     28 |      2 |
|       0 |          3 |          1 | 2012-08-16 |     12 |      1 |
|       2 |          1 |          3 | 2012-08-22 |     52 |     13 |
|       2 |          2 |          2 | 2012-08-28 |     18 |      5 |
|       3 |          3 |          3 | 2012-08-22 |     15 |      4 |
|       4 |          2 |          0 | 2012-07-16 |     23 |      1 |
+---------+------------+------------+------------+--------+--------+
6 rows in set (0.00 sec)


/*1.)Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden*/

 select sum(pic.weight) from picked pic join plant p on p.plantid=pic.plantFK where p.name="corn";

+-----------------+
| sum(pic.weight) |
+-----------------+
|              18 |
+-----------------+

/*2.)For some reason Erin has change his location for picking the tomato to North. Write the corresponding query.*/

select l.name from location l join planted pl on l.locationid=pl.locationfk join gardener g on pl.gardenerFK=g.gardenerid where g.name="Erin";
+-------+
| name  |
+-------+
| South |
+-------+


 select l.locationid from location l where l.name="north";
+------------+
| locationid |
+------------+
|          1 |
+------------+

select pic.gardenerFK from picked pic join plant p on p.plantid=pic.plantFK join gardener g on g.gardenerid=pic.gardenerFK where g.name="Erin" and p.name="Tomato";
+------------+
| gardenerFK |
+------------+
|          3 |
+------------+




update picked set locationFK=(select l.locationid from location l where l.name="north")
where gardenerFK=
(
select pic.gardenerFK from picked pic join plant p on p.plantid=pic.plantFK join gardener g on g.gardenerid=pic.gardenerFK
where g.name="Erin" and p.name="Tomato"
)
;

update picked set locationFK=(select l.locationid from location l where l.name="north")
where gardenerFK=
(select gardenerid from gardener where name="Erin") and plantFK=(select plantid from plant where name="Tomato");



/*3.)Insert a new column 'Exper'
 of type Number (30) to the 'gardener' table which stores Experience of the of person. How will you modify this to varchar2(30).*/
 
 
 alter table gardener add column Exper Integer(30);
Query OK, 0 rows affected (0.97 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc gardener;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| gardenerid | int(11)     | NO   | PRI | NULL    |       |
| name       | varchar(30) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
| Exper      | int(30)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+


alter table gardener modify Exper varchar(30);
Query OK, 4 rows affected (1.98 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc gardener;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| gardenerid | int(11)     | NO   | PRI | NULL    |       |
| name       | varchar(30) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
| Exper      | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+


/*4.Write a query to find the plant name which required seeds less than 20 which plant on 14-APR*/

select p.name from plant p join planted pl on p.plantid=pl.plantFK 
where pl.seeds<20 and pl.date1=(select distinct(date1) from planted where date_format(date1,'%d-%b')='14-APR');

+--------+
| name   |
+--------+
| Carrot |
+--------+


/*5.)List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.*/

select name,sunlight,water from plant where name like 'r%' or name like 'c%';

+--------+----------+-------+
| name   | sunlight | water |
+--------+----------+-------+
| Carrot |        0 |     1 |
| Corn   |        0 |     1 |
| Radish |        0 |     1 |
+--------+----------+-------+


/*6.Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden.
 The output should be in descending order of plant name.*/
 


 select p.name,sum(pd.seeds) from planted pd inner join plant p on pd.plantFK=p.plantid group by p.name order by p.name desc ;
+---------+---------------+
| name    | sum(pd.seeds) |
+---------+---------------+
| Tomato  |            38 |
| Radish  |            30 |
| Lettuce |            30 |
| Corn    |            32 |
| Carrot  |            70 |
| Beet    |            36 |
+---------+---------------+


/*7.)Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:
( (Average Number of Items = Total Amount Picked / Total Seeds Planted.) */



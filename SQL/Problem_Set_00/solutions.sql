   ///////////////////////////////////////////       COMPLETED DATE - 12-02-2019          ///////////////////////////////////////////////
--DB CREATION--
create Database Empoloyee_dept_Db;
use Empoloyee_dept_Db;

--Dept Table Creation--
create table dept(dep_id varchar(3) primary key,depname varchar(20),depmanager varchar(20));
--Inserting into Dept Table--
insert into dept values("D01","HEALTH","TIM ARCHER");
insert into dept values("D02","COMMUNICATIONS","ADAM JUSTIN");
insert into dept values("D03","PRODUCT","BRUCE WILLS");
insert into dept values("D04","INSURANCE","ROBERT SWIFT");
insert into dept values("D05","FINANCE","NATASHA STEVENS");

--Employee Table Creation--
create table employee(e_id varchar(5) ,name varchar(20),dep_id varchar(5) references dept(dep_id),salary number,managerid varchar(5));

--Inserting into Employee Table--
insert into employee values("A114","MARTIN TREDEAU","D01",54497,"A120");
insert into employee values("A116","ROBIN WAYNE","D02",20196,"A187");
insert into employee values("A178","BRUCE WILLS","D03",66861,"A298");
insert into employee values("A132","PAUL VINCENT","D01",94791,"A120");
insert into employee values("A198","TOM HANKS","D02",16879,"A187");
insert into employee values("A120","TIM ARCHER","D01",48834,"A298");
insert into employee values("A143","BRAD MICHAEL","D01",24488,"A120");
insert into employee values("A187","ADAM JUSTIN","D02",80543,"A298");
insert into employee values("A121","STUART WILLIAM","D02",78629,"A187");
insert into employee values("A187","ROBERT SWIFT","D04",27700,"A298");
insert into employee values("A176","EDWARD CANE","D01",89176,"A120");
insert into employee values("A142","TARA CUMMINGS","D04",99475,"A187");
insert into employee values("A130","VANESSA PARY","D04",28565,"A187");
insert into employee values("A128","ADAM WAYNE","D05",94324,"A165");
insert into employee values("A129","JOSEPH ANGELIN","D05",44280,"A165");
insert into employee values("A165","NATASHA STEVENS","D05",31377,"A298");
insert into employee values("A111","JOHN HELLEN","D01",15380,"A120");
insert into employee values("A194","HAROLLD STEVENS","D02",32166,"A187");
insert into employee values("A133","STEVE MICHELOS","D02",61215,"A187");
insert into employee values("A156","NICK MARTIN","D03",50174,"A178");

/*Queries:

1)Select the Employee with the top three salaries */

select name,salary from employee order by salary desc limit 3;

--2)Select the Employee with the least salary--

select name from employee where salary=(select min(salary) from employee);

select name from employee order by salary limit 1;

--3)Select the Employee who does not have a manager in the department table--

select name from employee where managerid not in (select e_id from employee);

--4)Select the Employee who is also a Manager--

select name,e_id from employee e join dept d on e.name=d.depmanager;

select name,e_id from employee where e_id in (select managerid from employee);

select e.name,e.e_id from employee e where e.e_id in (select distinct(managerid) from employee);

select distinct e.name,e.e_id from employee e join employee m where e.e_id=m.managerid;

--5)Select the Empolyee who is a Manager and has least salary--

select name,salary from employee e join dept d on e.name=d.depmanager order by salary limit 1;

--6)Select the total number of Employees in Communications departments--

select count(*) as 'No.of Employees in Communications departments' from employee where dep_id=(select dep_id from dept where depname='COMMUNICATIONS');

select count(*) from employee  where dep_id=(select dep_id from dept where depname='COMMUNICATIONS') group by dep_id;

select count(*) from employee e join dept d on d.dep_id=e.dep_id where d.depname='COMMUNICATIONS';

--7)Select the Employee in Finance Department who has the top salary--

select name,salary from employee where dep_id=(select dep_id from dept where depname='FINANCE') order by salary desc limit 1 ;

select e.name,e.salary from employee e join dept d on d.dep_id=e.dep_id where d.depname='FINANCE' order by e.salary desc limit 1;


--8)Select the Employee in product depatment who has the least salary--

select e.name,e.salary from employee e join dept d on d.dep_id=e.dep_id where d.depname='PRODUCT' order by salary limit 1;

--9)Select the count of Empolyees in Health with maximum salary--

select count(*) from employee e join dept d on d.dep_id=e.dep_id where d.depname='HEALTH';

select count(name) from employee where salary=(select max(salary) from employee e join dept d on d.dep_id=e.dep_id where d.depname='HEALTH');

--10)Select the Employees who report to Natasha Stevens--

select e.name,e.managerid from employee e join dept d on d.dep_id=e.dep_id where d.depmanager='NATASHA STEVENS';

--11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department--

select e.name,d.depname,d.depmanager from employee e join dept d on e.dep_id=d.dep_id  where d.depname='HEALTH';

--12)Display the Department id,Employee ids and Manager ids for the Communications department--

select d.dep_id,e.e_id,e.managerid from employee e join dept d on d.dep_id=e.dep_id where d.depname='COMMUNICATIONS';

--13)Select the Average Expenses for Each dept with Dept id and Dept name--

select avg(salary),d.dep_id,d.depname from employee e join dept d on d.dep_id=e.dep_id group by dep_id;

--14)Select the total expense for the department finance--

select sum(e.salary) as 'Total Finance Expense' from employee e join dept d on d.dep_id=e.dep_id where d.depname='FINANCE';


///////////////////////////////////////////       COMPLETED DATE - 13-02-2019          ///////////////////////////////////////////////
 
                                                                                                                               
                                                                                                                                
mysql> /*DB CREATION*/
mysql> create Database Empoloyee_dept_Db;
Query OK, 1 row affected (0.09 sec)

mysql>
mysql> use Empoloyee_dept_Db;
Database changed
mysql>
mysql> /*Dept Table Creation*/
mysql> create table dept(dep_id varchar(3) primary key,depname varchar(20),depmanager varchar(20));
Query OK, 0 rows affected (0.37 sec)

mysql>
mysql> /*View dept Table*/
mysql> desc dept;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| dep_id     | varchar(3)  | NO   | PRI | NULL    |       |
| depname    | varchar(20) | YES  |     | NULL    |       |
| depmanager | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql>
mysql>
mysql> /*Inserting into Dept Table*/
mysql> insert into dept values("D01","HEALTH","TIM ARCHER");
Query OK, 1 row affected (0.16 sec)

mysql> insert into dept values("D02","COMMUNICATIONS","ADAM JUSTIN");
Query OK, 1 row affected (0.30 sec)

mysql> insert into dept values("D03","PRODUCT","BRUCE WILLS");
Query OK, 1 row affected (0.08 sec)

mysql> insert into dept values("D04","INSURANCE","ROBERT SWIFT");
Query OK, 1 row affected (0.07 sec)

mysql> insert into dept values("D05","FINANCE","NATASHA STEVENS");
Query OK, 1 row affected (0.07 sec)

mysql>
mysql> /*Employee Table Creation*/
mysql> create table employee(e_id varchar(5) ,name varchar(20),dep_id varchar(5) references dept(dep_id),salary integer(10),managerid varchar(5));
Query OK, 0 rows affected (0.47 sec)

mysql>
mysql> /*View employee Table*/
mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| e_id      | varchar(5)  | YES  |     | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| dep_id    | varchar(5)  | YES  |     | NULL    |       |
| salary    | int(10)     | YES  |     | NULL    |       |
| managerid | varchar(5)  | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql>
mysql> /*Inserting into Employee Table*/
mysql> insert into employee values("A114","MARTIN TREDEAU","D01",54497,"A120");
Query OK, 1 row affected (0.05 sec)

mysql> insert into employee values("A116","ROBIN WAYNE","D02",20196,"A187");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A178","BRUCE WILLS","D03",66861,"A298");
Query OK, 1 row affected (0.30 sec)

mysql> insert into employee values("A132","PAUL VINCENT","D01",94791,"A120");
Query OK, 1 row affected (0.09 sec)

mysql> insert into employee values("A198","TOM HANKS","D02",16879,"A187");
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee values("A120","TIM ARCHER","D01",48834,"A298");
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee values("A143","BRAD MICHAEL","D01",24488,"A120");
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee values("A187","ADAM JUSTIN","D02",80543,"A298");
Query OK, 1 row affected (0.17 sec)

mysql> insert into employee values("A121","STUART WILLIAM","D02",78629,"A187");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A187","ROBERT SWIFT","D04",27700,"A298");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A176","EDWARD CANE","D01",89176,"A120");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A142","TARA CUMMINGS","D04",99475,"A187");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A130","VANESSA PARY","D04",28565,"A187");
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee values("A128","ADAM WAYNE","D05",94324,"A165");
Query OK, 1 row affected (0.30 sec)

mysql> insert into employee values("A129","JOSEPH ANGELIN","D05",44280,"A165");
Query OK, 1 row affected (0.10 sec)

mysql> insert into employee values("A165","NATASHA STEVENS","D05",31377,"A298");
Query OK, 1 row affected (0.31 sec)

mysql> insert into employee values("A111","JOHN HELLEN","D01",15380,"A120");
Query OK, 1 row affected (0.09 sec)

mysql> insert into employee values("A194","HAROLLD STEVENS","D02",32166,"A187");
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee values("A133","STEVE MICHELOS","D02",61215,"A187");
Query OK, 1 row affected (0.08 sec)

mysql> insert into employee values("A156","NICK MARTIN","D03",50174,"A178");
Query OK, 1 row affected (0.08 sec)

mysql>
mysql> /*Display dept Table */
mysql>
mysql> Select * from dept;
+--------+----------------+-----------------+
| dep_id | depname        | depmanager      |
+--------+----------------+-----------------+
| D01    | HEALTH         | TIM ARCHER      |
| D02    | COMMUNICATIONS | ADAM JUSTIN     |
| D03    | PRODUCT        | BRUCE WILLS     |
| D04    | INSURANCE      | ROBERT SWIFT    |
| D05    | FINANCE        | NATASHA STEVENS |
+--------+----------------+-----------------+
5 rows in set (0.00 sec)

mysql>
mysql> /*Display employee Table */
mysql>
mysql> Select * from employee;
+------+-----------------+--------+--------+-----------+
| e_id | name            | dep_id | salary | managerid |
+------+-----------------+--------+--------+-----------+
| A114 | MARTIN TREDEAU  | D01    |  54497 | A120      |
| A116 | ROBIN WAYNE     | D02    |  20196 | A187      |
| A178 | BRUCE WILLS     | D03    |  66861 | A298      |
| A132 | PAUL VINCENT    | D01    |  94791 | A120      |
| A198 | TOM HANKS       | D02    |  16879 | A187      |
| A120 | TIM ARCHER      | D01    |  48834 | A298      |
| A143 | BRAD MICHAEL    | D01    |  24488 | A120      |
| A187 | ADAM JUSTIN     | D02    |  80543 | A298      |
| A121 | STUART WILLIAM  | D02    |  78629 | A187      |
| A187 | ROBERT SWIFT    | D04    |  27700 | A298      |
| A176 | EDWARD CANE     | D01    |  89176 | A120      |
| A142 | TARA CUMMINGS   | D04    |  99475 | A187      |
| A130 | VANESSA PARY    | D04    |  28565 | A187      |
| A128 | ADAM WAYNE      | D05    |  94324 | A165      |
| A129 | JOSEPH ANGELIN  | D05    |  44280 | A165      |
| A165 | NATASHA STEVENS | D05    |  31377 | A298      |
| A111 | JOHN HELLEN     | D01    |  15380 | A120      |
| A194 | HAROLLD STEVENS | D02    |  32166 | A187      |
| A133 | STEVE MICHELOS  | D02    |  61215 | A187      |
| A156 | NICK MARTIN     | D03    |  50174 | A178      |
+------+-----------------+--------+--------+-----------+
20 rows in set (0.00 sec)

mysql>
mysql>
mysql> /*Queries:
   /*>
   /*> 1)Select the Employee with the top three salaries */
mysql>
mysql> select name,salary from employee order by salary desc limit 3;
+---------------+--------+
| name          | salary |
+---------------+--------+
| TARA CUMMINGS |  99475 |
| PAUL VINCENT  |  94791 |
| ADAM WAYNE    |  94324 |
+---------------+--------+
3 rows in set (0.00 sec)

mysql>
mysql> /*2)Select the Employee with the least salary*/
mysql>
mysql> select name from employee where salary=(select min(salary) from employee);
+-------------+
| name        |
+-------------+
| JOHN HELLEN |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> select name from employee order by salary limit 1;
+-------------+
| name        |
+-------------+
| JOHN HELLEN |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /*3)Select the Employee who does not have a manager in the department table*/
mysql>
mysql> select name from employee where managerid not in (select e_id from employee);
+-----------------+
| name            |
+-----------------+
| BRUCE WILLS     |
| TIM ARCHER      |
| ADAM JUSTIN     |
| ROBERT SWIFT    |
| NATASHA STEVENS |
+-----------------+
5 rows in set (0.00 sec)

mysql>
mysql> /*4)Select the Employee who is also a Manager*/
mysql>
mysql> select name,e_id from employee e join dept d on e.name=d.depmanager;
+-----------------+------+
| name            | e_id |
+-----------------+------+
| BRUCE WILLS     | A178 |
| TIM ARCHER      | A120 |
| ADAM JUSTIN     | A187 |
| ROBERT SWIFT    | A187 |
| NATASHA STEVENS | A165 |
+-----------------+------+
5 rows in set (0.00 sec)

mysql>
mysql> select name,e_id from employee where e_id in (select managerid from employee);
+-----------------+------+
| name            | e_id |
+-----------------+------+
| BRUCE WILLS     | A178 |
| TIM ARCHER      | A120 |
| ADAM JUSTIN     | A187 |
| ROBERT SWIFT    | A187 |
| NATASHA STEVENS | A165 |
+-----------------+------+
5 rows in set (0.00 sec)

mysql>
mysql> select e.name,e.e_id from employee e where e.e_id in (select distinct(managerid) from employee);
+-----------------+------+
| name            | e_id |
+-----------------+------+
| BRUCE WILLS     | A178 |
| TIM ARCHER      | A120 |
| ADAM JUSTIN     | A187 |
| ROBERT SWIFT    | A187 |
| NATASHA STEVENS | A165 |
+-----------------+------+
5 rows in set (0.00 sec)

mysql>
mysql> /*5)Select the Empolyee who is a Manager and has least salary*/
mysql>
mysql> select name,salary from employee e join dept d on e.name=d.depmanager order by salary limit 1;
+--------------+--------+
| name         | salary |
+--------------+--------+
| ROBERT SWIFT |  27700 |
+--------------+--------+
1 row in set (0.00 sec)

mysql>
mysql> /*6)Select the total number of Employees in Communications departments*/
mysql>
mysql> select count(*) as 'No.of Employees in Communications departments' from employee where dep_id=(select dep_id from dept where depname='COMMUNICATIONS');
+-----------------------------------------------+
| No.of Employees in Communications departments |
+-----------------------------------------------+
|                                             6 |
+-----------------------------------------------+
1 row in set (0.00 sec)

mysql>
mysql> select count(*) from employee  where dep_id=(select dep_id from dept where depname='COMMUNICATIONS') group by dep_id;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)

mysql>
mysql> select count(*) from employee e join dept d on d.dep_id=e.dep_id where d.depname='COMMUNICATIONS';
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)

mysql>
mysql> /*7)Select the Employee in Finance Department who has the top salary*/
mysql>
mysql> select name,salary from employee where dep_id=(select dep_id from dept where depname='FINANCE') order by salary desc limit 1 ;
+------------+--------+
| name       | salary |
+------------+--------+
| ADAM WAYNE |  94324 |
+------------+--------+
1 row in set (0.00 sec)

mysql>
mysql> select e.name,e.salary from employee e join dept d on d.dep_id=e.dep_id where d.depname='FINANCE' order by e.salary desc limit 1;
+------------+--------+
| name       | salary |
+------------+--------+
| ADAM WAYNE |  94324 |
+------------+--------+
1 row in set (0.00 sec)

mysql>
mysql>
mysql> /*8)Select the Employee in product depatment who has the least salary*/
mysql>
mysql> select e.name,e.salary from employee e join dept d on d.dep_id=e.dep_id where d.depname='PRODUCT' order by salary limit 1;
+-------------+--------+
| name        | salary |
+-------------+--------+
| NICK MARTIN |  50174 |
+-------------+--------+
1 row in set (0.00 sec)

mysql>
mysql> /*9)Select the count of Empolyees in Health with maximum salary*/
mysql>
mysql> select count(*) from employee e join dept d on d.dep_id=e.dep_id where d.depname='HEALTH';
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)

mysql>
mysql> select count(name) from employee where salary=(select max(salary) from employee e join dept d on d.dep_id=e.dep_id where d.depname='HEALTH');
+-------------+
| count(name) |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /*10)Select the Employees who report to Natasha Stevens*/
mysql>
mysql> select e.name,e.managerid from employee e join dept d on d.dep_id=e.dep_id where d.depmanager='NATASHA STEVENS';
+-----------------+-----------+
| name            | managerid |
+-----------------+-----------+
| ADAM WAYNE      | A165      |
| JOSEPH ANGELIN  | A165      |
| NATASHA STEVENS | A298      |
+-----------------+-----------+
3 rows in set (0.00 sec)

mysql>
mysql> /*11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department*/
mysql>
mysql> select e.name,d.depname,d.depmanager from employee e join dept d on e.dep_id=d.dep_id  where d.depname='HEALTH';
+----------------+---------+------------+
| name           | depname | depmanager |
+----------------+---------+------------+
| MARTIN TREDEAU | HEALTH  | TIM ARCHER |
| PAUL VINCENT   | HEALTH  | TIM ARCHER |
| TIM ARCHER     | HEALTH  | TIM ARCHER |
| BRAD MICHAEL   | HEALTH  | TIM ARCHER |
| EDWARD CANE    | HEALTH  | TIM ARCHER |
| JOHN HELLEN    | HEALTH  | TIM ARCHER |
+----------------+---------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> /*12)Display the Department id,Employee ids and Manager ids for the Communications department*/
mysql>
mysql> select d.dep_id,e.e_id,e.managerid from employee e join dept d on d.dep_id=e.dep_id where d.depname='COMMUNICATIONS';
+--------+------+-----------+
| dep_id | e_id | managerid |
+--------+------+-----------+
| D02    | A116 | A187      |
| D02    | A198 | A187      |
| D02    | A187 | A298      |
| D02    | A121 | A187      |
| D02    | A194 | A187      |
| D02    | A133 | A187      |
+--------+------+-----------+
6 rows in set (0.00 sec)

mysql>
mysql> /*13)Select the Average Expenses for Each dept with Dept id and Dept name*/
mysql>
mysql> select avg(salary),d.dep_id,d.depname from employee e join dept d on d.dep_id=e.dep_id group by dep_id;
+-------------+--------+----------------+
| avg(salary) | dep_id | depname        |
+-------------+--------+----------------+
|  54527.6667 | D01    | HEALTH         |
|  48271.3333 | D02    | COMMUNICATIONS |
|  58517.5000 | D03    | PRODUCT        |
|  51913.3333 | D04    | INSURANCE      |
|  56660.3333 | D05    | FINANCE        |
+-------------+--------+----------------+
5 rows in set (0.00 sec)

mysql>
mysql> /*14)Select the total expense for the department finance*/
mysql>
mysql> select sum(e.salary) as 'Total Finance Expense' from employee e join dept d on d.dep_id=e.dep_id where d.depname='FINANCE';
+-----------------------+
| Total Finance Expense |
+-----------------------+
|                169981 |
+-----------------------+
1 row in set (0.00 sec)

mysql>
mysql> /*15)Select the department which spends the least with Dept id and Dept manager name*/
mysql>
mysql> select min(P) from (select sum(salary) P from employee e join dept d on d.dep_id=e.dep_id group by e.dep_id) as temp;
+--------+
| min(P) |
+--------+
| 117035 |
+--------+
1 row in set (0.00 sec)

mysql>
mysql> select sum(e.salary) P ,d.dep_id,d.depname,d.depmanager from employee e join dept d on d.dep_id=e.dep_id group by e.dep_id order by P limit 1;
+--------+--------+---------+-------------+
| P      | dep_id | depname | depmanager  |
+--------+--------+---------+-------------+
| 117035 | D03    | PRODUCT | BRUCE WILLS |
+--------+--------+---------+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /*16)Select the count of Employees in each department*/
mysql>
mysql> select count(*) from employee e join dept d on d.dep_id=e.dep_id group by d.depname;
+----------+
| count(*) |
+----------+
|        6 |
|        6 |
|        2 |
|        3 |
|        3 |
+----------+
5 rows in set (0.00 sec)

mysql>
mysql> /*17)Select the count of Employees in each department having salary <10000*/
mysql>
mysql>
mysql> select count(*),d.depname from employee e join dept d on d.dep_id=e.dep_id where e.salary<10000 group by d.depname ;
Empty set (0.00 sec)

mysql>
mysql>
mysql> /*18)Select the total number of Employees in Dept id D04*/
mysql>
mysql> select count(*)as 'TOTAL EMPLOYEES IN D04' from employee where dep_id='D04';
+------------------------+
| TOTAL EMPLOYEES IN D04 |
+------------------------+
|                      3 |
+------------------------+
1 row in set (0.00 sec)

mysql>
mysql> /*19)Select all department details of the Department with Maximum Employees -NOT COMPLETED*/
mysql>
mysql> select e.name,d.dep_id,d.depname,d.depmanager from employee e join dept d on d.dep_id=e.dep_id ;
+-----------------+--------+----------------+-----------------+
| name            | dep_id | depname        | depmanager      |
+-----------------+--------+----------------+-----------------+
| MARTIN TREDEAU  | D01    | HEALTH         | TIM ARCHER      |
| ROBIN WAYNE     | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| BRUCE WILLS     | D03    | PRODUCT        | BRUCE WILLS     |
| PAUL VINCENT    | D01    | HEALTH         | TIM ARCHER      |
| TOM HANKS       | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| TIM ARCHER      | D01    | HEALTH         | TIM ARCHER      |
| BRAD MICHAEL    | D01    | HEALTH         | TIM ARCHER      |
| ADAM JUSTIN     | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| STUART WILLIAM  | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| ROBERT SWIFT    | D04    | INSURANCE      | ROBERT SWIFT    |
| EDWARD CANE     | D01    | HEALTH         | TIM ARCHER      |
| TARA CUMMINGS   | D04    | INSURANCE      | ROBERT SWIFT    |
| VANESSA PARY    | D04    | INSURANCE      | ROBERT SWIFT    |
| ADAM WAYNE      | D05    | FINANCE        | NATASHA STEVENS |
| JOSEPH ANGELIN  | D05    | FINANCE        | NATASHA STEVENS |
| NATASHA STEVENS | D05    | FINANCE        | NATASHA STEVENS |
| JOHN HELLEN     | D01    | HEALTH         | TIM ARCHER      |
| HAROLLD STEVENS | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| STEVE MICHELOS  | D02    | COMMUNICATIONS | ADAM JUSTIN     |
| NICK MARTIN     | D03    | PRODUCT        | BRUCE WILLS     |
+-----------------+--------+----------------+-----------------+
20 rows in set (0.00 sec)

mysql>
mysql> /*20)Select the Employees who has TIM ARCHER as their manager*/
mysql>
mysql> select e.name from employee e join dept d on e.dep_id=d.dep_id where d.depmanager='TIM ARCHER';
+----------------+
| name           |
+----------------+
| MARTIN TREDEAU |
| PAUL VINCENT   |
| TIM ARCHER     |
| BRAD MICHAEL   |
| EDWARD CANE    |
| JOHN HELLEN    |
+----------------+
6 rows in set (0.00 sec)


                                                                                                                                  
                                                                                                                                  

                                                                                                                                              

                                                                                                                                              
                                                                                                                                              

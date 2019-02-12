/*Completed on 11-02-2019*/

create Database Harini_BookStore;
use Harini_BookStore;

create table Users(U_id char(5) primary key,
Name varchar(20) NOT NULL,
eMail varchar(20) unique,
Addr varchar(40) NOT NULL,
City varchar(20)NOT NULL,
ZipCode integer(10) NOT NULL);

desc Users;

create table Checkout(Chck_id integer(4) primary key,
Chck_date DATE NOT NULL,
Return_date DATE DEFAULT '0000-00-00',
U_id char(5) REFERENCES Users(U_id),
B_id integer(4) REFERENCES Books(B_id)
);

desc Checkout;

create Table Books(B_id integer(4) PRIMARY KEY,
ISBN integer(15) unique,
Title VARCHAR(50) not null,Author Varchar(40) not null,
Edition char(8) DEFAULT 'FIRST');

insert into Users values('A10','GOPI','gopi@gmail.com','xygajksdbvujasd','chennai',600053);
insert into Users values('B13','sampada','sam@gmail.com','xygajksdbvujasd','chrompet',600033);
insert into Users values('B14','sandya','sand@gmail.com','xygajksdbvujasd','tambaram',603452);
insert into Users values('X10','swathi','swea@gmail.com','xygajksdbvujasd','kanchi',608222);
insert into Users values('T19','harini','hari@gmail.com','xygajksdbvujasd','banglore',607686);

select * from Users;

insert into Checkout values(1,'2017-12-23','2017-12-30','A10',101);
insert into Checkout values(2,'2014-1-12','2015-12-30','B13',101);
insert into Checkout(Chck_id,Chck_date,U_id,B_id) values(3,'2012-10-2','A10',102);
insert into Checkout values(4,'2013-8-3','2015-12-30','X10',103);
insert into Checkout (Chck_id,Chck_date,U_id,B_id) values(5,'2018-4-13','T19',104);
insert into Checkout (Chck_id,Chck_date,U_id,B_id) values(6,'2016-2-13','B13',104);



select * from Checkout;

insert into  Books values(101,13146461,'Alice in wonderland','lewis','SECOND');
insert into  Books values(102,31434135,'Game of thrones','RR.Martin','EIGHTH');
insert into  Books(B_id,ISBN,Title,Author) values(103,32168431,'Half Girlfriend','Chetan');
insert into  Books values(104,88989546,'Two States','Bhagat','SEVENTH');
insert into Books values(105,24234324,'SQL PADINGA','GOPI','TENTH');

select * from Books



/*Ques:
	User Details who purchased books
Query:*/
	select u.Name,u.eMail,c.Chck_date,c.Return_date from Users u Inner Join Checkout c on u.U_id=c.U_id;
	

	
/*Ques:
	User details regardless of purchasing books
Query:*/
	select u.Name from Users u left Join Checkout c on u.U_id=c.U_id;
	--User details regardless of purchasing books with their names and joining 3 tables with left join--
	select u.Name,b.Title from Users u left Join Checkout c on u.U_id=c.U_id left join Books b on b.B_id=c.B_id;

	

/*Ques:
	
	Books not purchased
Query:*/
	select b.Title,b.Author from  Checkout c right Join Books b on b.B_id=c.B_id where c.Chck_id is NULL;

/*Ques:
	Get Users who have not returned books
Query:*/
	select u.Name from Users u left join Checkout c on u.U_id=c.U_id where Return_date is Null;
	
/*Ques:
	Get Users who have not returned books and there corresponding book names [left join returns even null values i.e who has not purchased]
Query:*/
select u.Name,b.Title from Users u left join Checkout c on u.U_id=c.U_id inner join Books b on b.B_id=c.B_id where Return_date is Null;


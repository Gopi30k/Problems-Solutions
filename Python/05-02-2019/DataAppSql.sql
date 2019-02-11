Drop table IF exists dept;
create table dept(
  deptno     number(2,0),
  dname      varchar2(14),
  empno    number(4,0)
  );

insert into dept values(10,'IT',1021);
insert into dept values(11,'ECE',1020);
insert into dept values(12,'CSE',1023);

Drop table IF exists emp;
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  sal      number(7,2),
  deptno   number(2,0)
);
insert into emp values(7782, 'CLARK',12000,11);

insert into emp values(2311, 'SAM',23000,12);
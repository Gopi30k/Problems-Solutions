Drop table IF exists emp;
CREATE TABLE emp (
staff_number INTEGER PRIMARY KEY,  
fname VARCHAR(20),  
lname VARCHAR(30),  
gender CHAR(1),  
joining DATE);
INSERT INTO emp(staff_number,fname,lname,gender,joining) VALUES (?, ?, ?, ?,?);
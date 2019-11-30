drop database if exists PEASE;
create database PEASE;
use PEASE;

create table university (
u_regno int (20) AUTO_INCREMENT,
u_name varchar (55),
u_address varchar (55),
u_zipe int (20),
u_email varchar (55) NOT NULL,
u_phone varchar (55) NOT NULL,

CONSTRAINT pk_university PRIMARY KEY (u_regno)
);

insert into university (u_name, u_address, u_zipe, u_email, u_phone) values ('jhonjay', 'jamaica', 11432, 'jhonjay@collage.com', 3472028585),
('lga','sunnyside', 11744, 'lga@collage.com', 8282048594),
('hunter','nyc', 10001, 'hunter@collage.com', 2122028999),
('nyu', 'midtown', 10002, 'nyu@collage.com', 2125558577),
('liu', 'stonybrook', 11744, 'liu@collage.com', 5164849191);

select * from university;

create table student (
s_id int (20) AUTO_INCREMENT,
s_fname varchar (55),
s_lname varchar (55),
s_address varchar (55),
s_zipe int (20),
s_email varchar (55) NOT NULL,
s_phone varchar (55) NOT NULL,
u_regno int (20),

CONSTRAINT pk_student PRIMARY KEY (s_id),
CONSTRAINT fk_student  FOREIGN KEY (u_regno) REFERENCES university (u_regno)
);

insert into student (s_fname, s_lname, s_address, s_zipe, s_email, s_phone, u_regno) values ('jhon', 'wick', 'jacksonheights', 11372, 'jhonwick@gmail.com', 7181014343, 1),
('david', 'king', 'corona', 11378, 'davidking@gmail.com', 3475596464, 2),
('rani', 'khadus', 'mumbai', 11385, 'rani@gmail.com', 9295596465, 3),
('raj', 'singh', 'astoria', 11390, 'raj@gmail.com', 3478516464, 4),
('james', 'khan', 'eastelmhurst', 11349, 'jamesk@gmail.com', 3585596464, 5);

select * from student;

create table  professor (
p_id int (20) AUTO_INCREMENT,
p_fname varchar (55),
p_lname varchar (55),
p_address varchar (55),
p_zipe int (20),
p_email varchar (55) NOT NULL,
p_phone varchar (55) NOT NULL,
u_regno int (20),
s_id int (20),

CONSTRAINT pk_professor PRIMARY KEY (p_id),
CONSTRAINT fk1_professor FOREIGN KEY (u_regno) REFERENCES university (u_regno),
CONSTRAINT fk2_professor FOREIGN KEY (s_id) REFERENCES student (s_id)
);

insert into professor (p_fname, p_lname, p_address, p_zipe, p_email, p_phone, u_regno, s_id) values ('mark', 'fernandes', '3945 astoria', 11765, 'markf@gmail.com', 7185659889, 1, 1), 
('joe', 'molla', '3911 astoria', 11776, 'joem@gmail.com', 3475659857, 2, 2),
('vivek', 'uddin', '3955 astoria', 11732, 'viveku@gmail.com', 9295659833, 3, 3),
('ali', 'stiven', '3987 astoria', 11716, 'alis@gmail.com', 5165659800, 4, 4),
('karim','coal', '3990 astoria', 11739, 'karimc@gmail.com', 9175659821, 5, 5);

select * from professor;

create table  subject (
sname varchar (55),
sdesc varchar (55),
slocation varchar (55),
scredit int (20),
szipe int (20),
semail varchar (55) NOT NULL,
sphone varchar (55) NOT NULL,
p_id int (20),
s_id int (20),

CONSTRAINT fk1_subject FOREIGN KEY (p_id) REFERENCES professor (p_id),
CONSTRAINT fk2_subject FOREIGN KEY (s_id) REFERENCES student (s_id)
);

insert into subject (sname, sdesc, slocation, scredit, szipe, semail, sphone, p_id, s_id) values ('mark', 'american', '3945 astoria', 11765, 205, 'markf@gmail.com', 7185659889, 1, 1),
('joe', 'british', '3911 astoria', 11776, 208, 'joem@gmail.com', 3475659857 , 2, 2),
('vivek', 'indian', '3955 astoria', 11732, 209, 'viveku@gmail.com', 9295659833, 3, 3),
('ali', 'paki', '3987 astoria', 11716, 257, 'alis@gmail.com', 5165659800, 4, 4),
('karim', 'bengali', '3990 astoria', 11739, 273, 'karimc@gmail.com', 9175659821, 5, 5);

select * from subject;

# INNER JOIN:
select student.s_fname, student.s_lname, professor.p_phone, professor.p_fname, professor.p_id, student.u_regno
FROM student INNER JOIN professor
on student.u_regno=professor.u_regno;
	



# INNER JOIN:
select student.s_fname, student.s_lname, professor.p_phone, professor.p_fname, professor.p_id, 
university.u_name, university.u_address, student.u_regno
FROM student INNER JOIN professor
on student.u_regno=professor.u_regno
INNER JOIN university
on professor.u_regno=university.u_regno;


STORE PROCEDURE WHICH IS YOUR OWN FUNCTION




# CONCAT()  TO JOINT MULTIPLE COLUMN IN 1 COLUMN AS NEW COLUMN,
select CONCAT(p_fname, " ", p_lname, " ", p_phone, " ", p_email) AS CONTACT_INFO from Professor;

select CONCAT(p_fname, "/ ", p_lname, " /", p_phone, " /", p_email) AS CONTACT_INFO from Professor;

select CONCAT(p_fname, "| ", p_lname, "| ", p_phone, "| ", p_email) AS CONTACT_INFO from Professor;


select CONCAT_WS (" | ", p_fname,  p_lname, p_phone, p_email) AS CONTACT_INFO from Professor;
# OMITING FREQUENT SEPARATOR

select LCASE (p_fname), UCASE (p_lname) AS SOMETHING FROM Professor;
# LCASE = LOWER CASE, UCASE = UPPER CASE
# THIS CHANGE DOES NOT EFFECT ON ORIGINAL DATABASE


#SELECT SUBSTRING (p_phone, start.pos_no, end.pos_no) AS SOMETHING FROM Professor;
SELECT SUBSTRING (p_phone, start.position2, ending.position2) AS SOMETHING FROM Professor;
# these command are NOT WORKING as of version problem

select p_fname, LEFT (p_fname, 3) AS SOMETHING from professor;
# this will print only 3 correcters from left side as SOMETHING

select p_fname, RIGHT (p_fname, 3) AS SOMETHING from professor;
# this will print only 3 correcters from RIGHT side as SOMETHING

select p_phone, RIGHT (p_phone, 4) AS SOMETHING from Professor;
# this will print only last 4 DIGIT Professor's phone no as SOMETHING columnName

select p_phone, LEFT(p_phone, 4) AS SOMETHING from Professor;
# EXTRACTING LEFT 4 DIGIT p_phone from LEFT

select p_phone, right ( LEFT (p_phone, 4), 3) AS SOMETHING from Professor;
/* EXTRACTING LEFT 4 DIGIT p_phone from LEFT @First, then 3 DIGIT FROM right, 
"LEFT (p_phone, 4)" become a one parameter, */

select p_phone, right ( LEFT (p_phone, 7), 3) AS SOMETHING from Professor;


select reverse (p_phone) as SOMETHING from Professor;

select locate ('a', s_fname) from student;

mysql> select locate ('a', s_fname) from student;
/*+-----------------------+
| locate ('a', s_fname) |
+-----------------------+
|                     0 |
|                     2 |
|                     2 |
|                     2 |
|                     2 |
+-----------------------+
5 rows in set (0.09 sec)*/

select repeat (s_fname, 3) from student;


#select replace (columnName, "a", "1") from student;

select replace (s_fname, "a", "1") from student;
/*
+-----------------------------+
| replace (s_fname, "a", "1") |
+-----------------------------+
| jhon                        |
| d1vid                       |
| r1ni                        |
| r1j                         |
| j1mes                       |
+-----------------------------+ */


select reverse(s_fname) from student;

select TRIM(s_fname) from student; 

select LTRIM(s_fname) from student;
select LTRIM(s_fname) from student;

#select MID(columnName, START, END) FROM tableNane;

select MID(s_fname, 2, 3) FROM student;

select SUBSTRING(s_fname, 2, 4) from student; 

select mid-substring(s_fname, -5, 5);
 
select SUBSTRING_index(s_fname, );

select SUBSTRING_index(s_email, '@', 1);


Alter table student SET TBLPROPERTIES('EXTERNAL'='TRUE'); 
# CHANGING MANAGE TABLE TO EXTERNAL TABLE


select AVG(s_zipe) from student;

select COUNT(s_zipe) from student;

select count(s_zipe) from student;

select MAX(s_zipe) from student;

select MIN(s_zipe) from student;


select ROUND(AVG(s_zipe)) from student;  # Taking ROUND FIGURES

select ROUND(AVG(s_zipe), 0) from student;

select ROUND(AVG(s_zipe), 2) from student;

select SUM(s_zipe) from student;


select AVG(s_zipe) from student;

select * FROM student where s_zipe LIKE '%1';   # Ending charecter 1

select * FROM student where s_zipe LIKE '1%';   # Starting charecter 1

select * FROM student where s_zipe LIKE '%1%';  # IF 1 is in between 

select * FROM student where s_zipe LIKE '1%1';  # starting 1 & Ending 1

select * FROM student where s_fname LIKE 'abc%';	# Starting with abc

select * FROM student where s_fname LIKE '[abc]%';  # starting with either a, b, or c





























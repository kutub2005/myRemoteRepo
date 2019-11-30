SHOW databases;
USE database_Name;
show tables;
desc table_name
create database if not exists database_Name;

Create database Pace_University;
Use Pace_University;

Create TABLE employee (
employee_id int (20),
fa_name VARCHAR (55),
la_name VARCHAR (55),
gender varchar (4),
position varchar (20),
department_id int (5) NOT NULL,
salary int (10)
);
# checked # HOW TO MODIFY TABLE & COLUMNS:
# ALTER TABLE table_name RENAME COLUMN old_col_name TO new_col_name;
# ALTER TABLE employee RENAME COLUMN l_name TO la_name;

# ALTER TABLE table_name MODIFY col_name new_type ;
# ALTER TABLE employee MODIFY department_id int (5) ;
*To See Table Schema:

mysql> desc employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| employee_id   | int(20)     | YES  |     | NULL    |       |
| fa_name       | varchar(55) | YES  |     | NULL    |       |
| la_name       | varchar(55) | YES  |     | NULL    |       |
| gender        | varchar(4)  | YES  |     | NULL    |       |
| position      | varchar(20) | YES  |     | NULL    |       |
| department_id | int(5)      | YES  |     | NULL    |       |
| salary        | int(10)     | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.06 sec)

** INSERTING VALUES INTO TABLE:

INSERT INTO employee (employee_id, fa_name, la_name, gender, position, department_id, salary)
 VALUES (2002, "supper", "Man", "M", "Tester", 1, 75000), 
 (2003, "Jesica", "Liyers", "F", "Architect", 1, 60000),
 (2004, "Bonnie", "Adams", "F", "Project Manager", 1, 80000),
 (2005, "James", "Madison", "M", "Software Developer", 1, 55000),
 (2006, "Michael", "Greenback", "M", "Sales Assistant", 2, 85000),
 (2007, "Leslie", "Peters", "F", "Sales Engineer", 2, 76000),
 (2008, "Max", "Powers", "M", "Sales Representative", 2, 59000),
 (2009, "Stacy", "Jacobs", "F", "Sales Manager", 2, 73000),
 (2010, "John", "Henery", "M", "Sales MaDirector", 2, 90000)
;
** TO SEE A TABLE WITH DATA:
mysql> select * from employee;
+-------------+---------+-----------+--------+----------------------+---------------+--------+
| employee_id | fa_name | la_name   | gender | position             | department_id | salary |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
|        2002 | supper  | Man       | M      | Tester               |             1 |  75000 |
|        2003 | Jesica  | Liyers    | F      | Architect            |             1 |  60000 |
|        2004 | Bonnie  | Adams     | F      | Project Manager      |             1 |  80000 |
|        2005 | James   | Madison   | M      | Software Developer   |             1 |  55000 |
|        2006 | Michael | Greenback | M      | Sales Assistant      |             2 |  85000 |
|        2007 | Leslie  | Peters    | F      | Sales Engineer       |             2 |  76000 |
|        2008 | Max     | Powers    | M      | Sales Representative |             2 |  59000 |
|        2009 | Stacy   | Jacobs    | F      | Sales Manager        |             2 |  73000 |
|        2010 | John    | Henery    | M      | Sales MaDirector     |             2 |  90000 |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
9 rows in set (0.05 sec)
mysql> SELECT * FROM employee ORDER BY salary desc;
+-------------+---------+-----------+--------+----------------------+---------------+--------+
| employee_id | fa_name | la_name   | gender | position             | department_id | salary |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
|        2010 | John    | Henery    | M      | Sales MaDirector     |             2 |  90000 |
|        2006 | Michael | Greenback | M      | Sales Assistant      |             2 |  85000 |
|        2004 | Bonnie  | Adams     | F      | Project Manager      |             1 |  80000 |
|        2007 | Leslie  | Peters    | F      | Sales Engineer       |             2 |  76000 |
|        2002 | supper  | Man       | M      | Tester               |             1 |  75000 |
|        2009 | Stacy   | Jacobs    | F      | Sales Manager        |             2 |  73000 |
|        2003 | Jesica  | Liyers    | F      | Architect            |             1 |  60000 |
|        2008 | Max     | Powers    | M      | Sales Representative |             2 |  59000 |
|        2005 | James   | Madison   | M      | Software Developer   |             1 |  55000 |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
9 rows in set (0.00 sec)
mysql> SELECT * FROM employee ORDER BY salary desc;
mysql> SELECT * FROM employee ORDER BY salary DESC LIMIT 1 ;
** TO FIND 2ND HIGHEST salary:
mysql> SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 1; 
** DOUBLE Query Also allowed by separating with semicolon (;):
mysql> SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 1;
SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 4;


Create TABLE department (
department_id int (5) NOT NULL,
department_name varchar (20)
);
# checked
# ALTER TABLE department MODIFY department_id int (5) NOT NULL; 
# Query OK, 0 rows affected (0.15 sec)

INSERT INTO department (department_id, department_name) 
VALUES (1, "IT"), 
	(2, "Sales");

/*	ALTER TABLE `employee`
DROP PRIMARY KEY, 
ADD PRIMARY KEY (department_id);   # new_primary_key = */

ALTER TABLE `employee`
DROP PRIMARY KEY,
ADD PRIMARY KEY (department_id);

** INNER JOIN:
mysql> select * from employee t1 INNER JOIN department T2 ON T1.department_id = t2.department_id;
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
| employee_id | fa_name | la_name   | gender | position             | department_id | salary | department_id | department_name |
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
|        2002 | supper  | Man       | M      | Tester               |             1 |  75000 |             1 | IT              |
|        2003 | Jesica  | Liyers    | F      | Architect            |             1 |  60000 |             1 | IT              |
|        2004 | Bonnie  | Adams     | F      | Project Manager      |             1 |  80000 |             1 | IT              |
|        2005 | James   | Madison   | M      | Software Developer   |             1 |  55000 |             1 | IT              |
|        2006 | Michael | Greenback | M      | Sales Assistant      |             2 |  85000 |             2 | Sales           |
|        2007 | Leslie  | Peters    | F      | Sales Engineer       |             2 |  76000 |             2 | Sales           |
|        2008 | Max     | Powers    | M      | Sales Representative |             2 |  59000 |             2 | Sales           |
|        2009 | Stacy   | Jacobs    | F      | Sales Manager        |             2 |  73000 |             2 | Sales           |
|        2010 | John    | Henery    | M      | Sales MaDirector     |             2 |  90000 |             2 | Sales           |
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
9 rows in set (0.00 sec)

select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id;

select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
ORDER BY salary DESC;

TO FIND 5TH HIGHEST salary in desc ORDER:
select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
ORDER BY salary DESC LIMIT 1 OFFSET 4;

select * from employee t1 RIGHT OUTER JOIN department T2 ON T1.department_id = t2.department_id ;

/** SEMI JOIN (EXISTS): similar to INNER JOIN BUT LESS DUPLICATE COLUMN:
select * from employee t1 WHERE EXISTS (SELECT 1 FROM department T2 WHERE T1.department_id = t2.department_id); */ 
mysql> select * from employee t1 WHERE EXISTS (SELECT 1 FROM department T2 WHERE T1.department_id = t2.department_id);
+-------------+---------+-----------+--------+----------------------+---------------+--------+
| employee_id | fa_name | la_name   | gender | position             | department_id | salary |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
|        2002 | supper  | Man       | M      | Tester               |             1 |  75000 |
|        2003 | Jesica  | Liyers    | F      | Architect            |             1 |  60000 |
|        2004 | Bonnie  | Adams     | F      | Project Manager      |             1 |  80000 |
|        2005 | James   | Madison   | M      | Software Developer   |             1 |  55000 |
|        2006 | Michael | Greenback | M      | Sales Assistant      |             2 |  85000 |
|        2007 | Leslie  | Peters    | F      | Sales Engineer       |             2 |  76000 |
|        2008 | Max     | Powers    | M      | Sales Representative |             2 |  59000 |
|        2009 | Stacy   | Jacobs    | F      | Sales Manager        |             2 |  73000 |
|        2010 | John    | Henery    | M      | Sales MaDirector     |             2 |  90000 |
+-------------+---------+-----------+--------+----------------------+---------------+--------+
9 rows in set (0.00 sec)

/** ANTI SEMI JOIN (NOT EXISTS): similar to INNER JOIN BUT LESS DUPLICATE COLUMN: */
select * from employee t1 WHERE NOT EXISTS (SELECT 1 FROM department T2 WHERE T1.department_id = t2.department_id);
Empty set (0.02 sec)

/* LEFT OUTER JOIN with Exclusion */ :
select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
WHERE T2.department_id IS NULL;
Empty set (0.00 sec)

/* RIGHT OUTER JOIN with Exclusion */ :
select * from employee t1 RIGHT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
WHERE T1.department_id IS NULL;
Empty set (0.00 sec)

/*FULL OUTER JOIN*/
select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
UNION
select * from employee t1 RIGHT OUTER JOIN department T2 ON T1.department_id = t2.department_id ;
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
| employee_id | fa_name | la_name   | gender | position             | department_id | salary | department_id | department_name |
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
|        2002 | supper  | Man       | M      | Tester               |             1 |  75000 |             1 | IT              |
|        2003 | Jesica  | Liyers    | F      | Architect            |             1 |  60000 |             1 | IT              |
|        2004 | Bonnie  | Adams     | F      | Project Manager      |             1 |  80000 |             1 | IT              |
|        2005 | James   | Madison   | M      | Software Developer   |             1 |  55000 |             1 | IT              |
|        2006 | Michael | Greenback | M      | Sales Assistant      |             2 |  85000 |             2 | Sales           |
|        2007 | Leslie  | Peters    | F      | Sales Engineer       |             2 |  76000 |             2 | Sales           |
|        2008 | Max     | Powers    | M      | Sales Representative |             2 |  59000 |             2 | Sales           |
|        2009 | Stacy   | Jacobs    | F      | Sales Manager        |             2 |  73000 |             2 | Sales           |
|        2010 | John    | Henery    | M      | Sales MaDirector     |             2 |  90000 |             2 | Sales           |
+-------------+---------+-----------+--------+----------------------+---------------+--------+---------------+-----------------+
9 rows in set (0.02 sec)

/*FULL OUTER JOIN with Exclusion*/
select * from employee t1 LEFT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
WHERE T2.department_id IS NOT NULL
UNION
select * from employee t1 RIGHT OUTER JOIN department T2 ON T1.department_id = t2.department_id 
WHERE T1.department_id IS NOT NULL;

/* Two Inner joins */
/* Two Left outer joinS */
/* Two Inner join and a LEFT OUTER JOIN*/
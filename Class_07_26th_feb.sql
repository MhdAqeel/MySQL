MariaDB [(none)]> create database company;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use company;
Database changed

MariaDB [company]> create table Department(
    -> dept_id int not null primary key,
    -> dept_name varchar(10) not null);
Query OK, 0 rows affected (0.016 sec)

MariaDB [company]> describe Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int(11)     | NO   | PRI | NULL    |       |
| dept_name | varchar(10) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.016 sec)

MariaDB [company]> create table employee(
    -> epm_id int not null primary key,
    -> emp_name varchar(30) not null,
    -> dept_id int ,
    -> foreign key(dept_id) references Department(dept_id)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [company]> insert into employee
    -> values
    -> ("1","Arun","10"),
    -> ("2","Meena","20"),
    -> ("3","Meena","20"),
    -> ("4","Sita",null);
Query OK, 4 rows affected (0.005 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [company]> select * from employee;
+--------+----------+---------+
| epm_id | emp_name | dept_id |
+--------+----------+---------+
|      1 | Arun     |      10 |
|      2 | Meena    |      20 |
|      3 | Meena    |      20 |
|      4 | Sita     |    NULL |
+--------+----------+---------+
4 rows in set (0.000 sec)

MariaDB [company]> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|      10 | HR        |
|      20 | IT        |
|      30 | Sales     |
+---------+-----------+
3 rows in set (0.000 sec)

MariaDB [company]> select employee.emp_name , department.dept_name from employee inner join department on employee.dept_id = department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Meena    | IT        |
+----------+-----------+
3 rows in set (0.005 sec)

MariaDB [company]> select employee.emp_name , department.dept_name from employee left join department on employee.dept_id = department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Meena    | IT        |
| Sita     | NULL      |
+----------+-----------+
4 rows in set (0.004 sec)

MariaDB [company]> select employee.emp_name , department.dept_name from employee right join department on employee.dept_id = department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Arun     | HR        |
| Meena    | IT        |
| Meena    | IT        |
| NULL     | Sales     |
+----------+-----------+
4 rows in set (0.001 sec)


MariaDB [company]> select employee.emp_name , department.dept_name from employee cross join department;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Arun     | HR        |
| Arun     | IT        |
| Arun     | Sales     |
| Meena    | HR        |
| Meena    | IT        |
| Meena    | Sales     |
| Meena    | HR        |
| Meena    | IT        |
| Meena    | Sales     |
| Sita     | HR        |
| Sita     | IT        |
| Sita     | Sales     |
+----------+-----------+
12 rows in set (0.001 sec)

MariaDB [company]> create database student_enrolment_details;
Query OK, 1 row affected (0.001 sec)

MariaDB [company]> use student_enrolment_details;
Database changed

MariaDB [student_enrolment_details]> create table Student (
    -> student_id int(1) not null primary key,
    -> student_name varchar(30) not null,
    -> city varchar(20) not null);
Query OK, 0 rows affected (0.007 sec)

MariaDB [student_enrolment_details]> create table course (
    -> course_id int(3) not null primary key,
    -> course_name varchar(30) not null,
    -> fee int not null );
Query OK, 0 rows affected (0.007 sec)

MariaDB [student_enrolment_details]> create table enrolment (
    -> enroll_id int(1) not null primary key,
    -> student_id int(1) not null,
    -> course_id int(3) not null,
    -> foreign key (student_id) references student(student_id),
    -> foreign key (course_id) references course(course_id));
Query OK, 0 rows affected (0.024 sec)

MariaDB [student_enrolment_details]> insert into student
    -> values
    -> ("1","Rahul","Delhi"),
    -> ("2","Anita","Mumbai"),
    -> ("3","John","Pune"),
    -> ("4","Sara","Delhi");
Query OK, 4 rows affected (0.003 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [student_enrolment_details]> insert into course
    -> values
    -> ("101","Math","3000"),
    -> ("102","Science","3500"),
    -> ("103","English","2500"),
    -> ("104","Computer","4000");
Query OK, 4 rows affected (0.026 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [student_enrolment_details]> insert into enrolment
    -> values
    -> ("1","1","101"),
    -> ("2","1","104"),
    -> ("3","2","102"),
    -> ("4","3","101"),
    -> ("5","3","103");
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [student_enrolment_details]> select * from student;
+------------+--------------+--------+
| student_id | student_name | city   |
+------------+--------------+--------+
|          1 | Rahul        | Delhi  |
|          2 | Anita        | Mumbai |
|          3 | John         | Pune   |
|          4 | Sara         | Delhi  |
+------------+--------------+--------+
4 rows in set (0.000 sec)

MariaDB [student_enrolment_details]> select * from course;
+-----------+-------------+------+
| course_id | course_name | fee  |
+-----------+-------------+------+
|       101 | Math        | 3000 |
|       102 | Science     | 3500 |
|       103 | English     | 2500 |
|       104 | Computer    | 4000 |
+-----------+-------------+------+
4 rows in set (0.000 sec)

MariaDB [student_enrolment_details]> select * from enrolment;
+-----------+------------+-----------+
| enroll_id | student_id | course_id |
+-----------+------------+-----------+
|         1 |          1 |       101 |
|         2 |          1 |       104 |
|         3 |          2 |       102 |
|         4 |          3 |       101 |
|         5 |          3 |       103 |
+-----------+------------+-----------+
5 rows in set (0.001 se

  #################### dispaly all students with the courses they are enrolled ###########################
  
MariaDB [student_enrolment_details]> select s.student_id , s.student_name , c.course_name from student s inner join enrolment e on s.student_id = e.student_id inner join course c on e.course_id = c.course_id;
+------------+--------------+-------------+
| student_id | student_name | course_name |
+------------+--------------+-------------+
|          1 | Rahul        | Math        |
|          1 | Rahul        | Computer    |
|          2 | Anita        | Science     |
|          3 | John         | Math        |
|          3 | John         | English     |
+------------+--------------+-------------+
5 rows in set (0.002 sec)

MariaDB [student_enrolment_details]> select s.student_id , s.student_name , c.course_name from enrolment e inner join student s on s.student_id = e.student_id inner join course c on e.course_id = c.course_id;
+------------+--------------+-------------+
| student_id | student_name | course_name |
+------------+--------------+-------------+
|          1 | Rahul        | Math        |
|          1 | Rahul        | Computer    |
|          2 | Anita        | Science     |
|          3 | John         | Math        |
|          3 | John         | English     |
+------------+--------------+-------------+
5 rows in set (0.001 sec)


####################################show student name and course name only#######################################

MariaDB [student_enrolment_details]> select s.student_name , c.course_name from enrolment e inner join student s on s.student_id = e.student_id inner join course c on e.course_id = c.course_id;
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | Math        |
| Rahul        | Computer    |
| Anita        | Science     |
| John         | Math        |
| John         | English     |
+--------------+-------------+
5 rows in set (0.001 sec)


#######################################all students from delhi along whith thier courses #################################
MariaDB [student_enrolment_details]> select s.student_name , c.course_name from enrolment e inner join student s on s.student_id = e.student_id inner join course c on e.course_id = c.course_id where s.city="Delhi";
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | Math        |
| Rahul        | Computer    |
+--------------+-------------+
2 rows in set (0.006 sec)

###################### dispaly all the courses and students enroll in them ###########################
MariaDB [student_enrolment_details]> select c.course_name , s.student_name from course c left join enrolment e on c.course_id=e.course_id inner join student s on s.student_id = e.student_id;
+-------------+--------------+
| course_name | student_name |
+-------------+--------------+
| Math        | Rahul        |
| Computer    | Rahul        |
| Science     | Anita        |
| Math        | John         |
| English     | John         |
+-------------+--------------+
5 rows in set (0.001 sec)

#############################  find sudents who are enrollend in any course  ##########################################
MariaDB [student_enrolment_details]> select distinct s.student_name from student s inner join enrolment e on s.student_id = e.student_id;
+--------------+
| student_name |
+--------------+
| Rahul        |
| Anita        |
| John         |
+--------------+
3 rows in set (0.001 sec)

######################### list all students even those not enrolled in any courses ####################################
MariaDB [student_enrolment_details]> select distinct s.student_name from student s left join enrolment e on s.student_id = e.student_id;
+--------------+
| student_name |
+--------------+
| Rahul        |
| Anita        |
| John         |
| Sara         |
+--------------+
4 rows in set (0.001 sec)

#########################find student who are not enrolled on any courses ###################################


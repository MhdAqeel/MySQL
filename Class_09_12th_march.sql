MariaDB [(none)]> create database studentmanagementsystem
    -> ;
Query OK, 1 row affected (0.004 sec)

MariaDB [(none)]> use studentmanagementsystem;
Database changed
MariaDB [studentmanagementsystem]> create table course(
    -> course_id int(2) not null primary key ,
    -> course_name varchar(20),
    -> teacher varchar(20),
    -> teacher_email varchar(30)
    -> );

MariaDB [studentmanagementsystem]> create table student(
    -> student_id int(3) not null primary key,
    -> student_name varchar(20) );
Query OK, 0 rows affected (0.008 sec)

MariaDB [studentmanagementsystem]> create table studentgrades(
    -> student_id int(3) not null,
    -> course_id int(2) not null,
    -> grade char ,
    -> primary key (student_id , course_id),
    -> foreign key (course_id) references course(course_id),
    -> foreign key (student_id) references student(student_id)
    -> );


MariaDB [studentmanagementsystem]> insert into course
    -> values
    -> ("10","SQL","Roger","Roger@teacher123.edu"),
    -> ("20","Python","Rafa","Rafa@teacher123.edu");
Query OK, 2 rows affected (0.032 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]> insert into
    -> student
    -> values
    -> ("100","John"),
    -> ("200","Jane"),
    -> ("300","Ron"),
    -> ("400","Paul");
Query OK, 4 rows affected (0.005 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]> insert into studentgrades
    -> values
    -> ("100","10","A"),
    -> ("200","10","B"),
    -> ("100","20","A"),
    -> ("200","20","A"),
    -> ("300","10","C"),
    -> ("400","10","C"),
    -> ("400","20","C");
Query OK, 7 rows affected (0.004 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]> select * from course;                            
+-----------+-------------+---------+----------------------+
| course_id | course_name | teacher | teacher_email        |
+-----------+-------------+---------+----------------------+
|        10 | SQL         | Roger   | Roger@teacher123.edu |
|        20 | Python      | Rafa    | Rafa@teacher123.edu  |
+-----------+-------------+---------+----------------------+
2 rows in set (0.006 sec)

MariaDB [studentmanagementsystem]> select * from sudent;
ERROR 1146 (42S02): Table 'studentmanagementsystem.sudent' doesn't exist
MariaDB [studentmanagementsystem]> select * from student;
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|        100 | John         |
|        200 | Jane         |
|        300 | Ron          |
|        400 | Paul         |
+------------+--------------+
4 rows in set (0.001 sec)

MariaDB [studentmanagementsystem]> select * from studentgrades;
+------------+-----------+-------+
| student_id | course_id | grade |
+------------+-----------+-------+
|        100 |        10 | A     |
|        100 |        20 | A     |
|        200 |        10 | B     |
|        200 |        20 | A     |
|        300 |        10 | C     |
|        400 |        10 | C     |
|        400 |        20 | C     |
+------------+-----------+-------+
7 rows in set (0.001 sec)


  MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> --  STEP 1: Create the new teacher table (with teacher_id PK)
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> CREATE TABLE teacher (
    ->     teacher_id    INT PRIMARY KEY AUTO_INCREMENT,
    ->     teacher_name  VARCHAR(100) NOT NULL,
    ->     teacher_email VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.004 sec)

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> --  STEP 2: Populate teacher from existing course data
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> INSERT INTO teacher (teacher_name, teacher_email)
    -> SELECT DISTINCT teacher, teacher_email
    -> FROM course;
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> --  STEP 3: Add teacher_id column to course
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- 3a. Add the teacher_id column to course
MariaDB [studentmanagementsystem]> ALTER TABLE course
    ->     ADD COLUMN teacher_id INT;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- 3b. Populate teacher_id by matching teacher names
MariaDB [studentmanagementsystem]> UPDATE course c
    -> JOIN teacher t ON c.teacher = t.teacher_name
    -> SET c.teacher_id = t.teacher_id;
Query OK, 2 rows affected (0.005 sec)
Rows matched: 2  Changed: 2  Warnings: 0

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- 3c. Remove the old teacher_name and teacher_email columns
MariaDB [studentmanagementsystem]> ALTER TABLE course
    ->     DROP COLUMN teacher,
    ->     DROP COLUMN teacher_email;
Query OK, 0 rows affected (0.004 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- 3d. Add NOT NULL constraint and Foreign Key on teacher_id
MariaDB [studentmanagementsystem]> ALTER TABLE course
    ->     MODIFY COLUMN teacher_id INT NOT NULL,
    ->     ADD CONSTRAINT fk_course_teacher
    ->         FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id);
Query OK, 2 rows affected (0.023 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [studentmanagementsystem]>
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> --  RESULT: Final 3NF Schema
MariaDB [studentmanagementsystem]> -- ============================================================
MariaDB [studentmanagementsystem]> -- teacher      : teacher_id (PK, AUTO_INCREMENT), teacher_name, teacher_email
MariaDB [studentmanagementsystem]> -- course       : course_id (PK), course_name, teacher_id (FK → teacher.teacher_id)
MariaDB [studentmanagementsystem]> -- student      : student_id (PK), student_name
MariaDB [studentmanagementsystem]> -- studentgrades: student_id (FK), course_id (FK), grade
MariaDB [studentmanagementsystem]> --                composite PK: (student_id, course_id)
MariaDB [studentmanagementsystem]> -- ============================================================

  MariaDB [studentmanagementsystem]> select * from course;
+-----------+-------------+------------+
| course_id | course_name | teacher_id |
+-----------+-------------+------------+
|        10 | SQL         |          1 |
|        20 | Python      |          2 |
+-----------+-------------+------------+
2 rows in set (0.001 sec)

MariaDB [studentmanagementsystem]> select * from teacher;
+------------+--------------+----------------------+
| teacher_id | teacher_name | teacher_email        |
+------------+--------------+----------------------+
|          1 | Roger        | Roger@teacher123.edu |
|          2 | Rafa         | Rafa@teacher123.edu  |
+------------+--------------+----------------------+
2 rows in set (0.000 sec)

MariaDB [studentmanagementsystem]> select * from student;
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|        100 | John         |
|        200 | Jane         |
|        300 | Ron          |
|        400 | Paul         |
+------------+--------------+
4 rows in set (0.001 sec)

MariaDB [studentmanagementsystem]> select * from studentgrades;
+------------+-----------+-------+
| student_id | course_id | grade |
+------------+-----------+-------+
|        100 |        10 | A     |
|        100 |        20 | A     |
|        200 |        10 | B     |
|        200 |        20 | A     |
|        300 |        10 | C     |
|        400 |        10 | C     |
|        400 |        20 | C     |
+------------+-----------+-------+
7 rows in set (0.000 sec)
############################################################## dispaly all students names along whit their corresponding course name ####################################
  MariaDB [studentmanagementsystem]> select s.student_name , c.course_name from studentgrades g inner join student s on g.student_id = s.student_id inner join course c on g.course_id=c.course_id where c.course_id=20;
+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| John         | Python      |
| Jane         | Python      |
| Paul         | Python      |
+--------------+-------------+

###################################################   who enrollen in python #######################
MariaDB [studentmanagementsystem]> select s.student_name from studentgrades g inner join student s on g.student_id = s.student_id inner join course c on g.course_id=c.course_id where c.course_id=20;
+--------------+
| student_name |
+--------------+
| John         |
| Jane         |
| Paul         |
+--------------+
3 rows in set (0.001 sec)

##################################### Who enroled in sql ########################################################

MariaDB [studentmanagementsystem]> select s.student_name from studentgrades g inner join student s on g.student_id = s.student_id inner join course c on g.course_id=c.course_id where c.course_id=10;
+--------------+
| student_name |
+--------------+
| John         |
| Jane         |
| Ron          |
| Paul         |
+--------------+
4 rows in set (0.001 sec)

###################################### show all coures taken by john ################################################

###################################### student who got an A ################################################

###################################### show the taecher od each course ################################################

###################################### count number of student in each course ################################################

###################################### find students who enrolled in more than one course ################################################

  ###################################### find the teacher email for sql course ################################################

  ###################################### dispaly student name , course name and grade ################################################

###################################### find students who got c ################################################

  ###################################### dispaly all teachers and thir courses ################################################


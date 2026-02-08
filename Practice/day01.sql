C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use uiversity;
ERROR 1049 (42000): Unknown database 'uiversity'
MariaDB [(none)]> use university;
Database changed
MariaDB [university]> show tables;
+----------------------+
| Tables_in_university |
+----------------------+
| department           |
+----------------------+
1 row in set (0.011 sec)

MariaDB [university]> select * from University;
ERROR 1146 (42S02): Table 'university.university' doesn't exist
MariaDB [university]> select * from department;
+---------+------------------+----------+
| dept_id | dept_name        | building |
+---------+------------------+----------+
|       1 | Computer Science | Block A  |
|       2 | Mathematics      | Block B  |
|       3 | Physics          | Block C  |
+---------+------------------+----------+
3 rows in set (0.060 sec)

MariaDB [university]> create table student (
    -> student_id int not null primary key,
    -> student_name varchar(25) not null,
    -> age int not null,
    -> marks int not null,
    -> dept_id int not null,
    -> foreign key(dept_id) references department(dept_id)
    -> );
Query OK, 0 rows affected (0.050 sec)

MariaDB [university]> describe student;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(11)     | NO   | PRI | NULL    |       |
| student_name | varchar(25) | NO   |     | NULL    |       |
| age          | int(11)     | NO   |     | NULL    |       |
| marks        | int(11)     | NO   |     | NULL    |       |
| dept_id      | int(11)     | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.045 sec)

MariaDB [university]> insert into student
    -> values
    -> 101 , "Alice" , 20 , 85 , 1 ,
    -> 102 , "Bob" , 22 , 78 , 1 ,
    -> 103 , "Charlie" , 21 , 92 , 2 ,
    -> 104 , "David" , 23 , 65 , 2 ,
    -> 105 , "Eva" , 20 , 88 , 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '101 , "Alice" , 20 , 85 , 1 ,
102 , "Bob" , 22 , 78 , 1 ,
103 , "Charlie" , 2...' at line 3
MariaDB [university]> insert into student (stdent_id , student_name , age , marks , dept_id )
    -> values
    -> (101 , "Alice" , 20 , 85 , 1) ,
    -> (102 , "Bob" , 22 , 78 , 1) ,
    -> (103 , "Charlie" , 21 , 92 , 2) ,
    -> (104 , "David" , 23 , 65 , 2) ,
    -> (105 , "Eva" , 20 , 88 , 3);
ERROR 1054 (42S22): Unknown column 'stdent_id' in 'field list'
MariaDB [university]> insert into student (student_id , student_name , age , marks , dept_id )
    -> (101 , "Alice" , 20 , 85 , 1) ,
    -> (102 , "Bob" , 22 , 78 , 1) ,
    -> (103 , "Charlie" , 21 , 92 , 2) ,
    -> (104 , "David" , 23 , 65 , 2) ,
    -> (105 , "Eva" , 20 , 88 , 3);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '101 , "Alice" , 20 , 85 , 1) ,
(102 , "Bob" , 22 , 78 , 1) ,
(103 , "Charlie"...' at line 2
MariaDB [university]> insert into student (stdent_id , student_name , age , marks , dept_id )
    -> values
    -> ("101" , "Alice" , "20" , "85" , "1") ,
    -> ("102" , "Bob" , "22" , "78" , "1") ,
    -> ("103" , "Charlie" , "21" , "92" , "2") ,
    -> (104 , "David" , 23 , 65 , 2) ,
    -> /c
    -> \c
MariaDB [university]> insert into student (stdent_id , student_name , age , marks , dept_id )
    -> values
    -> ("101" , "Alice" , "20" , "85" , "1") ,
    -> ("102" , "Bob" , "22" , "78" , "1") ,
    -> ("103" , "Charlie" , "21" , "92" , "2") ,
    -> ("104" , "David" , "23" , "65" , "2") ,
    -> ("105" , "Eva" , "20" , "88" , "3");
ERROR 1054 (42S22): Unknown column 'stdent_id' in 'field list'
MariaDB [university]> insert into student (student_id , student_name , age , marks , dept_id )
    -> ("101" , "Alice" , "20" , "85" , "1") ,
    -> ("102" , "Bob" , "22" , "78" , "1") ,
    -> ("103" , "Charlie" , "21" , "92" , "2") ,
    -> ("104" , "David" , "23" , "65" , "2") ,
    -> ("105" , "Eva" , "20" , "88" , "3");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '"101" , "Alice" , "20" , "85" , "1") ,
("102" , "Bob" , "22" , "78" , "1") ,
...' at line 2
MariaDB [university]> cls
    -> \c
MariaDB [university]> insert into student
    -> values
    -> ("101","Alice","20","85","1"),
    -> ("102", "Bob" , "22" , "78" , "1"),
    -> ("103" , "Charlie" , "21" , "92" , "2"),
    -> ("104" , "David" , "23" , "65" , "2"),
    -> ("105" , "Eva" , "20" , "88" , "3");
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    9
Current database: university

Query OK, 5 rows affected (0.018 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [university]> select * from student ;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.001 sec)

MariaDB [university]> select distinct student_name from student;
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| David        |
| Eva          |
+--------------+
5 rows in set (0.011 sec)

MariaDB [university]> select student_name from student WHERE student_name like a% ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [university]> select student_name from student WHERE student_name like A% ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [university]> select * from student where student_name like 's%' ;
Empty set (0.014 sec)

MariaDB [university]> select * from student where student_name like 'a%' ;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
+------------+--------------+-----+-------+---------+
1 row in set (0.001 sec)

MariaDB [university]> select * from student where marks=82;
Empty set (0.014 sec)

MariaDB [university]> select * from student where marks=92;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
1 row in set (0.001 sec)

MariaDB [university]> select * from student where marks>70;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
4 rows in set (0.010 sec)

MariaDB [university]> select * from student where age>20 , marks>80;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ' marks>80' at line 1
MariaDB [university]> select * from student where marks>70 , age > 20;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ' age > 20' at line 1
MariaDB [university]> select * from student where (marks>70 , age > 20);
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [university]> select * from student where marks>70 and age > 20;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
2 rows in set (0.010 sec)

MariaDB [university]> select * from student order by student_name;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.013 sec)

MariaDB [university]> select * from student order by student_name desc;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        105 | Eva          |  20 |    88 |       3 |
|        104 | David        |  23 |    65 |       2 |
|        103 | Charlie      |  21 |    92 |       2 |
|        102 | Bob          |  22 |    78 |       1 |
|        101 | Alice        |  20 |    85 |       1 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.001 sec)

MariaDB [university]> select * from student order by student_name , marks;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.001 sec)

MariaDB [university]> select * from student order by marks;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        104 | David        |  23 |    65 |       2 |
|        102 | Bob          |  22 |    78 |       1 |
|        101 | Alice        |  20 |    85 |       1 |
|        105 | Eva          |  20 |    88 |       3 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.001 sec)

MariaDB [university]> select * from student order by marks , student_name;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        104 | David        |  23 |    65 |       2 |
|        102 | Bob          |  22 |    78 |       1 |
|        101 | Alice        |  20 |    85 |       1 |
|        105 | Eva          |  20 |    88 |       3 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
5 rows in set (0.001 sec)

MariaDB [university]> select student_name from student order by dept_id
    -> ;
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| David        |
| Eva          |
+--------------+
5 rows in set (0.001 sec)

MariaDB [university]> select * from student where marks between 70 and 90;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    10
Current database: university

+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
3 rows in set (0.014 sec)

MariaDB [university]> select student_name from where dept_id=1 or dept_id=2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where dept_id=1 or dept_id=2' at line 1
MariaDB [university]> select student_name from where dept_id='1' or dept_id='2';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where dept_id='1' or dept_id='2'' at line 1
MariaDB [university]> select student_name from student where dept_id='1' or dept_id='2';
+--------------+
| student_name |
+--------------+
| Alice        |
| Bob          |
| Charlie      |
| David        |
+--------------+
4 rows in set (0.012 sec)

MariaDB [university]> select student_name from student order by marks desc;
+--------------+
| student_name |
+--------------+
| Charlie      |
| Eva          |
| Alice        |
| Bob          |
| David        |
+--------------+
5 rows in set (0.001 sec)

MariaDB [university]> select * from student limit 2;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
+------------+--------------+-----+-------+---------+
2 rows in set (0.001 sec)

MariaDB [university]> select * from student limit 3;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
3 rows in set (0.000 sec)

MariaDB [university]> select * from student limit 3 off set 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'off set 3' at line 1
MariaDB [university]> select * from student limit 3 off set 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'off set 2' at line 1
MariaDB [university]> select * from student limit 3 offset 2;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
|        105 | Eva          |  20 |    88 |       3 |
+------------+--------------+-----+-------+---------+
3 rows in set (0.010 sec)

MariaDB [university]> select * from student limit 2 offset 2;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        103 | Charlie      |  21 |    92 |       2 |
|        104 | David        |  23 |    65 |       2 |
+------------+--------------+-----+-------+---------+
2 rows in set (0.000 sec)

MariaDB [university]> select * from student limit 2;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        101 | Alice        |  20 |    85 |       1 |
|        102 | Bob          |  22 |    78 |       1 |
+------------+--------------+-----+-------+---------+
2 rows in set (0.000 sec)

MariaDB [university]> select * from student limit 2 offset 1;
+------------+--------------+-----+-------+---------+
| student_id | student_name | age | marks | dept_id |
+------------+--------------+-----+-------+---------+
|        102 | Bob          |  22 |    78 |       1 |
|        103 | Charlie      |  21 |    92 |       2 |
+------------+--------------+-----+-------+---------+
2 rows in set (0.001 sec)
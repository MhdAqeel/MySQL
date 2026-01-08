C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database details;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use details;
Database changed

MariaDB [details]> create table users (
    -> user_id bigint not null primary key,
    -> email text,
    -> created_at timestamp) ;
Query OK, 0 rows affected (0.095 sec)

MariaDB [details]> create table orders(
    -> order_id bigint not null primary key,
    -> user_id bigint not null,
    -> foreign key(user_id) references users(user_id));
Query OK, 0 rows affected (0.189 sec)

MariaDB [details]> show tables
    -> ;
+-------------------+
| Tables_in_details |
+-------------------+
| orders            |
| users             |
+-------------------+
2 rows in set (0.001 sec)

MariaDB [details]> describe orders;
+----------+------------+------+-----+---------+-------+
| Field    | Type       | Null | Key | Default | Extra |
+----------+------------+------+-----+---------+-------+
| order_id | bigint(20) | NO   | PRI | NULL    |       |
| user_id  | bigint(20) | NO   | MUL | NULL    |       |
+----------+------------+------+-----+---------+-------+
2 rows in set (0.014 sec)

MariaDB [details]> describe users;
+------------+------------+------+-----+---------------------+-------------------------------+
| Field      | Type       | Null | Key | Default             | Extra                         |
+------------+------------+------+-----+---------------------+-------------------------------+
| user_id    | bigint(20) | NO   | PRI | NULL                |                               |
| email      | text       | YES  |     | NULL                |                               |
| created_at | timestamp  | NO   |     | current_timestamp() | on update current_timestamp() |
+------------+------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.030 sec)

MariaDB [details]> create table Student_Details(
    -> ID bigint not null primary key,
    -> Name varchar(30) not null,
    -> Course varchar(30) not null );
Query OK, 0 rows affected (0.123 sec)

MariaDB [details]> create table Student_Marks(
    -> ID bigint not null,
    -> foreign key(ID) references Student_Details(ID),
    -> Marks bigint not null );
Query OK, 0 rows affected (0.123 sec)

MariaDB [details]> describe Student_Details ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| ID     | bigint(20)  | NO   | PRI | NULL    |       |
| Name   | varchar(30) | NO   |     | NULL    |       |
| Course | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.025 sec)

MariaDB [details]> describe Student_Marks ;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| ID    | bigint(20) | NO   | MUL | NULL    |       |
| Marks | bigint(20) | NO   |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
2 rows in set (0.012 sec)

ariaDB [details]> insert into Student_Details (ID , Name , Course)
    -> values
    -> ("2041","Tom" , "Java"),
    -> ("2204","John" , "c++"),
    -> ("2043","Alice" , "Python"),
    -> ("2032","Bob" , "Oracle") ;
Query OK, 4 rows affected (0.300 sec)
Records: 4  Duplicates: 0  Warnings: 0

ariaDB [details]> insert into Student_Marks (Id , Marks)
    -> values
    -> ("2041","85"),
    -> ("2204","64"),
    -> ("2032","47"),
    -> ("2043","69");
Query OK, 4 rows affected (0.103 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [details]> select * from Student_Details ;
+------+-------+--------+
| ID   | Name  | Course |
+------+-------+--------+
| 2032 | Bob   | Oracle |
| 2041 | Tom   | Java   |
| 2043 | Alice | Python |
| 2204 | John  | c++    |
+------+-------+--------+
4 rows in set (0.001 sec)

MariaDB [details]> select * from Student_Marks ;
+------+-------+
| ID   | Marks |
+------+-------+
| 2041 |    85 |
| 2204 |    64 |
| 2032 |    47 |
| 2043 |    69 |
+------+-------+
4 rows in set (0.000 sec)


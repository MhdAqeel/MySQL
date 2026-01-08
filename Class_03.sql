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

=================================================================================================================

###########To sort bt asending order####################
MariaDB [pscompany]> select * from Suppliers order by name asc;
+-----------+-------------+----------+
| SuplierID | Name        | Phone    |
+-----------+-------------+----------+
|       501 | ABC Traders | 88881111 |
|       505 | MN Traders  | 88885555 |
|       503 | QQ Corp     | 88883333 |
|       504 | RK Groups   | 88883333 |
|       502 | XYZ Company | 88882222 |
+-----------+-------------+----------+
5 rows in set (0.001 sec)

############To sort by desending Order ###############################################

MariaDB [pscompany]> select * from Suppliers order by name desc;
+-----------+-------------+----------+
| SuplierID | Name        | Phone    |
+-----------+-------------+----------+
|       502 | XYZ Company | 88882222 |
|       504 | RK Groups   | 88883333 |
|       503 | QQ Corp     | 88883333 |
|       505 | MN Traders  | 88885555 |
|       501 | ABC Traders | 88881111 |
+-----------+-------------+----------+
5 rows in set (0.001 sec)

################ How to change colum name ############

MariaDB [pscompany]> select phone as phone_number from suppliers ;
+--------------+
| phone_number |
+--------------+
| 88881111     |
| 88882222     |
| 88883333     |
| 88883333     |
| 88885555     |
+--------------+
5 rows in set (0.002 sec)

MariaDB [pscompany]> create database World ;
Query OK, 1 row affected (0.002 sec)

MariaDB [pscompany]> use world ;
Database changed

MariaDB [world]> create table country(
    -> code int(25) not null primary key,
    -> name varchar(25) not null,
    -> continent varchar(30) not null,
    -> region varchar(30) not null,
    -> population int(50) not null
    -> ) ;
Query OK, 0 rows affected (0.112 sec)

MariaDB [world]> describe country ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| code       | int(25)     | NO   | PRI | NULL    |       |
| name       | varchar(25) | NO   |     | NULL    |       |
| continent  | varchar(30) | NO   |     | NULL    |       |
| region     | varchar(30) | NO   |     | NULL    |       |
| population | int(50)     | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.014 sec)

MariaDB [world]> insert into country (code , name , continent , region , population )
    -> values
    -> (94,"Sri Lanka" , "Asia" , "South Asia" , 150000),
    -> (91,"India" , "Asia" , "South Asia" , 22311231),
    -> (1,"Canada" , "America" , "North America" , 1000000)
    -> ;
Query OK, 3 rows affected (0.043 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [world]> select * from country ;
+------+-----------+-----------+---------------+------------+
| code | name      | continent | region        | population |
+------+-----------+-----------+---------------+------------+
|    1 | Canada    | America   | North America |    1000000 |
|   91 | India     | Asia      | South Asia    |   22311231 |
|   94 | Sri Lanka | Asia      | South Asia    |     150000 |
+------+-----------+-----------+---------------+------------+
3 rows in set (0.000 sec)

##########################   String pattern Matching #####################################

MariaDB [world]> use pscompany
Database changed
MariaDB [pscompany]> select name,price from products where name like 'pencil%';
+-----------+-------+
| name      | price |
+-----------+-------+
| Pencil 2B |  0.48 |
| Pencil 2B |  0.48 |
| Pencil 3B |  0.52 |
| Pencil 4B |  0.62 |
| Pencil 5B |  0.73 |
| Pencil 6B |  0.47 |
+-----------+-------+
6 rows in set (0.001 sec)

MariaDB [pscompany]> select name, quantity from products where  quantity>=5000 ;
+-----------+----------+
| name      | quantity |
+-----------+----------+
| Pen Red   |     5000 |
| Pen Blue  |     8000 |
| Pencil 2B |    10000 |
| Pencil 2B |    10000 |
+-----------+----------+
4 rows in set (0.001 sec)

MariaDB [pscompany]> select name, price from products where  price<0.5 ;
+-----------+-------+
| name      | price |
+-----------+-------+
| Pencil 2B |  0.48 |
| Pencil 2B |  0.48 |
| Pencil 6B |  0.47 |
+-----------+-------+
3 rows in set (0.000 sec)

MariaDB [pscompany]> select name, quantity from products where  quantity>=5000 and name like 'pen %' ;
+----------+----------+
| name     | quantity |
+----------+----------+
| Pen Red  |     5000 |
| Pen Blue |     8000 |
+----------+----------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products where name in ('pen red' , 'pen black') ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1001 | PEN  | Pen Red   |     5000 |  1.23 |
| 1003 | PEN  | Pen Black |     2000 |  1.25 |
+------+------+-----------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products where name in ('pen red' , 'pen black') ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1001 | PEN  | Pen Red   |     5000 |  1.23 |
| 1003 | PEN  | Pen Black |     2000 |  1.25 |
+------+------+-----------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products where price between 1.25 and 2.0 ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1002 | PEN  | Pen Blue  |     8000 |  1.25 |
| 1003 | PEN  | Pen Black |     2000 |  1.25 |
+------+------+-----------+----------+-------+
2 rows in set (0.001 sec)

    
================================================================================

    
MariaDB [pscompany]> select * from products order by price limit 2 ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 2004 | PEC  | Pencil 6B |      500 |  0.47 |
| 1004 | PEC  | Pencil 2B |    10000 |  0.48 |
+------+------+-----------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products order by code limit 5 ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1007 | PEC  | Pencil 4B |      200 |  0.62 |
| 2003 | PEC  | Pencil 5B |      100 |  0.73 |
| 2004 | PEC  | Pencil 6B |      500 |  0.47 |
| 1004 | PEC  | Pencil 2B |    10000 |  0.48 |
| 1005 | PEC  | Pencil 2B |    10000 |  0.48 |
+------+------+-----------+----------+-------+
5 rows in set (0.001 sec)

MariaDB [pscompany]> select * from products order by code limit 5 offset 2;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1005 | PEC  | Pencil 2B |    10000 |  0.48 |
| 1006 | PEC  | Pencil 3B |      500 |  0.52 |
| 1007 | PEC  | Pencil 4B |      200 |  0.62 |
| 2003 | PEC  | Pencil 5B |      100 |  0.73 |
| 1002 | PEN  | Pen Blue  |     8000 |  1.25 |
+------+------+-----------+----------+-------+
5 rows in set (0.001 sec)


MariaDB [pscompany]> select count(*) from products ;
+----------+
| count(*) |
+----------+
|        9 |
+----------+
1 row in set (0.001 sec)

MariaDB [pscompany]> select count(*) from products where price>1.0;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.001 sec)


MariaDB [pscompany]> select max(price),min(price) from products;
+------------+------------+
| max(price) | min(price) |
+------------+------------+
|       1.25 |       0.47 |
+------------+------------+
1 row in set (0.001 sec)


MariaDB [pscompany]> delete from products where ID=1005 ;
Query OK, 1 row affected (0.073 sec)

MariaDB [pscompany]> select * from products ;
+------+------+-----------+----------+-------+
| ID   | code | name      | quantity | price |
+------+------+-----------+----------+-------+
| 1001 | PEN  | Pen Red   |     5000 |  1.23 |
| 1002 | PEN  | Pen Blue  |     8000 |  1.25 |
| 1003 | PEN  | Pen Black |     2000 |  1.25 |
| 1004 | PEC  | Pencil 2B |    10000 |  0.48 |
| 1006 | PEC  | Pencil 3B |      500 |  0.52 |
| 1007 | PEC  | Pencil 4B |      200 |  0.62 |
| 2003 | PEC  | Pencil 5B |      100 |  0.73 |
| 2004 | PEC  | Pencil 6B |      500 |  0.47 |
+------+------+-----------+----------+-------+
8 rows in set (0.000 sec)



################   HOW TO EXPORT DATA TO A .SQL FILE #################################

DCSUser@L4088 c:\xampp
# mysqldump -u root customer_db > C:\Users\dcsuser\Documents\2023csc000\new.sql


################### HOW TO INMORT DATA FROM A .SQL FILE ##################################
  
Setting environment for using XAMPP for Windows.
moham@AQEEL c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [first_database]> create database new_db;
Query OK, 1 row affected (0.003 sec)

MariaDB [first_database]> use new_db
Database changed

MariaDB [new_db]> source C:\Users\moham\OneDrive\Documents\GitHub\MySQL\Practice\ImportExample.sql
Query OK, 0 rows affected (0.020 sec)

Query OK, 1 row affected (0.004 sec)

Query OK, 1 row affected (0.002 sec)

Query OK, 1 row affected (0.002 sec)

Query OK, 1 row affected (0.002 sec)

Query OK, 1 row affected (0.002 sec)

MariaDB [new_db]> show tables;
+------------------+
| Tables_in_new_db |
+------------------+
| customer_db      |
+------------------+
1 row in set (0.001 sec)

MariaDB [new_db]> select * from customer_db;
+-----------+------------+-----------+-------------+
| Person_Id | First_Name | Last_Name | City        |
+-----------+------------+-----------+-------------+
| 1         | John       | Doe       | New York    |
| 2         | Jane       | Smith     | Los Angeles |
| 3         | Michael    | Johnson   | Chicago     |
| 4         | Emily      | Davis     | Houston     |
| 5         | David      | Wilson    | Phoenix     |
+-----------+------------+-----------+-------------+
5 rows in set (0.001 sec)


###########   CONTENTS OF ImportExample.sql   ############################

create table Customer_db(Person_Id varchar(20) NOT NULL,First_Name varchar(20) NOT NULL,Last_Name varchar(50) NOT NULL,City varchar(20) NOT NULL,primary key (Person_Id));

insert into Customer_db values('1','John','Doe','New York');
insert into Customer_db values('2','Jane','Smith','Los Angeles');   
insert into Customer_db values('3','Michael','Johnson','Chicago');
insert into Customer_db values('4','Emily','Davis','Houston');
insert into Customer_db values('5','David','Wilson','Phoenix');


#########################################################################

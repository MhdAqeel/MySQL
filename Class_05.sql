 show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| abc                |
| customer_db        |
| details            |
| exam               |
| information_schema |
| mysql              |
| performance_schema |
| personnel_db       |
| phpmyadmin         |
| pscompany          |
| sample             |
| student_marks      |
| students           |
| test               |
| university         |
| world              |
+--------------------+
16 rows in set (0.201 sec)

MariaDB [(none)]> use sample;
Database changed
MariaDB [sample]> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| customers        |
+------------------+
1 row in set (0.001 sec)

MariaDB [sample]> describe customers;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| CustomerID   | int(11)     | NO   | PRI | NULL    | auto_increment |
| CustomerName | varchar(20) | NO   |     | NULL    |                |
| ContactName  | varchar(20) | NO   |     | NULL    |                |
| Address      | varchar(20) | NO   |     | NULL    |                |
| City         | varchar(30) | NO   |     | NULL    |                |
| PostalCode   | int(11)     | NO   |     | NULL    |                |
| Country      | varchar(30) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
7 rows in set (0.113 sec)

MariaDB [sample]> load data local infile "C:\Users\dcsuser\Documents\2023csc099\data.txt" into table customers;
ERROR 2 (HY000): File 'C:UsersdcsuserDocuments2023csc099data.txt' not found (Errcode: 2)
MariaDB [sample]> load data local infile "C:/Users/dcsuser/Documents/2023csc099/data.txt" into table customers;
Query OK, 1 row affected, 1 warning (0.032 sec)
Records: 1  Deleted: 0  Skipped: 0  Warnings: 1

MariaDB [sample]> select * from customers;
+------------+---------------------+--------------+---------------+--------+------------+---------+
| CustomerID | CustomerName        | ContactName  | Address       | City   | PostalCode | Country |
+------------+---------------------+--------------+---------------+--------+------------+---------+
|          1 | Alfreds Futterkiste | Maria Anders | Obere Str. 57 | Berlin |      12209 | Germany |
+------------+---------------------+--------------+---------------+--------+------------+---------+
1 row in set (0.513 sec)

MariaDB [sample]> load data local infile "C:/Users/dcsuser/Documents/2023csc099/data.txt" into table customers;
Query OK, 6 rows affected, 8 warnings (0.059 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 8

MariaDB [sample]> select * from customers;
+------------+----------------------+--------------------+----------------------+-------------+------------+----------+
| CustomerID | CustomerName         | ContactName        | Address              | City        | PostalCode | Country  |
+------------+----------------------+--------------------+----------------------+-------------+------------+----------+
|          1 | Alfreds Futterkiste  | Maria Anders       | Obere Str. 57        | Berlin      |      12209 | Germany  |
 |         2 | Alfreds Futterkiste  | Maria Anders       | Obere Str. 57        | Berlin      |      12209 | Germany
  |        3 | Ana Trujilo Empareda | Ana Trujilo        | Avda. de la consitut | Mexico D.D  |       5021 | Mexico
  |        4 | Antonio moreno       | Antonio Moreno     | Mataderos 2312       | Mexico D.F  |       5023 | Mexico
 |         5 | Helados Taqueria     | Ana David          | Obere Str .48        | Berlin      |      25364 | Germany
      |    6 | Around the Horn      | Tomas Hardy        | 120 HAnover Sq       | London      |        236 | UK
|          7 | Berglunds snabbop    | Cristina Berglunds | Bergusvagen 8        | Lulea       |      95822 | Sweden   |
+------------+----------------------+--------------------+----------------------+-------------+------------+----------+
7 rows in set (0.000 sec)


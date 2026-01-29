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
1	Exotic Liquid	Charlotte Cooper	49 Gilbert St.	London	EC1 4SD	UK
2	New Orleans	Shelley Burke	P.O. Box 78934	New Orleans	70117	USA
3	Grandma Kelly's	Regina Murphy	707 Oxford Rd.	Ann Arbor	48104	USA
4	Cajun Delights	Jene Homestead	56 Gilbert St.	London	EC1 4SD	UK

 MariaDB [sample]> create table Supliers(
    -> SupplierID int not null auto_increment,
    -> SupplierName varchar(50) not null,
    -> ContactName varchar(50) not null,
    -> Adress varchar(30) not null,
    -> City varchar(45) not null,
    -> PostalCode int not null,
    -> Country varchar(30) not null,
    -> primary key(SupplierID));
Query OK, 0 rows affected (0.216 sec)

MariaDB [sample]> load data local infile "C:/Users/dcsuser/Documents/2023csc099/Suplier.txt" into table Supliers;
Query OK, 4 rows affected, 6 warnings (0.093 sec)
Records: 4  Deleted: 0  Skipped: 0  Warnings: 6

MariaDB [sample]> select * from Supliers;
+------------+-----------------+------------------+----------------+-------------+------------+---------+
| SupplierID | SupplierName    | ContactName      | Adress         | City        | PostalCode | Country |
+------------+-----------------+------------------+----------------+-------------+------------+---------+
     |     1 | Exotic Liquid   | Charlotte Cooper | 49 Gilbert St. | London      |          0 | UK
    |      2 | New Orleans     | Shelley Burke    | P.O. Box 78934 | New Orleans |      70117 | USA
    |      3 | Grandma Kelly's | Regina Murphy    | 707 Oxford Rd. | Ann Arbor   |      48104 | USA
|          4 | Cajun Delights  | Jene Homestead   | 56 Gilbert St. | London      |          0 | UK      |
+------------+-----------------+------------------+----------------+-------------+------------+---------+
4 rows in set (0.000 sec)

MariaDB [sample]> create database School;
Query OK, 1 row affected (0.013 sec)

MariaDB [sample]> use school;
Database changed

MariaDB [school]> create table Department(
    -> DNum int not null,
    -> DName varchar(30) not null,
    -> StartDate date,
    -> primary key(DNum));
Query OK, 0 rows affected (0.117 sec)

MariaDB [school]> create table Staff(
    -> SSN int not null primary key,
    -> FName varchar(30) not null,
    -> LName varchar(30) not null,
    -> Salary int not null,
    -> DNum int not null,
    -> FOREIGN KEY (DNum) REFERENCES Department(DNum));
Query OK, 0 rows affected (0.144 sec)

MariaDB [school]> load data local infile "C:/Users/dcsuser/Documents/2023csc099/department.txt" into table Department;
Query OK, 3 rows affected (0.057 sec)
Records: 3  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [school]> load data local infile "C:/Users/dcsuser/Documents/2023csc099/Staff.txt" into table Staff;
Query OK, 6 rows affected, 5 warnings (0.058 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 5

MariaDB [school]> select * from Staff
    -> ;
+-------+----------+--------+--------+------+
| SSN   | FName    | LName  | Salary | DNum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    5 |
| 99887 | Alia     | Shed   |  25000 |    4 |
+-------+----------+--------+--------+------+
6 rows in set (0.000 sec)

MariaDB [school]> select * from Department;
+------+----------------+------------+
| DNum | DName          | StartDate  |
+------+----------------+------------+
|    1 | ELTU           | 1981-06-19 |
|    4 | Administration | 1995-01-01 |
|    5 | Research       | 1988-05-22 |
+------+----------------+------------+
3 rows in set (0.000 sec)

 
 
 ###################dispaly staff record ordered in salary asending order##########
MariaDB [school]> select * from Staff order by Salary asc;
+-------+----------+--------+--------+------+
| SSN   | FName    | LName  | Salary | DNum |
+-------+----------+--------+--------+------+
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 99887 | Alia     | Shed   |  25000 |    4 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    5 |
+-------+----------+--------+--------+------+
6 rows in set (0.001 sec)

 
 
 ######################last name desendinf order######################################
MariaDB [school]> select * from Staff order by LName dsc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'dsc' at line 1
MariaDB [school]> select * from Staff order by LName desc;
+-------+----------+--------+--------+------+
| SSN   | FName    | LName  | Salary | DNum |
+-------+----------+--------+--------+------+
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 99887 | Alia     | Shed   |  25000 |    4 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
+-------+----------+--------+--------+------+
6 rows in set (0.000 sec)

##############order by department name and salary#############
 
 MariaDB [school]> select * from Staff order by
    -> Salary asc , DNum asc ;
+-------+----------+--------+--------+------+
| SSN   | FName    | LName  | Salary | DNum |
+-------+----------+--------+--------+------+
| 99887 | Alia     | Shed   |  25000 |    4 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    5 |
+-------+----------+--------+--------+------+
6 rows in set (0.001 sec)


##################distinct department numbers from staff table###############
MariaDB [school]> select distinct DNum from Staff;
+------+
| DNum |
+------+
|    4 |
|    5 |
+------+
2 rows in set (0.000 sec)

MariaDB [school]> select distinct Salary from Staff;
+--------+
| Salary |
+--------+
|  30000 |
|  40000 |
|  25000 |
|  38000 |
|  43000 |
+--------+
5 rows in set (0.001 sec)

#############find the number of staffmrmbers in each department###############
 
 MariaDB [School]> SELECT DNum, COUNT(*) AS Staff_Count
    -> FROM Staff
    -> GROUP BY DNum;
+------+-------------+
| DNum | Staff_Count |
+------+-------------+
|    4 |           1 |
|    5 |           5 |
+------+-------------+
2 rows in set (0.001 sec)


##################dispaly total saary paid in each department#####################

MariaDB [School]> SELECT DNum, SUM(Salary) AS Total_Salary
    -> FROM Staff
    -> GROUP BY DNum;
+------+--------------+
| DNum | Total_Salary |
+------+--------------+
|    4 |        25000 |
|    5 |       176000 |
+------+--------------+
2 rows in set (0.001 sec)

 ###################find the average salary in each department##############

 MariaDB [School]> SELECT DNum, AVG(Salary) AS Avg_Salary
    -> FROM Staff
    -> GROUP BY DNum;
+------+------------+
| DNum | Avg_Salary |
+------+------------+
|    4 | 25000.0000 |
|    5 | 35200.0000 |
+------+------------+
2 rows in set (0.001 sec)

 
 
###############dispaly staff full name along with salary ina single column###################
 
MariaDB [school]> SELECT CONCAT(FName, ' ', LName, ' - ', Salary) AS Staff_Details
    -> FROM Staff;
+------------------------+
| Staff_Details          |
+------------------------+
| Jerrish Sharan - 30000 |
| Dinith Wreck - 40000   |
| Joy Dilan - 25000      |
| Ramya Naresh - 38000   |
| Jennifer Mercy - 43000 |
| Alia Shed - 25000      |
+------------------------+

To display all staff working in department 5, just use a WHERE clause

MariaDB [School]> SELECT *
    -> FROM Staff
    -> WHERE DNum = 5;
+-------+----------+--------+--------+------+
| SSN   | FName    | LName  | Salary | DNum |
+-------+----------+--------+--------+------+
| 12345 | Jerrish  | Sharan |  30000 |    5 |
| 33445 | Dinith   | Wreck  |  40000 |    5 |
| 53453 | Joy      | Dilan  |  25000 |    5 |
| 66884 | Ramya    | Naresh |  38000 |    5 |
| 87654 | Jennifer | Mercy  |  43000 |    5 |
+-------+----------+--------+--------+------+
5 rows in set (0.002 sec)

#################dispaly staff details whose salary is between 25000 and 40000#################
MariaDB [School]> SELECT *
    -> FROM Staff
    -> WHERE Salary BETWEEN 25000 AND 40000;
+-------+---------+--------+--------+------+
| SSN   | FName   | LName  | Salary | DNum |
+-------+---------+--------+--------+------+
| 12345 | Jerrish | Sharan |  30000 |    5 |
| 33445 | Dinith  | Wreck  |  40000 |    5 |
| 53453 | Joy     | Dilan  |  25000 |    5 |
| 66884 | Ramya   | Naresh |  38000 |    5 |
| 99887 | Alia    | Shed   |  25000 |    4 |
+-------+---------+--------+--------+------+
5 rows in set (0.001 sec)

################### 

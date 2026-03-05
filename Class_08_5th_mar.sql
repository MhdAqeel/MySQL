MariaDB [ERdiagran]> create table Person (
    -> P_id int not null,
    -> Name varchar(20) not null,
    -> Age int(2) not null,
    -> Adress varchar(40) not null,
    -> Email varchar(20) not null
    -> );
Query OK, 0 rows affected (0.020 sec)

MariaDB [ERdiagran]> describe Person
    -> ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| P_id   | int(11)     | NO   |     | NULL    |       |
| Name   | varchar(20) | NO   |     | NULL    |       |
| Age    | int(2)      | NO   |     | NULL    |       |
| Adress | varchar(40) | NO   |     | NULL    |       |
| Email  | varchar(20) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.021 sec)

MariaDB [ERdiagran]> insert into Person
    -> values
    -> ("001","Alice","21","21,flower Road,New York","Alice1010@gmail.com"),
    -> ("002","Bob","20","56,Dam Road,New Jesrsy","Bobyboy@gmail.com"),
    -> ("003","Dave","23","47,Prince Road,Texas","Davidthreper@gmail.com");
Query OK, 3 rows affected, 1 warning (0.029 sec)
Records: 3  Duplicates: 0  Warnings: 1

MariaDB [ERdiagran]> select * form Person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'form Person' at line 1
MariaDB [ERdiagran]> select * from Person;
+------+-------+-----+-------------------------+----------------------+
| P_id | Name  | Age | Adress                  | Email                |
+------+-------+-----+-------------------------+----------------------+
|    1 | Alice |  21 | 21,flower Road,New York | Alice1010@gmail.com  |
|    2 | Bob   |  20 | 56,Dam Road,New Jesrsy  | Bobyboy@gmail.com    |
|    3 | Dave  |  23 | 47,Prince Road,Texas    | Davidthreper@gmail.c |
+------+-------+-----+-------------------------+----------------------+
3 rows in set (0.004 sec)

MariaDB [ERdiagran]> create table Student(
    -> Roll_no int not null,
    -> F_Name varchar(10),
    -> L_Name varchar(10),
    -> House_no int ,
    -> Streent_no varchar(20),
    -> City varchar(20));;
Query OK, 0 rows affected (0.005 sec)

ERROR: No query specified

MariaDB [ERdiagran]> descrive Student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'descrive Student' at line 1
MariaDB [ERdiagran]> describe student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Roll_no    | int(11)     | NO   |     | NULL    |       |
| F_Name     | varchar(10) | YES  |     | NULL    |       |
| L_Name     | varchar(10) | YES  |     | NULL    |       |
| House_no   | int(11)     | YES  |     | NULL    |       |
| Streent_no | varchar(20) | YES  |     | NULL    |       |
| City       | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.037 sec)

MariaDB [ERdiagran]> insert into student
    -> values
    -> ("101","arun","kumar","10","2","Colombo"),
    -> ("102","tharun","raja","14","41","Chilaw"),
    -> ("103","mohamed","ajmal","21","47","Kandy"),
    -> ("104","nimal","darmasena","45","2","Colombo"),
    -> ("105","kamal","sirisena","68","54","Jaffna");
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> select * from student
    -> ;
+---------+---------+-----------+----------+------------+---------+
| Roll_no | F_Name  | L_Name    | House_no | Streent_no | City    |
+---------+---------+-----------+----------+------------+---------+
|     101 | arun    | kumar     |       10 | 2          | Colombo |
|     102 | tharun  | raja      |       14 | 41         | Chilaw  |
|     103 | mohamed | ajmal     |       21 | 47         | Kandy   |
|     104 | nimal   | darmasena |       45 | 2          | Colombo |
|     105 | kamal   | sirisena  |       68 | 54         | Jaffna  |
+---------+---------+-----------+----------+------------+---------+
5 rows in set (0.000 sec)

MariaDB [ERdiagran]> create table Customer(
    -> Roll_no int not null primary key,
    -> Name varchar(20),
    -> Age int(2));
Query OK, 0 rows affected (0.007 sec)

MariaDB [ERdiagran]> Create table Cutomer_number(
    -> Roll_no int not null,
    -> Mobile_no int ,
    -> foreign key (Roll_no) references Customer(Roll_no));
Query OK, 0 rows affected (0.022 sec)

MariaDB [ERdiagran]> INSERT INTO Customer (Roll_no, Name, Age) VALUES
    -> (1, 'Ava Khan', 19),
    -> (2, 'Liam Patel', 21),
    -> (3, 'Noah Smith', 20),
    -> (4, 'Mia Garcia', 22),
    -> (5, 'Ethan Johnson', 18);
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> INSERT INTO Cutomer_number (Roll_no, Mobile_no) VALUES
    -> (1, 5551001),
    -> (1, 5551101),
    ->
    -> (2, 5551002),
    -> (2, 5551202),
    -> (2, 5552202),
    ->
    -> (3, 5551003),
    ->
    -> (4, 5551004),
    -> (4, 5551404),
    ->
    -> (5, 5551005),
    -> (5, 5551505);
Query OK, 10 rows affected (0.005 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> create table Employee(
    -> Emp_no int not null primary key,
    -> Emp_name varchar(20),
    -> salary int
    -> );
Query OK, 0 rows affected (0.008 sec)

MariaDB [ERdiagran]> create table Department(
    -> Dept_id int not null primary key,
    -> Department_name varchar(20));
Query OK, 0 rows affected (0.007 sec)

MariaDB [ERdiagran]> CREATE TABLE Works_on (
    ->
    ->     Emp_no INT,
    ->
    ->     Dept_id INT,
    ->
    ->     Since DATE,
    ->
    ->     PRIMARY KEY (Emp_no, Dept_id),
    ->
    ->     FOREIGN KEY (Emp_no) REFERENCES Employee(Emp_no),
    ->
    ->     FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
    ->
    -> );
Query OK, 0 rows affected (0.045 sec)

MariaDB [ERdiagran]> INSERT INTO Employee (Emp_no, Emp_name, salary) VALUES
    -> (101, 'Aisha Ahmed', 52000),
    -> (102, 'Omar Ali', 61000),
    -> (103, 'Sara Khan', 48000),
    -> (104, 'David Brown', 75000),
    -> (105, 'Lina Patel', 57000);
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> INSERT INTO Department (Dept_id, Department_name) VALUES
    -> (10, 'HR'),
    -> (20, 'IT'),
    -> (30, 'Finance'),
    -> (40, 'Sales'),
    -> (50, 'Operations');
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> INSERT INTO Works_on (Emp_no, Dept_id, Since) VALUES
    -> (101, 10, '2024-01-15'),
    -> (101, 20, '2025-06-01'),
    ->
    -> (102, 20, '2023-03-10'),
    ->
    -> (103, 30, '2024-09-05'),
    -> (103, 40, '2025-02-20'),
    ->
    -> (104, 20, '2022-11-01'),
    -> (104, 50, '2024-04-12'),
    ->
    -> (105, 40, '2023-07-25');
Query OK, 8 rows affected (0.005 sec)
Records: 8  Duplicates: 0  Warnings: 0

MariaDB [ERdiagran]> select * from employee;
+--------+-------------+--------+
| Emp_no | Emp_name    | salary |
+--------+-------------+--------+
|    101 | Aisha Ahmed |  52000 |
|    102 | Omar Ali    |  61000 |
|    103 | Sara Khan   |  48000 |
|    104 | David Brown |  75000 |
|    105 | Lina Patel  |  57000 |
+--------+-------------+--------+
5 rows in set (0.000 sec)

MariaDB [ERdiagran]> select * from department;
+---------+-----------------+
| Dept_id | Department_name |
+---------+-----------------+
|      10 | HR              |
|      20 | IT              |
|      30 | Finance         |
|      40 | Sales           |
|      50 | Operations      |
+---------+-----------------+
5 rows in set (0.000 sec)

MariaDB [ERdiagran]> select * from works_on;
+--------+---------+------------+
| Emp_no | Dept_id | Since      |
+--------+---------+------------+
|    101 |      10 | 2024-01-15 |
|    101 |      20 | 2025-06-01 |
|    102 |      20 | 2023-03-10 |
|    103 |      30 | 2024-09-05 |
|    103 |      40 | 2025-02-20 |
|    104 |      20 | 2022-11-01 |
|    104 |      50 | 2024-04-12 |
|    105 |      40 | 2023-07-25 |
+--------+---------+------------+
8 rows in set (0.000 sec)


MariaDB [ERdiagran]> create database ERexersise;
Query OK, 1 row affected (0.004 sec)

MariaDB [ERdiagran]> use ERexersise;
Database changed

MariaDB [ERexersise]> create table customer (
    -> cutomer_id varchar(5) not null primary key,
    -> name varchar(15) ,
    -> phone_no int(10),
    -> Adress varchar(20),
    -> Country varchar(15),
    -> City varchar(15));
Query OK, 0 rows affected (0.007 sec)

MariaDB [ERexersise]> create table employee (
    -> Emp_id varchar(5) not null primary key,
    -> Emp_name varchar(15),
    -> Adress varchar(20));
Query OK, 0 rows affected (0.015 sec)

MariaDB [ERexersise]> create table employeeQualification(
    -> Emp_id varchar(5) not null,
    -> qulification varchar(15),
    -> foreign key (Emp_id) references employee(Emp_id));
Query OK, 0 rows affected (0.023 sec)

MariaDB [ERexersise]> create table Car(
    -> car_id int not null primary key,
    -> serial_no varchar(20),
    -> model_no varchar(20),
    -> color varchar(10),
    -> year year,
    -> customer_id varchar(5) not null,
    -> Emp_id varchar(5) not null,
    -> foreign key (Emp_id) references employee(Emp_id),
    -> foreign key (customer_id) references customer(cutomer_id)
    -> );
Query OK, 0 rows affected (0.023 sec)

MariaDB [ERexersise]> create table Invoice (
    -> invoice_no varchar(5) not null primary key ,
    -> date date ,
    -> Emp_id varchar(5),
    -> customer_id varchar(5),
    -> foreign key (customer_id) references customer(cutomer_id)
    -> ,foreign key (Emp_id) references employee(Emp_id)
    -> );



MariaDB [ERexersise]> -- 5 fake customers
MariaDB [ERexersise]> INSERT INTO customer (cutomer_id, name, phone_no, Adress, Country, City) VALUES
    -> ('C001', 'Ali Noor',     771234567, 'Main St 12',     'Yemen', 'Sanaa'),
    -> ('C002', 'Mona Saleh',   772345678, 'King Rd 5',      'Yemen', 'Aden'),
    -> ('C003', 'Sara Ahmed',   773456789, 'Park Ave 9',     'Yemen', 'Taiz'),
    -> ('C004', 'Omar Hassan',  774567890, 'Airport Rd 20',  'Yemen', 'Ibb'),
    -> ('C005', 'Lina Khaled',  775678901, 'Market St 3',    'Yemen', 'Hodeidah');
Query OK, 5 rows affected (0.002 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERexersise]>
MariaDB [ERexersise]> -- 5 fake employees
MariaDB [ERexersise]> INSERT INTO employee (Emp_id, Emp_name, Adress) VALUES
    -> ('E001', 'Khaled Sami',  'Office St 1'),
    -> ('E002', 'Noura Ali',    'Office St 2'),
    -> ('E003', 'Hassan Omar',  'Office St 3'),
    -> ('E004', 'Reem Adel',    'Office St 4'),
    -> ('E005', 'Yousef Amin',  'Office St 5');
Query OK, 5 rows affected (0.002 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERexersise]>
MariaDB [ERexersise]> -- Employee qualifications (multi-valued attribute: multiple rows per employee)
MariaDB [ERexersise]> INSERT INTO employeeQualification (Emp_id, qulification) VALUES
    -> ('E001', 'MBA'),
    -> ('E001', 'Sales'),
    ->
    -> ('E002', 'BSc IT'),
    -> ('E002', 'Networking'),
    ->
    -> ('E003', 'Accounting'),
    ->
    -> ('E004', 'HR'),
    -> ('E004', 'Training'),
    ->
    -> ('E005', 'Mechanic');
Query OK, 8 rows affected (0.001 sec)
Records: 8  Duplicates: 0  Warnings: 0

MariaDB [ERexersise]>
MariaDB [ERexersise]> -- 5 cars (each car assigned to a customer + employee)
MariaDB [ERexersise]> INSERT INTO Car (car_id, serial_no, model_no, color, year, customer_id, Emp_id) VALUES
    -> (1, 'SN-2026-0001', 'MDL-AX1', 'Black', 2022, 'C001', 'E005'),
    -> (2, 'SN-2026-0002', 'MDL-BX2', 'White', 2021, 'C002', 'E001'),
    -> (3, 'SN-2026-0003', 'MDL-CX3', 'Red',   2020, 'C003', 'E002'),
    -> (4, 'SN-2026-0004', 'MDL-DX4', 'Blue',  2023, 'C004', 'E003'),
    -> (5, 'SN-2026-0005', 'MDL-EX5', 'Gray',  2024, 'C005', 'E004');
Query OK, 5 rows affected (0.001 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERexersise]>
MariaDB [ERexersise]> -- 5 invoices
MariaDB [ERexersise]> INSERT INTO Invoice (invoice_no, date, Emp_id, customer_id) VALUES
    -> ('I001', '2026-01-10', 'E001', 'C001'),
    -> ('I002', '2026-01-15', 'E002', 'C002'),
    -> ('I003', '2026-02-02', 'E003', 'C003'),
    -> ('I004', '2026-02-18', 'E004', 'C004'),
    -> ('I005', '2026-03-01', 'E005', 'C005');
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [ERexersise]> select * from car;
+--------+--------------+----------+-------+------+-------------+--------+
| car_id | serial_no    | model_no | color | year | customer_id | Emp_id |
+--------+--------------+----------+-------+------+-------------+--------+
|      1 | SN-2026-0001 | MDL-AX1  | Black | 2022 | C001        | E005   |
|      2 | SN-2026-0002 | MDL-BX2  | White | 2021 | C002        | E001   |
|      3 | SN-2026-0003 | MDL-CX3  | Red   | 2020 | C003        | E002   |
|      4 | SN-2026-0004 | MDL-DX4  | Blue  | 2023 | C004        | E003   |
|      5 | SN-2026-0005 | MDL-EX5  | Gray  | 2024 | C005        | E004   |
+--------+--------------+----------+-------+------+-------------+--------+
5 rows in set (0.001 sec)

MariaDB [ERexersise]> select * from customer;
+------------+-------------+-----------+---------------+---------+----------+
| cutomer_id | name        | phone_no  | Adress        | Country | City     |
+------------+-------------+-----------+---------------+---------+----------+
| C001       | Ali Noor    | 771234567 | Main St 12    | Yemen   | Sanaa    |
| C002       | Mona Saleh  | 772345678 | King Rd 5     | Yemen   | Aden     |
| C003       | Sara Ahmed  | 773456789 | Park Ave 9    | Yemen   | Taiz     |
| C004       | Omar Hassan | 774567890 | Airport Rd 20 | Yemen   | Ibb      |
| C005       | Lina Khaled | 775678901 | Market St 3   | Yemen   | Hodeidah |
+------------+-------------+-----------+---------------+---------+----------+
5 rows in set (0.001 sec)

MariaDB [ERexersise]> select * from invoice;
+------------+------------+--------+-------------+
| invoice_no | date       | Emp_id | customer_id |
+------------+------------+--------+-------------+
| I001       | 2026-01-10 | E001   | C001        |
| I002       | 2026-01-15 | E002   | C002        |
| I003       | 2026-02-02 | E003   | C003        |
| I004       | 2026-02-18 | E004   | C004        |
| I005       | 2026-03-01 | E005   | C005        |
+------------+------------+--------+-------------+
5 rows in set (0.001 sec)

MariaDB [ERexersise]> select * from employee;
+--------+-------------+-------------+
| Emp_id | Emp_name    | Adress      |
+--------+-------------+-------------+
| E001   | Khaled Sami | Office St 1 |
| E002   | Noura Ali   | Office St 2 |
| E003   | Hassan Omar | Office St 3 |
| E004   | Reem Adel   | Office St 4 |
| E005   | Yousef Amin | Office St 5 |
+--------+-------------+-------------+
5 rows in set (0.000 sec)

MariaDB [ERexersise]> select * from employeequalification;
+--------+--------------+
| Emp_id | qulification |
+--------+--------------+
| E001   | MBA          |
| E001   | Sales        |
| E002   | BSc IT       |
| E002   | Networking   |
| E003   | Accounting   |
| E004   | HR           |
| E004   | Training     |
| E005   | Mechanic     |
+--------+--------------+
8 rows in set (0.001 sec)

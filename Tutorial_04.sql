
MariaDB [(none)]> create database ErExersise
    -> ;
Query OK, 1 row affected (0.012 sec)

MariaDB [(none)]> use ErExersise;
Database changed
MariaDB [ErExersise]> create table customer(
    -> Cus_id varchar(5) not null primary key,
    -> name varchar(20),
    -> address varchar(30),
    -> city varchar(10));
Query OK, 0 rows affected (0.025 sec)

MariaDB [ErExersise]> create table employee(
    -> Emp_id varchar(5) not null primary key,
    -> name varchar(20),
    -> address varchar(30));
Query OK, 0 rows affected (0.010 sec)

MariaDB [ErExersise]> create table emplpyee_qualification(
    -> Emp_id varchar(5) not null ,
    -> qualification varchar(20),
    -> foreign key(Emp_id) references employee(Emp_id));
Query OK, 0 rows affected (0.045 sec)

MariaDB [erexersise]> create table Car(
    ->      car_id int not null primary key,
    ->      serial_no varchar(20),
    ->      model_no varchar(20),
    ->      color varchar(10),
    ->      year year,
    ->      Cus_id varchar(5) not null,
    ->      Emp_id varchar(5) not null,
    ->      foreign key (Emp_id) references employee(Emp_id),
    ->      foreign key (Cus_id) references customer(Cus_id)
    ->     );
Query OK, 0 rows affected (0.043 sec)

MariaDB [erexersise]> create table Invoice (
    ->     invoice_no varchar(5) not null primary key ,
    ->     date date ,
    ->     Emp_id varchar(5),
    ->     cus_id varchar(5),
    ->     foreign key (cus_id) references customer(cus_id),
    ->     foreign key (Emp_id) references employee(Emp_id)
    ->     );
Query OK, 0 rows affected (0.034 sec)

MariaDB [erexersise]> describe customer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Cus_id  | varchar(5)  | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| address | varchar(30) | YES  |     | NULL    |       |
| city    | varchar(10) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.028 sec)

MariaDB [erexersise]> describe invoice;
+------------+------------+------+-----+---------+-------+
| Field      | Type       | Null | Key | Default | Extra |
+------------+------------+------+-----+---------+-------+
| invoice_no | varchar(5) | NO   | PRI | NULL    |       |
| date       | date       | YES  |     | NULL    |       |
| Emp_id     | varchar(5) | YES  | MUL | NULL    |       |
| cus_id     | varchar(5) | YES  | MUL | NULL    |       |
+------------+------------+------+-----+---------+-------+
4 rows in set (0.023 sec)

MariaDB [erexersise]> describe car;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| car_id    | int(11)     | NO   | PRI | NULL    |       |
| serial_no | varchar(20) | YES  |     | NULL    |       |
| model_no  | varchar(20) | YES  |     | NULL    |       |
| color     | varchar(10) | YES  |     | NULL    |       |
| year      | year(4)     | YES  |     | NULL    |       |
| Cus_id    | varchar(5)  | NO   | MUL | NULL    |       |
| Emp_id    | varchar(5)  | NO   | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.023 sec)

MariaDB [erexersise]> describe employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Emp_id  | varchar(5)  | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| address | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.020 sec)

MariaDB [erexersise]> describe employee;emplpyee_qualification;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Emp_id  | varchar(5)  | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| address | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.021 sec)

MariaDB [erexersise]> INSERT INTO customer (Cus_id, name, address, city) VALUES
    -> ('C0001','Ali Ahmed','12 King St','Riyadh'),
    -> ('C0002','Sara Noor','45 Palm Ave','Jeddah'),
    -> ('C0003','Omar Hassan','7 Lake Rd','Dammam'),
    -> ('C0004','Mona Saleh','99 River Dr','Tabuk'),
    -> ('C0005','Yousef Khan','18 Hill St','Abha');
Query OK, 5 rows affected (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [erexersise]> INSERT INTO employee (Emp_id, name, address) VALUES
    -> ('E0001','Hadi Ibrahim','10 Workshop St'),
    -> ('E0002','Lina Faris','22 Service Rd'),
    -> ('E0003','Khalid Younis','5 Market St'),
    -> ('E0004','Reem Adel','77 Main Blvd'),
    -> ('E0005','Fahad Nasser','31 Industrial Ave');
Query OK, 5 rows affected (0.011 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [erexersise]> INSERT INTO emplpyee_qualification (Emp_id, qualification) VALUES
    -> ('E0001','Mechanic'),
    -> ('E0001','Electrician'),
    -> ('E0002','Electrician'),
    -> ('E0003','Inspector'),
    -> ('E0003','Painter'),
    -> ('E0004','Painter'),
    -> ('E0005','Supervisor');
Query OK, 7 rows affected (0.010 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [erexersise]> INSERT INTO Car (car_id, serial_no, model_no, color, year, Cus_id, Emp_id) VALUES
    -> (1,'SN-10001','MDL-A1','Red',  2019,'C0001','E0001'),
    -> (2,'SN-10002','MDL-B2','Blue', 2020,'C0002','E0002'),
    -> (3,'SN-10003','MDL-C3','Black',2018,'C0003','E0003'),
    -> (4,'SN-10004','MDL-D4','White',2021,'C0004','E0004'),
    -> (5,'SN-10005','MDL-E5','Gray', 2017,'C0005','E0005');
Query OK, 5 rows affected (0.011 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [erexersise]> INSERT INTO Invoice (invoice_no, date, Emp_id, cus_id) VALUES
    -> ('I0001','2026-01-05','E0001','C0001'),
    -> ('I0002','2026-01-12','E0002','C0002'),
    -> ('I0003','2026-02-03','E0003','C0003'),
    -> ('I0004','2026-02-18','E0004','C0004'),
    -> ('I0005','2026-03-01','E0005','C0005');
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

############################### Display all customers ###################################

############################### Display all cars with customer names ###################################

############################### Display employees and their qualifications. ###################################

############################### Find cars manufactured after 2020. ###################################

############################### Find customers from Jaffna ###################################

############################### Count total customers. ###################################

############################### Update customer phone number. ###################################

############################### Count how many cars are sold by each employee ###################################

############################### Count customers in each city. ###################################

############################### Display all customers ordered by name. ###################################

############################### Find customers who are from Sri Lanka and city Jaffna ###################################

############################### Find cars manufactured between 2018 and 2023. ###################################

############################### Find employees whose name ends with “n”. ###################################

############################### Display car model, customer name, and employee name ###################################

############################### Display the first 5 customers ###################################


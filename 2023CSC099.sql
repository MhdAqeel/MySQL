Setting environment for using XAMPP for Windows.
ExamUser@L3005 c:\xampp
# mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database ChestXrayDB
    -> ;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use ChestXrayDB;
Database changed
MariaDB [ChestXrayDB]> create table Patients(
    -> Patient_Id int not null primary key,
    -> Patient_Name varchar(30) not null,
    -> Age int not null,
    -> Gender varchar(10) not null,
    -> City varchar(20) not null);
Query OK, 0 rows affected (0.290 sec)

MariaDB [ChestXrayDB]> insert into Patients
    -> values
    -> ("1","Rahul Sharma","45","Male","Delhi"),
    -> ("2","Anita verma","38","Female","Mumbai"),
    -> ("3","Suresh Kumar","60","Male","Chennai"),
    -> ("4","Priya Singh","29","Female","Bangalore"),
    -> ("5","amit Patel","52","Male","Ahmedabad"),
    -> ("6","Neha Gupta","34","Female","Pune"),
    -> ("7","Ramesh Rao","67","Male","Hyderabad"),
    -> ("8","Kavitha Nair","41","Female","Delhi"),
    -> ("9","Vikram Joshi","55","Male","Jaipur"),
    -> ("10","Sunita Das","48","Female","Kolkata");
Query OK, 10 rows affected (0.272 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [ChestXrayDB]> select * from Patients;
+------------+--------------+-----+--------+-----------+
| Patient_Id | Patient_Name | Age | Gender | City      |
+------------+--------------+-----+--------+-----------+
|          1 | Rahul Sharma |  45 | Male   | Delhi     |
|          2 | Anita verma  |  38 | Female | Mumbai    |
|          3 | Suresh Kumar |  60 | Male   | Chennai   |
|          4 | Priya Singh  |  29 | Female | Bangalore |
|          5 | amit Patel   |  52 | Male   | Ahmedabad |
|          6 | Neha Gupta   |  34 | Female | Pune      |
|          7 | Ramesh Rao   |  67 | Male   | Hyderabad |
|          8 | Kavitha Nair |  41 | Female | Delhi     |
|          9 | Vikram Joshi |  55 | Male   | Jaipur    |
|         10 | Sunita Das   |  48 | Female | Kolkata   |
+------------+--------------+-----+--------+-----------+
10 rows in set (0.001 sec)

MariaDB [ChestXrayDB]>  create table Xray_Reports(
    -> Report_Id int not null primary key,
    -> Patient_Id int not null,
    -> Diagnosis varchar(50) not null,
    -> Severity varchar(10) not null,
    -> Report_date date not null,
    -> foreign key(Patient_Id) REFERENCES Patients(Patient_Id)
    -> );
Query OK, 0 rows affected (0.264 sec)

MariaDB [ChestXrayDB]> insert into Xray_Reports
    ->  VALUES
    ->     ("101","1","Lung Tumor","High","2024-01-15"),
    ->     ("102","1","Post Treatment Review","Medium","2024-03-20"),
    ->     ("103","2","Normal","Low","2024-02-05"),
    ->     ("104","3","Pneumonia","High","2024-01-20"),
    ->     ("105","3","Follow-up Pneumonia","Medium","2024-02-18"),
    ->     ("106","4","Bronchitis","Low","2024-03-01"),
    ->     ("107","5","Lung Infection","Medium","2024-01-30"),
    ->     ("108","6","Suspected TB","High","2024-02-25"),
    ->     ("109","7","Chronic Lung Disease","High","2024-01-10"),
    ->     ("110","7","Routine Checkup","Low","2024-04-05"),
    ->     ("111","8","Normal","Low","2024-03-12"),
    ->     ("112","9","Pulmonary Edema","High","2024-02-08"),
    ->     ("113","10","Pneumonia","Medium","2024-01-18"),
    ->     ("114","10","Recovery Assessment","Low","2023-03-22");
Query OK, 14 rows affected (0.057 sec)
Records: 14  Duplicates: 0  Warnings: 0

MariaDB [ChestXrayDB]> select * from Xray_Reports;
+-----------+------------+-----------------------+----------+-------------+
| Report_Id | Patient_Id | Diagnosis             | Severity | Report_date |
+-----------+------------+-----------------------+----------+-------------+
|       101 |          1 | Lung Tumor            | High     | 2024-01-15  |
|       102 |          1 | Post Treatment Review | Medium   | 2024-03-20  |
|       103 |          2 | Normal                | Low      | 2024-02-05  |
|       104 |          3 | Pneumonia             | High     | 2024-01-20  |
|       105 |          3 | Follow-up Pneumonia   | Medium   | 2024-02-18  |
|       106 |          4 | Bronchitis            | Low      | 2024-03-01  |
|       107 |          5 | Lung Infection        | Medium   | 2024-01-30  |
|       108 |          6 | Suspected TB          | High     | 2024-02-25  |
|       109 |          7 | Chronic Lung Disease  | High     | 2024-01-10  |
|       110 |          7 | Routine Checkup       | Low      | 2024-04-05  |
|       111 |          8 | Normal                | Low      | 2024-03-12  |
|       112 |          9 | Pulmonary Edema       | High     | 2024-02-08  |
|       113 |         10 | Pneumonia             | Medium   | 2024-01-18  |
|       114 |         10 | Recovery Assessment   | Low      | 2023-03-22  |
+-----------+------------+-----------------------+----------+-------------+
14 rows in set (0.000 sec)

=========================**************************===========================

1. Retrieve all patients ordered by age in ascending order

MariaDB [ChestXrayDB]> select * from Patients order by Age;
+------------+--------------+-----+--------+-----------+
| Patient_Id | Patient_Name | Age | Gender | City      |
+------------+--------------+-----+--------+-----------+
|          4 | Priya Singh  |  29 | Female | Bangalore |
|          6 | Neha Gupta   |  34 | Female | Pune      |
|          2 | Anita verma  |  38 | Female | Mumbai    |
|          8 | Kavitha Nair |  41 | Female | Delhi     |
|          1 | Rahul Sharma |  45 | Male   | Delhi     |
|         10 | Sunita Das   |  48 | Female | Kolkata   |
|          5 | amit Patel   |  52 | Male   | Ahmedabad |
|          9 | Vikram Joshi |  55 | Male   | Jaipur    |
|          3 | Suresh Kumar |  60 | Male   | Chennai   |
|          7 | Ramesh Rao   |  67 | Male   | Hyderabad |
+------------+--------------+-----+--------+-----------+
10 rows in set (0.001 sec)

=========================**************************===========================
2. Retrieve each diagnosis from the Xray_Reports table

MariaDB [ChestXrayDB]> select DISTINCT Diagnosis from Xray_Reports;
+-----------------------+
| Diagnosis             |
+-----------------------+
| Lung Tumor            |
| Post Treatment Review |
| Normal                |
| Pneumonia             |
| Follow-up Pneumonia   |
| Bronchitis            |
| Lung Infection        |
| Suspected TB          |
| Chronic Lung Disease  |
| Routine Checkup       |
| Pulmonary Edema       |
| Recovery Assessment   |
+-----------------------+
12 rows in set (0.001 sec)


=========================**************************===========================
3. Count the number of reports for each patient

=========================**************************===========================
4. Retrieve all X-ray reports with High severity.

MariaDB [ChestXrayDB]> select * from Xray_Reports where Severity='High';
+-----------+------------+----------------------+----------+-------------+
| Report_Id | Patient_Id | Diagnosis            | Severity | Report_date |
+-----------+------------+----------------------+----------+-------------+
|       101 |          1 | Lung Tumor           | High     | 2024-01-15  |
|       104 |          3 | Pneumonia            | High     | 2024-01-20  |
|       108 |          6 | Suspected TB         | High     | 2024-02-25  |
|       109 |          7 | Chronic Lung Disease | High     | 2024-01-10  |
|       112 |          9 | Pulmonary Edema      | High     | 2024-02-08  |
+-----------+------------+----------------------+----------+-------------+
5 rows in set (0.001 sec)

=========================**************************===========================
5. Retrieve patients whose age is greater than the average age of all patients.
MariaDB [ChestXrayDB]> select avg(Age) as average from Patients;
+---------+
| average |
+---------+
| 46.9000 |
+---------+
1 row in set (0.000 sec)

MariaDB [ChestXrayDB]> select * from Patients where Age>(select avg(Age) from Patients);
+------------+--------------+-----+--------+-----------+
| Patient_Id | Patient_Name | Age | Gender | City      |
+------------+--------------+-----+--------+-----------+
|          3 | Suresh Kumar |  60 | Male   | Chennai   |
|          5 | amit Patel   |  52 | Male   | Ahmedabad |
|          7 | Ramesh Rao   |  67 | Male   | Hyderabad |
|          9 | Vikram Joshi |  55 | Male   | Jaipur    |
|         10 | Sunita Das   |  48 | Female | Kolkata   |
+------------+--------------+-----+--------+-----------+
5 rows in set (0.001 sec)

=========================**************************===========================
6. Find all patients who belong to the city Delhi.
MariaDB [ChestXrayDB]> select * from Patients where City='Delhi';
+------------+--------------+-----+--------+-------+
| Patient_Id | Patient_Name | Age | Gender | City  |
+------------+--------------+-----+--------+-------+
|          1 | Rahul Sharma |  45 | Male   | Delhi |
|          8 | Kavitha Nair |  41 | Female | Delhi |
+------------+--------------+-----+--------+-------+
2 rows in set (0.000 sec)

=========================**************************===========================
7. Find patient details whose name starts with ‘R’

MariaDB [ChestXrayDB]> select * from Patients where Patient_Name like 'R%';
+------------+--------------+-----+--------+-----------+
| Patient_Id | Patient_Name | Age | Gender | City      |
+------------+--------------+-----+--------+-----------+
|          1 | Rahul Sharma |  45 | Male   | Delhi     |
|          7 | Ramesh Rao   |  67 | Male   | Hyderabad |
+------------+--------------+-----+--------+-----------+
2 rows in set (0.000 sec)


=========================**************************===========================
8. Retrieve patients whose age is between 30 and 50

MariaDB [ChestXrayDB]> select * from Patients where Age between 30 and 50;
+------------+--------------+-----+--------+---------+
| Patient_Id | Patient_Name | Age | Gender | City    |
+------------+--------------+-----+--------+---------+
|          1 | Rahul Sharma |  45 | Male   | Delhi   |
|          2 | Anita verma  |  38 | Female | Mumbai  |
|          6 | Neha Gupta   |  34 | Female | Pune    |
|          8 | Kavitha Nair |  41 | Female | Delhi   |
|         10 | Sunita Das   |  48 | Female | Kolkata |
+------------+--------------+-----+--------+---------+
5 rows in set (0.001 sec)


=========================**************************===========================
9. Display report details whose severity is not equal to 'Low'
MariaDB [ChestXrayDB]> select * from Xray_Reports where not Severity='Low';
+-----------+------------+-----------------------+----------+-------------+
| Report_Id | Patient_Id | Diagnosis             | Severity | Report_date |
+-----------+------------+-----------------------+----------+-------------+
|       101 |          1 | Lung Tumor            | High     | 2024-01-15  |
|       102 |          1 | Post Treatment Review | Medium   | 2024-03-20  |
|       104 |          3 | Pneumonia             | High     | 2024-01-20  |
|       105 |          3 | Follow-up Pneumonia   | Medium   | 2024-02-18  |
|       107 |          5 | Lung Infection        | Medium   | 2024-01-30  |
|       108 |          6 | Suspected TB          | High     | 2024-02-25  |
|       109 |          7 | Chronic Lung Disease  | High     | 2024-01-10  |
|       112 |          9 | Pulmonary Edema       | High     | 2024-02-08  |
|       113 |         10 | Pneumonia             | Medium   | 2024-01-18  |
+-----------+------------+-----------------------+----------+-------------+
9 rows in set (0.000 sec)

=========================**************************===========================
10.Count the number of reports whose date is later than ‘2024-02-08’
MariaDB [ChestXrayDB]> select * from Xray_Reports where Report_date>'2024-02-08';
+-----------+------------+-----------------------+----------+-------------+
| Report_Id | Patient_Id | Diagnosis             | Severity | Report_date |
+-----------+------------+-----------------------+----------+-------------+
|       102 |          1 | Post Treatment Review | Medium   | 2024-03-20  |
|       105 |          3 | Follow-up Pneumonia   | Medium   | 2024-02-18  |
|       106 |          4 | Bronchitis            | Low      | 2024-03-01  |
|       108 |          6 | Suspected TB          | High     | 2024-02-25  |
|       110 |          7 | Routine Checkup       | Low      | 2024-04-05  |
|       111 |          8 | Normal                | Low      | 2024-03-12  |
+-----------+------------+-----------------------+----------+-------------+
6 rows in set (0.001 sec)

MariaDB [ChestXrayDB]> select count(distinct Patient_Id) as Num_Of_Reports from Xray_Reports where Report_date>'2024-02-08';
+----------------+
| Num_Of_Reports |
+----------------+
|              6 |
+----------------+
1 row in set (0.001 sec)

=========================**************************===========================
11.Display cities having more than 2 patients

MariaDB [ChestXrayDB]> select City from Patients having count(*)>2;
+-------+
| City  |
+-------+
| Delhi |
+-------+
1 row in set (0.000 sec)

=========================**************************===========================
12. Find the second oldest patient

MariaDB [ChestXrayDB]> SELECT * FROM Patients ORDER BY Age DESC;
+------------+--------------+-----+--------+-----------+
| Patient_Id | Patient_Name | Age | Gender | City      |
+------------+--------------+-----+--------+-----------+
|          7 | Ramesh Rao   |  67 | Male   | Hyderabad |
|          3 | Suresh Kumar |  60 | Male   | Chennai   |
|          9 | Vikram Joshi |  55 | Male   | Jaipur    |
|          5 | amit Patel   |  52 | Male   | Ahmedabad |
|         10 | Sunita Das   |  48 | Female | Kolkata   |
|          1 | Rahul Sharma |  45 | Male   | Delhi     |
|          8 | Kavitha Nair |  41 | Female | Delhi     |
|          2 | Anita verma  |  38 | Female | Mumbai    |
|          6 | Neha Gupta   |  34 | Female | Pune      |
|          4 | Priya Singh  |  29 | Female | Bangalore |
+------------+--------------+-----+--------+-----------+
10 rows in set (0.000 sec)

 MariaDB [ChestXrayDB]> SELECT * FROM Patients ORDER BY Age DESC limit 1 offset 1;
+------------+--------------+-----+--------+---------+
| Patient_Id | Patient_Name | Age | Gender | City    |
+------------+--------------+-----+--------+---------+
|          3 | Suresh Kumar |  60 | Male   | Chennai |
+------------+--------------+-----+--------+---------+
1 row in set (0.001 sec)

=========================**************************===========================
13.Update severity from 'Medium' to 'High' for pneumonia cases

=========================**************************===========================
14.Delete reports generated in the year 2023

=========================**************************===========================
15.Retrieve the first 3 most recent X-ray reports

MariaDB [ChestXrayDB]> SELECT * FROM Xray_Reports ORDER BY Report_date DESC limit 3;
+-----------+------------+-----------------------+----------+-------------+
| Report_Id | Patient_Id | Diagnosis             | Severity | Report_date |
+-----------+------------+-----------------------+----------+-------------+
|       110 |          7 | Routine Checkup       | Low      | 2024-04-05  |
|       102 |          1 | Post Treatment Review | Medium   | 2024-03-20  |
|       111 |          8 | Normal                | Low      | 2024-03-12  |
+-----------+------------+-----------------------+----------+-------------+
3 rows in set (0.001 sec)
=========================**************************===========================


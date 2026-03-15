
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


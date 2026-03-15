MariaDB [(none)]> create database CustomerManagement;
Query OK, 1 row affected (0.003 sec)

MariaDB [(none)]> use customermanagement;
Database changed
MariaDB [customermanagement]> CREATE TABLE Customer (
    ->     Cid INT PRIMARY KEY,
    ->     Cfname VARCHAR(50),
    ->     Csname VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.018 sec)

MariaDB [customermanagement]> CREATE TABLE CustomerPhone (
    ->     Cid INT,
    ->     Cphone VARCHAR(15),
    ->     PRIMARY KEY (Cid, Cphone),
    ->     FOREIGN KEY (Cid) REFERENCES Customer(Cid)
    -> );
Query OK, 0 rows affected (0.022 sec)

MariaDB [customermanagement]> CREATE TABLE Vehicle (
    ->     Vno INT PRIMARY KEY,
    ->     Vmodel VARCHAR(50),
    ->     Cid INT,
    ->     FOREIGN KEY (Cid) REFERENCES Customer(Cid)
    -> );
Query OK, 0 rows affected (0.039 sec)

MariaDB [customermanagement]> CREATE TABLE Employee (
    ->     Eno INT PRIMARY KEY,
    ->     Ename VARCHAR(50),
    ->     Eposition VARCHAR(50),
    ->     Etype VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.011 sec)

MariaDB [customermanagement]> CREATE TABLE Petrol (
    ->     Pid INT PRIMARY KEY,
    ->     Ptype VARCHAR(50),
    ->     Pprice DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.020 sec)

MariaDB [customermanagement]> CREATE TABLE Purchases (
    ->     PurchaseID INT PRIMARY KEY,
    ->     Vno INT,
    ->     Pid INT,
    ->     Sqty INT,
    ->     Sdate DATE,
    ->     FOREIGN KEY (Vno) REFERENCES Vehicle(Vno),
    ->     FOREIGN KEY (Pid) REFERENCES Petrol(Pid)
    -> );
Query OK, 0 rows affected (0.047 sec)

MariaDB [customermanagement]> CREATE TABLE Sells (
    ->     Eno INT,
    ->     Pid INT,
    ->     PRIMARY KEY (Eno, Pid),
    ->     FOREIGN KEY (Eno) REFERENCES Employee(Eno),
    ->     FOREIGN KEY (Pid) REFERENCES Petrol(Pid)
    -> );
Query OK, 0 rows affected (0.043 sec)

MariaDB [customermanagement]> INSERT INTO Customer VALUES
    -> (1,'John','Perera'),
    -> (2,'Nimal','Silva'),
    -> (3,'Kamal','Fernando'),
    -> (4,'Saman','Dias'),
    -> (5,'Ravi','Kumar');
Query OK, 5 rows affected (0.014 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO CustomerPhone VALUES
    -> (1,'0771234567'),
    -> (1,'0711111111'),
    -> (2,'0712345678'),
    -> (3,'0759876543'),
    -> (4,'0723456789'),
    -> (5,'0764567890');
Query OK, 6 rows affected (0.012 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO Vehicle VALUES
    -> (101,'Toyota',1),
    -> (102,'Honda',2),
    -> (103,'Nissan',3),
    -> (104,'Suzuki',1),
    -> (105,'Mazda',4);
Query OK, 5 rows affected (0.014 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO Employee VALUES
    -> (201,'Amal','Manager','Full-time'),
    -> (202,'Sunil','Cashier','Part-time'),
    -> (203,'Ruwan','Manager','Full-time'),
    -> (204,'Kasun','Sales','Full-time'),
    -> (205,'Nadee','Sales','Part-time');
Query OK, 5 rows affected (0.012 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO Petrol VALUES
    -> (301,'Petrol 92',350.00),
    -> (302,'Petrol 95',420.00),
    -> (303,'Diesel',330.00),
    -> (304,'Super Diesel',360.00),
    -> (305,'Kerosene',250.00);
Query OK, 5 rows affected (0.005 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO Purchases VALUES
    -> (1,101,301,20,'2025-04-01'),
    -> (2,102,302,15,'2025-04-01'),
    -> (3,103,303,25,'2025-04-02'),
    -> (4,104,301,30,'2025-04-03'),
    -> (5,105,304,10,'2025-04-01');
Query OK, 5 rows affected (0.013 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [customermanagement]> INSERT INTO Sells VALUES
    -> (201,301),
    -> (202,302),
    -> (203,303),
    -> (204,304),
    -> (205,305);
Query OK, 5 rows affected (0.012 sec)
Records: 5  Duplicates: 0  Warnings: 0
----------------------------------------------------------------------------------------------
  #################################Write a query to display the first name (Cfname) and last name (Csname) of all customers from the Customer table.#################################
MariaDB [customermanagement]> SELECT Cfname, Csname
    -> FROM Customer;
+--------+----------+
| Cfname | Csname   |
+--------+----------+
| John   | Perera   |
| Nimal  | Silva    |
| Kamal  | Fernando |
| Saman  | Dias     |
| Ravi   | Kumar    |
+--------+----------+
5 rows in set (0.001 sec)
##################################################Write a query to count the total number of vehicles in the Vehicle table. List all vehicle models along with their corresponding customer IDs#####################################
MariaDB [customermanagement]> SELECT COUNT(*) AS TotalVehicles
    -> FROM Vehicle;
+---------------+
| TotalVehicles |
+---------------+
|             5 |
+---------------+
1 row in set (0.001 sec)
########################################Write a query to display the vehicle model (Vmodel) and customer ID (Cid) from the Vehicle table############################################
MariaDB [customermanagement]> SELECT Vmodel, Cid
    -> FROM Vehicle;
+--------+------+
| Vmodel | Cid  |
+--------+------+
| Toyota |    1 |
| Honda  |    2 |
| Nissan |    3 |
| Suzuki |    1 |
| Mazda  |    4 |
+--------+------+
5 rows in set (0.001 sec)
##############################################Write a query to display all details of employees whose position (Eposition) is "Manager" from the Employee table.######################################
MariaDB [customermanagement]> SELECT *
    -> FROM Employee
    -> WHERE Eposition = 'Manager';
+-----+-------+-----------+-----------+
| Eno | Ename | Eposition | Etype     |
+-----+-------+-----------+-----------+
| 201 | Amal  | Manager   | Full-time |
| 203 | Ruwan | Manager   | Full-time |
+-----+-------+-----------+-----------+
2 rows in set (0.001 sec)
#################################################Write a query to calculate the total quantity (Sqty) of petrol sold on the date '2025-04-01' from the Purchases table.####################################
MariaDB [customermanagement]> SELECT SUM(Sqty) AS TotalQuantity
    -> FROM Purchases
    -> WHERE Sdate = '2025-04-01';
+---------------+
| TotalQuantity |
+---------------+
|            45 |
+---------------+
1 row in set (0.001 sec)
###########################################Write a query to display the customer ID (Cid), petrol ID (Pid), and quantity (Sqty) from the Purchases and Vehicle tables.#############################################
MariaDB [customermanagement]> SELECT Vehicle.Cid, Purchases.Pid, Purchases.Sqty
    -> FROM Purchases
    -> JOIN Vehicle ON Purchases.Vno = Vehicle.Vno;
+------+------+------+
| Cid  | Pid  | Sqty |
+------+------+------+
|    1 |  301 |   20 |
|    2 |  302 |   15 |
|    3 |  303 |   25 |
|    1 |  301 |   30 |
|    4 |  304 |   10 |
+------+------+------+
5 rows in set (0.001 sec)
###################################################Write a query to calculate the total revenue generated by multiplying the quantity (Sqty) with the price (Pprice) from the Purchases and Petrol tables.###################################
MariaDB [customermanagement]> SELECT SUM(Purchases.Sqty * Petrol.Pprice) AS TotalRevenue
    -> FROM Purchases
    -> JOIN Petrol ON Purchases.Pid = Petrol.Pid;
+--------------+
| TotalRevenue |
+--------------+
|     35650.00 |
+--------------+
1 row in set (0.001 sec)
#####################################Write a query to display the names (Ename) of employees who have sold petrol, using the Sells and Employee tables.########################3
MariaDB [customermanagement]> SELECT Ename
    -> FROM Employee
    -> JOIN Sells ON Employee.Eno = Sells.Eno;
+-------+
| Ename |
+-------+
| Amal  |
| Sunil |
| Ruwan |
| Kasun |
| Nadee |
+-------+
5 rows in set (0.001 sec)
###############################################Write a query to display the customer IDs (Cid) and names (Cfname, Csname) of customers who do not have any vehicles registered in the Vehicle table#############################################
MariaDB [customermanagement]> SELECT Cid, Cfname, Csname
    -> FROM Customer
    -> WHERE Cid NOT IN (
    ->     SELECT Cid FROM Vehicle
    -> );
+-----+--------+--------+
| Cid | Cfname | Csname |
+-----+--------+--------+
|   5 | Ravi   | Kumar  |
+-----+--------+--------+
1 row in set (0.002 sec)
#############################################Write a query to display the petrol ID (Pid) and price (Pprice) of the most expensive petrol product from the Petrol table.######################################################
MariaDB [customermanagement]> SELECT Pid, Pprice
    -> FROM Petrol
    -> WHERE Pprice = (
    ->     SELECT MAX(Pprice) FROM Petrol
    -> );
+-----+--------+
| Pid | Pprice |
+-----+--------+
| 302 | 420.00 |
+-----+--------+
1 row in set (0.001 sec)

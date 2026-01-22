MariaDB [(none)]> create database Student_Marks;
Query OK, 1 row affected (0.012 sec)

MariaDB [(none)]> use Student_Marks;
Database changed
MariaDB [Student_Marks]> create table Marks (
    -> Student_ID varchar(50) PRIMARY KEY,
    -> First_Name varchar(50),
    -> Last_Name varchar(50),
    -> Marks decimal(5,2));
Query OK, 0 rows affected (0.019 sec)

MariaDB [Student_Marks]> insert into Marks
    -> VALUES
    -> ("1","Fred","Jones","78"),
    -> ("2","Bill","James","67"),
    -> ("3","Carol","Smith","82"),
    -> ("4","Bob","Duncan","82"),
    -> ("5","Joan","Davis","86");
Query OK, 5 rows affected (0.081 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Student_Marks]> select * from Marks ;
+------------+------------+-----------+-------+
| Student_ID | First_Name | Last_Name | Marks |
+------------+------------+-----------+-------+
| 1          | Fred       | Jones     | 78.00 |
| 2          | Bill       | James     | 67.00 |
| 3          | Carol      | Smith     | 82.00 |
| 4          | Bob        | Duncan    | 82.00 |
| 5          | Joan       | Davis     | 86.00 |
+------------+------------+-----------+-------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> update Marks set Marks="60" where Student_ID="4";
Query OK, 1 row affected (0.011 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Student_Marks]> select * from Marks ;
+------------+------------+-----------+-------+
| Student_ID | First_Name | Last_Name | Marks |
+------------+------------+-----------+-------+
| 1          | Fred       | Jones     | 78.00 |
| 2          | Bill       | James     | 67.00 |
| 3          | Carol      | Smith     | 82.00 |
| 4          | Bob        | Duncan    | 60.00 |
| 5          | Joan       | Davis     | 86.00 |
+------------+------------+-----------+-------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT CONCAT(First_Name,Last_Name)AS FullName FROM Marks;
+------------+
| FullName   |
+------------+
| FredJones  |
| BillJames  |
| CarolSmith |
| BobDuncan  |
| JoanDavis  |
+------------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT CONCAT(First_Name,' ',Last_Name)AS FullName FROM Marks;
+-------------+
| FullName    |
+-------------+
| Fred Jones  |
| Bill James  |
| Carol Smith |
| Bob Duncan  |
| Joan Davis  |
+-------------+
5 rows in set (0.001 sec)

MariaDB [Student_Marks]> SELECT Student_ID,Last_Name,CONCAT(First_Name,' ',Last_Name) AS FullName,Marks FROM Marks;
+------------+-----------+-------------+-------+
| Student_ID | Last_Name | FullName    | Marks |
+------------+-----------+-------------+-------+
| 1          | Jones     | Fred Jones  | 78.00 |
| 2          | James     | Bill James  | 67.00 |
| 3          | Smith     | Carol Smith | 82.00 |
| 4          | Duncan    | Bob Duncan  | 60.00 |
| 5          | Davis     | Joan Davis  | 86.00 |
+------------+-----------+-------------+-------+
5 rows in set (0.001 sec)

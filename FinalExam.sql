MariaDB [(none)]> create database CSCareerFair;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use CSCareerFair;
Database changed

MariaDB [CSCareerFair]> create table Student(
    -> StudentId varchar(20) not null primary key,
    -> StudentName varchar(20) not null);
Query OK, 0 rows affected (0.014 sec)

MariaDB [CSCareerFair]> create table HRInfo(
    -> HRId int AUTO_INCREMENT not null primary key,
    -> HRContactName varchar(50) not null,
    -> HRContactEmail Varchar(50) not null);
Query OK, 0 rows affected (0.013 sec)

MariaDB [CSCareerFair]> create table Company(
    -> CompanyID varchar(10) not null primary key,
    -> CompanyName varchar(30) not null,
    -> CompanyLocation varchar(30) not null,
    -> HRId int not null,
    -> foreign key(HRId) references HRInfo(HRId));
Query OK, 0 rows affected (0.025 sec)

MariaDB [CSCareerFair]> Create table Interview(
    -> InterviewId varchar(20) not null primary key,
    -> CompanyID varchar(10) not null,
    -> StudentId varchar(20) not null,
    -> InterviewResult varchar(30) not null,
    -> OfferedPosition varchar(30),
    -> foreign key(CompanyID) references Company(CompanyID),
    -> foreign key(StudentId) references Student(StudentId));
Query OK, 0 rows affected (0.048 sec)

MariaDB [CSCareerFair]> insert into Student(StudentId,StudentName)
    -> values
    -> ("S001","N. Tharshan"),
    -> ("S002","K. Kavisha"),
    -> ("S003","R. Sutharsan"),
    -> ("S004","M. Thivya"),
    -> ("S005","P. Niroshan"),
    -> ("S006","S. Janani"),
    -> ("S007","T. Vithushan"),
    -> ("S008","A. Yasodha");
Query OK, 8 rows affected (0.007 sec)
Records: 8  Duplicates: 0  Warnings: 0

MariaDB [CSCareerFair]> select * from student;
+-----------+--------------+
| StudentId | StudentName  |
+-----------+--------------+
| S001      | N. Tharshan  |
| S002      | K. Kavisha   |
| S003      | R. Sutharsan |
| S004      | M. Thivya    |
| S005      | P. Niroshan  |
| S006      | S. Janani    |
| S007      | T. Vithushan |
| S008      | A. Yasodha   |
+-----------+--------------+
8 rows in set (0.000 sec)

MariaDB [CSCareerFair]> insert into HRInfo(HRContactName,HRContactEmail)
    -> values
    -> ("Amal Perera" , "amal@syscolabs.com"),
    -> ("Nadeesha Silva" , "nadeesha@virtusa.com"),
    -> ("Kasun Fernando" , "kasun@wso2.com"),
    -> ("Dilshan Jayasinghe" , "dilshan@ifs.com");
Query OK, 4 rows affected (0.017 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [CSCareerFair]> select * from hrinfo;
+------+--------------------+----------------------+
| HRId | HRContactName      | HRContactEmail       |
+------+--------------------+----------------------+
|    1 | Amal Perera        | amal@syscolabs.com   |
|    2 | Nadeesha Silva     | nadeesha@virtusa.com |
|    3 | Kasun Fernando     | kasun@wso2.com       |
|    4 | Dilshan Jayasinghe | dilshan@ifs.com      |
+------+--------------------+----------------------+
4 rows in set (0.000 sec))

MariaDB [CSCareerFair]> insert into Company(CompanyID,CompanyName,CompanyLocation,HRId)
    -> values
    -> ("C01","SyscoLABS","Colombo","1"),
    -> ("C02","Virtusa","Colombo","2"),
    -> ("C03","WSO2","Colombo","3"),
    -> ("C04","IFS","Colombo","4");
Query OK, 4 rows affected (0.008 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [CSCareerFair]> select * from Company;
+-----------+-------------+-----------------+------+
| CompanyID | CompanyName | CompanyLocation | HRId |
+-----------+-------------+-----------------+------+
| C01       | SyscoLABS   | Colombo         |    1 |
| C02       | Virtusa     | Colombo         |    2 |
| C03       | WSO2        | Colombo         |    3 |
| C04       | IFS         | Colombo         |    4 |
+-----------+-------------+-----------------+------+
4 rows in set (0.000 sec)

MariaDB [CSCareerFair]> insert into Interview(InterviewId,CompanyID,StudentId,InterviewResult , OfferedPosition)
    -> values
    -> ("I001","C01","S001","Selected","Intern"),
    -> ("I002","C02","S001","Rejected",NULL),
    -> ("I003","C03","S002","Selected","Intern"),
    -> ("I004","C01","S003","Selected","Associate Engineer"),
    -> ("I005","C04","S002","Pending",NULL),
    -> ("I006","C02","S004","Selected","Intern"),
    -> ("I007","C03","S005","Rejected",NULL),
    -> ("I008","C04","S006","Selected","Intern"),
    -> ("I009","C01","S007","Pending",NULL),
    -> ("I0010","C02","S008","Selected","Intern");
Query OK, 10 rows affected (0.008 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSCareerFair]> select * from interview;
+-------------+-----------+-----------+-----------------+--------------------+
| InterviewId | CompanyID | StudentId | InterviewResult | OfferedPosition    |
+-------------+-----------+-----------+-----------------+--------------------+
| I001        | C01       | S001      | Selected        | Intern             |
| I0010       | C02       | S008      | Selected        | Intern             |
| I002        | C02       | S001      | Rejected        | NULL               |
| I003        | C03       | S002      | Selected        | Intern             |
| I004        | C01       | S003      | Selected        | Associate Engineer |
| I005        | C04       | S002      | Pending         | NULL               |
| I006        | C02       | S004      | Selected        | Intern             |
| I007        | C03       | S005      | Rejected        | NULL               |
| I008        | C04       | S006      | Selected        | Intern             |
| I009        | C01       | S007      | Pending         | NULL               |
+-------------+-----------+-----------+-----------------+--------------------+
10 rows in set (0.000 sec)

--------------------------------------------------------------------------------
i. Display all students and their interview details.

MariaDB [cscareerfair]> select I.InterviewId,I.CompanyID,I.StudentId,S.StudentName,I.InterviewResult,I.OfferedPosition from interview I
    -> join Student S on S.StudentId = I.StudentId;
+-------------+-----------+-----------+--------------+-----------------+--------------------+
| InterviewId | CompanyID | StudentId | StudentName  | InterviewResult | OfferedPosition    |
+-------------+-----------+-----------+--------------+-----------------+--------------------+
| I001        | C01       | S001      | N. Tharshan  | Selected        | Intern             |
| I0010       | C02       | S008      | A. Yasodha   | Selected        | Intern             |
| I002        | C02       | S001      | N. Tharshan  | Rejected        | NULL               |
| I003        | C03       | S002      | K. Kavisha   | Selected        | Intern             |
| I004        | C01       | S003      | R. Sutharsan | Selected        | Associate Engineer |
| I005        | C04       | S002      | K. Kavisha   | Pending         | NULL               |
| I006        | C02       | S004      | M. Thivya    | Selected        | Intern             |
| I007        | C03       | S005      | P. Niroshan  | Rejected        | NULL               |
| I008        | C04       | S006      | S. Janani    | Selected        | Intern             |
| I009        | C01       | S007      | T. Vithushan | Pending         | NULL               |
+-------------+-----------+-----------+--------------+-----------------+--------------------+
10 rows in set (0.000 sec)


--------------------------------------------------------------------------------
ii. List all companies located in Colombo.

MariaDB [cscareerfair]> select * from company where CompanyLocation="Colombo";
+-----------+-------------+-----------------+------+
| CompanyID | CompanyName | CompanyLocation | HRId |
+-----------+-------------+-----------------+------+
| C01       | SyscoLABS   | Colombo         |    1 |
| C02       | Virtusa     | Colombo         |    2 |
| C03       | WSO2        | Colombo         |    3 |
| C04       | IFS         | Colombo         |    4 |
+-----------+-------------+-----------------+------+
4 rows in set (0.000 sec)


--------------------------------------------------------------------------------
iii. Retrieve the names of students who were interviewed by SyscoLABS

MariaDB [cscareerfair]> select S.StudentName,C.CompanyName from interview I
    -> join Student S on S.StudentId = I.StudentId
    -> join Company C on C.CompanyID=I.CompanyID
    -> where c.companyname="SyscoLABS";
+--------------+-------------+
| StudentName  | CompanyName |
+--------------+-------------+
| N. Tharshan  | SyscoLABS   |
| R. Sutharsan | SyscoLABS   |
| T. Vithushan | SyscoLABS   |
+--------------+-------------+
3 rows in set (0.000 sec)


--------------------------------------------------------------------------------
iv. Count the number of interviews conducted by each company.

MariaDB [cscareerfair]> select C.CompanyName , Count(I.InterviewId) as Number_Of_Interviews from interview I
    -> join Company C on C.CompanyID=I.CompanyID
    -> group by I.CompanyID ;
+-------------+----------------------+
| CompanyName | Number_Of_Interviews |
+-------------+----------------------+
| SyscoLABS   |                    3 |
| Virtusa     |                    3 |
| WSO2        |                    2 |
| IFS         |                    2 |
+-------------+----------------------+
4 rows in set (0.000 sec)


--------------------------------------------------------------------------------
v. Display all interviews where the result is “Pending”.

MariaDB [cscareerfair]> select * from interview where InterviewResult="Pending";
+-------------+-----------+-----------+-----------------+-----------------+
| InterviewId | CompanyID | StudentId | InterviewResult | OfferedPosition |
+-------------+-----------+-----------+-----------------+-----------------+
| I005        | C04       | S002      | Pending         | NULL            |
| I009        | C01       | S007      | Pending         | NULL            |
+-------------+-----------+-----------+-----------------+-----------------+
2 rows in set (0.000 sec)


--------------------------------------------------------------------------------
vi. Show all company names along with their HR contact names.

MariaDB [cscareerfair]> select C.CompanyName , H.HRContactName from Company C join HRInfo H on C.HRId = H.HRId;
+-------------+--------------------+
| CompanyName | HRContactName      |
+-------------+--------------------+
| SyscoLABS   | Amal Perera        |
| Virtusa     | Nadeesha Silva     |
| WSO2        | Kasun Fernando     |
| IFS         | Dilshan Jayasinghe |
+-------------+--------------------+
4 rows in set (0.001 sec)


--------------------------------------------------------------------------------
vii. Find students who attended more than one interview.


MariaDB [cscareerfair]> select I.StudentId,S.StudentName ,count(I.Interviewid) as Number_Of_Interviews from interview I
    -> join Student S on S.StudentId = I.StudentId
    -> group by I.studentid having Number_Of_Interviews>1;
+-----------+-------------+----------------------+
| StudentId | StudentName | Number_Of_Interviews |
+-----------+-------------+----------------------+
| S001      | N. Tharshan |                    2 |
| S002      | K. Kavisha  |                    2 |
+-----------+-------------+----------------------+
2 rows in set (0.000 sec)


--------------------------------------------------------------------------------
viii. List all companies that offered a job position to students.


MariaDB [cscareerfair]> select C.CompanyName , I.OfferedPosition from interview I
    -> join Company C on C.CompanyID=I.CompanyID
    -> where I.OfferedPosition <> "NULL";
+-------------+--------------------+
| CompanyName | OfferedPosition    |
+-------------+--------------------+
| SyscoLABS   | Intern             |
| SyscoLABS   | Associate Engineer |
| Virtusa     | Intern             |
| Virtusa     | Intern             |
| WSO2        | Intern             |
| IFS         | Intern             |
+-------------+--------------------+
6 rows in set (0.000 sec)



--------------------------------------------------------------------------------
ix. Find the details of companies that interviewed a student named “K. Kavisha”.


MariaDB [cscareerfair]> select C.CompanyID,C.CompanyName,C.CompanyLocation,H.HRContactName,H.HRContactEmail from interview I
    -> join Student S on S.StudentId = I.StudentId
    -> join Company C on C.CompanyID=I.CompanyID
    -> join HRInfo H on H.HRId=c.HRId
    -> where S.StudentName="K. Kavisha";
+-----------+-------------+-----------------+--------------------+-----------------+
| CompanyID | CompanyName | CompanyLocation | HRContactName      | HRContactEmail  |
+-----------+-------------+-----------------+--------------------+-----------------+
| C03       | WSO2        | Colombo         | Kasun Fernando     | kasun@wso2.com  |
| C04       | IFS         | Colombo         | Dilshan Jayasinghe | dilshan@ifs.com |
+-----------+-------------+-----------------+--------------------+-----------------+
2 rows in set (0.001 sec)


--------------------------------------------------------------------------------
x. Retrieve the details of students who were selected for an “intern”

MariaDB [cscareerfair]> select S.StudentId , S.StudentName  from interview I
    -> join Student S on S.StudentId = I.StudentId
    -> where I.OfferedPosition="Intern";
+-----------+-------------+
| StudentId | StudentName |
+-----------+-------------+
| S001      | N. Tharshan |
| S008      | A. Yasodha  |
| S002      | K. Kavisha  |
| S004      | M. Thivya   |
| S006      | S. Janani   |
+-----------+-------------+
5 rows in set (0.000 sec)


--------------------------------------------------------------------------------

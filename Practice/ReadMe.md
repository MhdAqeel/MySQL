# 🗃️ SQL Cheat Sheet (DDL, DML, Queries & More)

A practical reference for **SQL database design, manipulation, querying, joins, and transactions**.

---

## 🏗️ DATABASE & TABLE MANAGEMENT (DDL)

```sql
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE Staff (
    Staff_Id INT NOT NULL PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Email VARCHAR(100) UNIQUE,
    DNum INT,
    FOREIGN KEY (DNum) REFERENCES department(DNum)
);
```

### 🔧 Modify Tables

```sql
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name MODIFY column_name new_datatype;
ALTER TABLE table_name CHANGE old_col new_col datatype;

DROP TABLE table_name;
TRUNCATE TABLE table_name;
```

### ⚡ Indexing (Performance)

```sql
CREATE INDEX idx_staff_lname ON Staff(LName);
```

---

## ✏️ DATA MANIPULATION (DML)

```sql
INSERT INTO table_name (col1, col2)
VALUES (val1, val2), (val3, val4);

UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition;

DELETE FROM table_name
WHERE condition;
```

---

## 🔍 QUERYING, FILTERING & STRINGS

```sql
SELECT DISTINCT column FROM table;
SELECT * FROM table ORDER BY col ASC;
SELECT * FROM table LIMIT 3 OFFSET 2;

SELECT CONCAT(FName, ' ', LName) AS "Full Name" FROM Staff;
```

### Conditions

* `=, <>, !=, <, >, <=, >=`
* `BETWEEN val1 AND val2`
* `IN (val1, val2)`
* `LIKE 'A%'`, `'%a'`, `'%a%'`

---

## 📊 AGGREGATION & GROUPING

```sql
SELECT COUNT(*) FROM table;
SELECT SUM(col), AVG(col), MIN(col), MAX(col) FROM table;

SELECT ROUND(AVG(col), 2) FROM table;

SELECT col, COUNT(*) FROM table GROUP BY col;

SELECT col, SUM(col2)
FROM table
GROUP BY col
HAVING SUM(col2) > 100;
```

---

## 🔗 JOINS & VIEWS

```sql
-- Inner Join
SELECT t1.col, t2.col
FROM Table1 t1
JOIN Table2 t2 ON t1.id = t2.id;

-- Left Join
SELECT t1.col, t2.col
FROM Table1 t1
LEFT JOIN Table2 t2 ON t1.id = t2.id;
```

### 👁️ View

```sql
CREATE VIEW StaffWorkload AS
SELECT s.FName, u.UName, w.Hours
FROM Staff s
JOIN Works_on w ON s.Staff_Id = w.Staff_Id
JOIN Units u ON w.uNum = u.uNum;
```

---

## 🔄 TRANSACTIONS (Safety)

```sql
START TRANSACTION;

UPDATE Staff
SET Salary = Salary + 1000
WHERE Staff_Id = 54321;

COMMIT;
-- or
ROLLBACK;
```

---

## 🧠 SUBQUERIES & EXISTENCE

```sql
SELECT DName
FROM department d
WHERE NOT EXISTS (
    SELECT 1 FROM Staff s WHERE s.DNum = d.DNum
);
```

```sql
SELECT MAX(Salary)
FROM Staff
WHERE Salary < (
    SELECT MAX(Salary) FROM Staff
);
```

---

## 🛠️ DEBUGGING

```sql
DESCRIBE table_name;
EXPLAIN SELECT * FROM table;
```

---

## 💡 Pro Tips

* Always use `WHERE` in UPDATE & DELETE
* Use indexes for large datasets
* Normalize your database design
* Use transactions for critical operations

---

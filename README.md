<h1>Some of The Most Important SQL Commands</h1>
<hr>
<ul>
<li>SELECT - extracts data from a database</li>
<li>UPDATE - updates data in a database</li>
<li>DELETE - deletes data from a database</li>
<li>INSERT INTO - inserts new data into a database</li>
<li>CREATE DATABASE - creates a new database</li>
<li>ALTER DATABASE - modifies a database</li>
<li>CREATE TABLE - creates a new table</li>
<li>ALTER TABLE - modifies a table</li>
<li>DROP TABLE - deletes a table</li>
<li>CREATE INDEX - creates an index (search key)</li>
<li>DROP INDEX - deletes an index</li>
</ul>
<hr>
<h2><b>Some basic commands in my SQL  </b></h2>
<hr>
<ul>
<li>CREATE DATABASE database_name;</li>
<li>CREATE TABLE table_name (column1 datatype PRIMARY KEY, column2 datatype, column3 datatype, ... , foreign key (column) references other_table(other_column));</li>
<li>describe table_name;</li>
<li>INSERT INTO table_name (column1, column2, column3, ...)<br>VALUES (value1, value2, value3, ...);</li>
<li>SELECT * FROM table_name;</li>
<li>SELECT column1, column2, ... FROM table_name;</li>
<li>SELECT distinct column_name from table_name;</li>
<li>SELECT count(distinct column_name) from table_name;</li> //To count the number of unique values in a column
<li>SELECT count(column_name) from table_name;</li> //To count the number of non-null values in a column
<li>SELECT * from where condition;</li>
    <ul>Conditions:
        <li> =      : equal to</li>
        <li> <>     : not equal to</li>
        <li> >      : greater than</li>
        <li> <      : less than</li>
        <li> >=     : greater than or equal to</li>
        <li> <=     : less than or equal to</li>
        <li> BETWEEN : between a certain range</li>
        <li> LIKE    : search for a pattern</li> //Wildcards: % (zero or more characters), _ (exactly one character)
        <li> IN : specify multiple possible values for a column</li>// e.g., WHERE column_name IN (value1, value2, ...)</li>
    </ul>
<li>SELECT * from where condition1 AND/OR condition2;</li>
<li>select * from table_name order by column_name ASC/DESC;</li>
<li>UPDATE table_name <br>SET column1 = value1, column2 = value2, ... <br>WHERE condition;</li>
<li>DELETE FROM table_name WHERE condition;</li>
<li>DELETE FROM table_name;</li>//deletes all records from the table but not the table itself
<li>SELECT column_name(s)<br>
FROM table_name<br>
WHERE condition<br>
LIMIT number<br>
OFFSET number;</li>//The LIMIT clause is used to specify the maximum number of records to return, while the OFFSET clause is used to specify the number of records to skip before starting to return records. This is often used for pagination in applications.
<li>SELECT MIN(column_name) FROM table_name;</li>
<li>SELECT MAX(column_name) FROM table_name WHERE condition;</li>
<li>SELECT AVG(column_name)  AS average_value FROM table_name;</li>
<li>SELECT SUM(column_name) AS total_value FROM table_name;</li>
<li>SELECT column_name, COUNT(*) AS count FROM table_name GROUP BY column_name;</li> //AS command is optional
<li>JOIN: combines rows from two or more tables based on a related column between them.<br>
    <ul>
        <li>INNER JOIN: returns records that have matching values in both tables.</li>
        <li>LEFT JOIN (or LEFT OUTER JOIN): returns all records from the left table, and the matched records from the right table. If there is no match, the result is NULL on the right side.</li>
        <li>RIGHT JOIN (or RIGHT OUTER JOIN): returns all records from the right table, and the matched records from the left table. If there is no match, the result is NULL on the left side.</li>
        <li>FULL OUTER JOIN: returns all records when there is a match in either left or right table. If there is no match, the result is NULL on the side that does not have a match.</li>
    </ul>
    <li>SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;</li>

</ul>

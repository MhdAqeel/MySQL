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
        <li> = : equal to</li>
        <li> <> : not equal to</li>
        <li> > : greater than</li>
        <li> < : less than</li>
        <li> >= : greater than or equal to</li>
        <li> <= : less than or equal to</li>
        <li> BETWEEN : between a certain range</li>
        <li> LIKE : search for a pattern</li> //Wildcards: % (zero or more characters), _ (exactly one character)
        <li> IN : specify multiple possible values for a column</li>// e.g., WHERE column_name IN (value1, value2, ...)</li>
    </ul>
</ul>

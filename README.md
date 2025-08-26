# MySQL Interview Questions and Answers

A collection of important **MySQL interview questions and answers** for quick revision and preparation.

---

## 1. What is MySQL?

MySQL is an **open-source relational database management system (RDBMS)** that uses **SQL (Structured Query Language)** to store, manage, and retrieve data. It is widely used due to its **performance, scalability, reliability, and ease of integration** with applications.

---

## 2. What are the different types of JOINs in MySQL?

- **INNER JOIN**: Returns rows with matching values in both tables.
- **LEFT (OUTER) JOIN**: Returns all rows from the left table and matched rows from the right.
- **RIGHT (OUTER) JOIN**: Returns all rows from the right table and matched rows from the left.
- **FULL OUTER JOIN**: Not directly supported in MySQL but can be achieved using `UNION`.

---

## 3. What is the difference between WHERE and HAVING clauses?

- **WHERE**: Filters rows **before grouping**.
- **HAVING**: Filters groups/aggregates **after grouping**.

---

## 4. What is a Primary Key in MySQL?
 
A Primary Key is a column (or set of columns) that uniquely identifies each record in a table.

- Must contain **unique values**.
- Cannot contain **NULL**.
- Each table can have only **one** primary key.

---

## 5. What is a Foreign Key in MySQL?

A Foreign Key is a field in one table that refers to the **Primary Key** in another table. It maintains **referential integrity** between tables.

---

## 6. Difference between CHAR and VARCHAR

- **CHAR**: Fixed-length storage. Pads with spaces if data is shorter. Faster for fixed-size data.
- **VARCHAR**: Variable-length storage. Saves only required characters. More memory efficient.

---

## 7. Difference between DELETE, TRUNCATE, and DROP

- **DELETE**: Removes rows based on condition, can be rolled back.
- **TRUNCATE**: Removes all rows, resets AUTO_INCREMENT, cannot usually be rolled back.
- **DROP**: Removes the entire table including structure. Permanent.

---

## 8. What are Indexes in MySQL?

Indexes are database objects that improve **query performance** by allowing faster lookups. Best used on columns in **WHERE, JOIN, ORDER BY, GROUP BY** clauses.

---

## 9. What is a Transaction in MySQL?

A Transaction is a sequence of operations executed as a single logical unit.  
It follows **ACID** properties:

- **Atomicity** – All or nothing
- **Consistency** – Valid state maintained
- **Isolation** – Independent transactions
- **Durability** – Changes persist after commit

---

## 10. What is Normalization?

Normalization is the process of structuring data to remove redundancy and improve integrity.  
Common forms: **1NF, 2NF, 3NF, BCNF**.

---

## 11. What is Denormalization?

Denormalization combines tables to reduce joins and improve read performance. Increases redundancy intentionally for **faster queries**.

---

## 12. What are Aggregate Functions in MySQL?

- `COUNT()` – Number of rows
- `SUM()` – Adds values
- `AVG()` – Average value
- `MIN()` – Minimum value
- `MAX()` – Maximum value

---

## 13. Difference between GROUP BY and ORDER BY

- **GROUP BY**: Groups rows with identical values, used with aggregate functions.
- **ORDER BY**: Sorts query results (ascending or descending).

---

## 14. AUTO_INCREMENT Attribute

Automatically generates a sequential number for new records (commonly used with **Primary Keys**).

---

## 15. UNION vs UNION ALL

- **UNION**: Combines results and removes duplicate rows.
- **UNION ALL**: Combines results but **keeps duplicates**.

---

## 16. Retrieve Current Date in MySQL

```sql
SELECT CURDATE(); -- Returns current date
SELECT NOW();     -- Returns current date & time
```

---

## 17. Difference between IN and EXISTS

- **IN**: Checks if a value exists in a given list or subquery result.
- **EXISTS**: Checks if the subquery returns any rows (more efficient for large datasets).

---

## 18. How do you create a table in MySQL?

```sql
CREATE TABLE student (
  rollNo INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  marks INT
);
```

---

## 19. TRIGGER vs STORED PROCEDURE

- **TRIGGER**: Automatically invoked on specific table events (INSERT, UPDATE, DELETE).
- **STORED PROCEDURE**: Reusable code block, executes only when explicitly called.

---

## 20. Handling NULL Values in MySQL

- Use **IS NULL / IS NOT NULL** to check.
- **IFNULL(expr, default)** replaces NULLs with default.
- **COALESCE(expr1, expr2, …)** returns first non-null value.

---

## 21. What is a View in MySQL?

A **View** is a **virtual table** based on the result of a query.

- Does not store data itself.
- Provides abstraction, simplifies queries, improves security by exposing subsets of data.

---

## ✅ Summary

This file covers:

- Basic definitions
- Keys (Primary, Foreign)
- Joins, Aggregate functions, Transactions
- Normalization vs Denormalization
- Queries, Indexes, Views, Procedures

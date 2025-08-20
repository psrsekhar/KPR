-- mysql version
select @@version;
select version();

-- creating a database
create database if not exists kprcas CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- verifying database creation
show create database kprcas;

-- list databases in mysql server
show databases;

-- select a database in mysql server
use kprcas;

-- department table
create table if not exists kprcas.department(
    id tinyint auto_increment not null primary key,
    name varchar(100) not null
);

-- employee table
create table if not exists kprcas.employee(
    id int auto_increment not null primary key,
    name varchar(100) not null,
    email varchar(150) not null,
    department_id tinyint not null,
    salary decimal(10, 2) not null default 1000.00,
    address text not null,
1    CHECK(salary > 0),
    FOREIGN KEY(department_id) REFERENCES kprcas.department(id) ON DELETE CASCADE,
    FOREIGN KEY(department_id) REFERENCES kprcas.department(id) ON UPDATE CASCADE
);

-- adding a new column
alter table kprcas.employee add dob date null;

-- modifying a column
alter table kprcas.employee modify salary decimal(12, 2) not null default 2000.00;

--rename a column
alter table kprcas.employee CHANGE dob doj date not null;

-- delete a column
alter table kprcas.employee drop COLUMN address;

-- delete a table
-- drop table if exists kprcas.employee;

-- Single insert
insert into kprcas.department(name) VALUES ("Mech");

-- multiple insert
insert into kprcas.department(name) VALUES ("Admin"), ("Transport"), ("Placement"), ("Library"), ("Sports"), ("Admission"),("CSE"), ("ECE"), ("Civil");

-- select and insert
create table if not exists kprcas.test(
    name varchar(100) not null
);
insert into kprcas.test VALUES(select name from kprcas.department);

--insert ignore to ignore errors on duplicate keys
insert ignore into kprcas.department VALUES(3, "EEE");

-- insert on duplicate key -> updates record if duplicate key is found
insert into kprcas.department VALUES(3, "EEE") ON DUPLICATE KEY UPDATE name = "EEE";

-- replace into
replace into kprcas.department VALUES(3, "Placement");

 -- bulk insert from a file
LOAD DATA INFILE "C:\Users\saira\OneDrive\Desktop\KPR\employee.csv" INTO TABLE kprcas.employee FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'

alter table kprcas.employee add address text null;

INSERT INTO kprcas.employee (name, email, department_id, salary, doj, address) VALUES
('Aarav Mehta', 'aarav.mehta@kprcas.com', 1, 55000.00, '2023-01-15', '123 MG Road, Coimbatore'),
('Isha Reddy', 'isha.reddy@kprcas.com', 1, 48000.00, '2022-11-10', '45 Lakeview Street, Chennai'),
('Rajiv Nair', 'rajiv.nair@kprcas.com', 1, 60000.00, '2021-06-25', '78 Hilltop Avenue, Kochi'),
('Sneha Sharma', 'sneha.sharma@kprcas.com', 2, 52000.00, '2023-03-01', '12 Garden Lane, Bengaluru'),
('Manoj Kumar', 'manoj.kumar@kprcas.com', 2, 47000.00, '2022-08-19', '88 Temple Street, Hyderabad'),
('Divya Joshi', 'divya.joshi@kprcas.com', 2, 51000.00, '2021-12-05', '34 Sunrise Blvd, Pune'),
('Vikram Das', 'vikram.das@kprcas.com', 3, 58000.00, '2023-02-14', '56 Riverbank Road, Kolkata'),
('Neha Verma', 'neha.verma@kprcas.com', 3, 53000.00, '2022-09-30', '90 Palm Street, Bhubaneswar'),
('Arjun Singh', 'arjun.singh@kprcas.com', 3, 61000.00, '2021-07-20', '67 Mountain View, Ranchi'),
('Meera Pillai', 'meera.pillai@kprcas.com', 4, 49000.00, '2023-04-12', '23 Lotus Enclave, Trivandrum'),
('Karan Patel', 'karan.patel@kprcas.com', 4, 56000.00, '2022-10-18', '11 Sapphire Lane, Ahmedabad'),
('Anjali Rao', 'anjali.rao@kprcas.com', 4, 50500.00, '2021-05-07', '76 Coral Street, Surat');

-- CTE select insert
WITH dept_name AS (select id, name from kprcas.department)
insert into kprcas.test (id, name) VALUES (select id, name from dept_name);

-- get all columns
select * from kprcas.department;

-- get selected columns
select id, name, email, department_id from kprcas.employee;

-- select with expressions and alias
select id, name, salary, salary*0.1 AS bonus from kprcas.employee;

-- filtering rows based on a condition
select id, name, salary, salary*0.1 AS bonus from kprcas.employee WHERE salary <= 50000;

-- filtering rows based on a range
select id, name, salary, salary*0.1 AS bonus from kprcas.employee WHERE salary BETWEEN 50000 AND 60000;

-- filtering rows based on matching values
select id, name, salary, salary*0.1 AS bonus from kprcas.employee WHERE department_id IN (1, 3 ,5);

-- filtering rows based on patterns
select id, name, salary, salary*0.1 AS bonus from kprcas.employee WHERE name LIKE 'A%';

-- sorting rows based on multiple columns
select id, name, department_id, salary, salary*0.1 AS bonus from kprcas.employee ORDER BY salary asc, name desc;

-- limiting rows to 10 and skipping first row
select id, name, department_id, salary, salary*0.1 AS bonus from kprcas.employee order by salary LIMIT 10  OFFSET 1;
-- OR
select id, name, department_id, salary, salary*0.1 AS bonus from kprcas.employee order by salary LIMIT 10, 1;

-- Aggregate functions
-- to get count of rows
select count(id) AS employee_count from kprcas.employee;

-- sum of a column
select sum(salary) AS total_salary from kprcas.employee;

-- maximum value of a column
select name, max(salary) AS max_salary from kprcas.employee;

-- minimum value of a column
select name, min(salary) AS min_salary from kprcas.employee;

-- average value of a column
select name, avg(salary) AS avg_salary from kprcas.employee;

-- grouping data
select department_id, sum(salary) as department_salary from kprcas.employee GROUP BY department_id;

-- grouping data with condition
select department_id, avg(salary) as department_salary from kprcas.employee GROUP BY department_id HAVING department_salary > 52000;
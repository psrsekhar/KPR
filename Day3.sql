-- to get all employees with department name
SELECT a.id, a.name, b.department, a.salary FROM 
(select id, name, department_id, salary from kprcas.employee)a
LEFT JOIN
(select id, name AS department from kprcas.department)b
ON a.department_id = b.id;

-- to get all departments with employee count
select a.id, a.name, ifnull(b.count, 0) from
(select id, name from kprcas.department)a
LEFT JOIN
(select department_id,count(department_id) AS count from kprcas.employee GROUP BY department_id)b
ON a.id = b.department_id;  

-- adding unique key to email
alter table kprcas.employee modify email varchar(150) not null UNIQUE KEY;

-- users table
create table if not exists kprcas.users(
    user_id varchar(150) not null primary key,
    password text not null,
    created_on TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES kprcas.employee(email) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES kprcas.employee(email) ON UPDATE CASCADE 
);

INSERT INTO kprcas.users (user_id, password)
VALUES
('aarav.mehta@kprcas.com', md5('password123')),
('isha.reddy@kprcas.com', md5('password123')),
('rajiv.nair@kprcas.com', md5('password123')),
('sneha.sharma@kprcas.com', md5('password123')),
('manoj.kumar@kprcas.com', md5('password123')),
('divya.joshi@kprcas.com', md5('password123')),
('vikram.das@kprcas.com', md5('password123')),
('neha.verma@kprcas.com', md5('password123')),
('arjun.singh@kprcas.com', md5('password123')),
('meera.pillai@kprcas.com', md5('password123')),
('karan.patel@kprcas.com', md5('password123')),
('anjali.rao@kprcas.com', md5('password123'));

-- employee id, name, department, userid, and password
select c.id, c.name, c.department, c.email, d.password FROM
(select a.id, a.name, b.department, a.email FROM 
(select id, name, department_id, email from kprcas.employee)a
LEFT JOIN
(select id, name AS department from kprcas.department)b ON a.department_id = b.id)c
LEFT JOIN
(select user_id, password from kprcas.users)d
ON c.email = d.user_id

-- string functions
-- concat() -> to append two or more strings
select concat("KPRCAS-", name, "-",id) from kprcas.employee;

-- concat_ws() -> to append two or more strings with a delimeter
select concat_ws("-", "KPRCAS", name, id) from kprcas.employee;

-- CHAR_LENGTH()/CHARACTER_LENGTH() -> number of characters in a string
select char_length("Samantha");

-- SUBSTRING()/SUB_STR() -> returns sub string from a given index
select SUBSTRING("Samantha", 4);

-- REPLACE() -> replaces a string with a given string
select REPLACE("Samantha is good", "is", "was");

-- trim(), ltrim(), rtrim() ->to remove white spaces from both ends
select trim("  Samantha  ");
select ltrim("  Samantha  ");
select rtrim("  Samantha  ");

-- lower()/lcase(), upper()/ucase()-> case sensitive functions
select lower(trim("  Samantha  "));

-- INSTR() -> index of a sub string
select instr("Samantha is good", "is") AS start_index;

-- left(n),right(n) -> extract number of characters from string
select left("Samantha is good", 8);
select right("Samantha is good", 8);

-- reverse() -> returns reverse characters of  string
select reverse("Samantha");

-- Date&Time functions
select now(); -- will return current time stamp

select curdate(); -- returns current date

select curtime(); -- returns current time

select day(curdate()); -- returns current day

select month(curdate()); -- returns current month

select year(curdate()); -- returns current year

select weekday(curdate()); -- returns current week day number

select dayname(curdate()); -- returns current week day name

select date_add(curdate(), INTERVAL 90 DAY); -- returns after adding days

select datediff(curdate(),'2009-09-01'); -- difference between two dates

-- date formatting
%Y  - 2025
%y  - 25
%M  - August
%m - 08 (range: 01-12)
%b - Aug
%d - 01 (range: 01- 31)
%e - 1 (range: 1 - 31)
%H - 12 (range: 00 - 23) -> 24-hour 
%h - 12 (range: 00 - 12) -> 12-hour
%i - (range:00 - 59) 
%s - (range:00 - 59) 
%p - (range: A.M / P.M)
%W - (Monday, Tuesday...)
%a - (Mon, Tue,....)

select date_format(curdate(), '%M %d %Y'); 
-- O/P: August 21 2025

select date_format( now(), '%W %M %d %Y %h:%i %p'); 

-- stored procedures
create table if not exists kprcas.accounts(
    account_id bigint not null primary key auto_increment,
    name text not null,
    balance decimal(10, 2) not null default 1000.00,
    created_on TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP 
);
alter table kprcas.accounts auto_increment = 321456789;

INSERT INTO kprcas.accounts (name, balance) VALUES 
('Aarav Mehta', 1250.50),
('Sneha Reddy', 980.75),
('Rohan Iyer', 1500.00),
('Divya Sharma', 1100.25),
('Karthik Nair', 875.00),
('Meena Joshi', 1325.90),
('Vikram Rao', 1000.00),
('Priya Desai', 1430.60),
('Anil Kapoor', 995.00),
('Neha Verma', 1075.35);


DELIMITER //
CREATE PROCEDURE IF NOT EXISTS transfer_funds(IN sender bigint, IN reciever bigint, IN amount decimal(10, 2))
BEGIN
    DECLARE sender_balance decimal(10, 2);
    START TRANSACTION;
    select account_id, balance INTO sender_balance from kprcas.accounts WHERE account_id = sender;
    IF sender_balance IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Account doesnt exists';
    ELSEIF sender_balance < amount THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSufficient funds';
    ELSE
        UPDATE kprcas.accounts SET balance = balance - amount WHERE account_id = sender;

        UPDATE kprcas.accounts SET balance = balance + amount WHERE account_id = reciever;

        COMMIT;
    END IF;-
END //
DELIMITER;
-- 980.75 ,  1500.00
CALL kprcas.transfer_funds(321456790, 321456791, 500.00);










CREATE DATABASE lab5;

CREATE TABLE customers(
  customer_id integer,
  cust_name varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  grade integer,
  salesman_id integer
);
SELECT * FROM customers;

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3002,'Nick Rimando','New York',100,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3005,'Graham Zusi','California',200,5002);
INSERT INTO customers(customer_id, cust_name, city, salesman_id) VALUES (3001,'Brad Guzan','London',5005);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3004,'Fabian Johns','Paris',300,5006);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3007,'Brad Davis','New York',200,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3009,'Geoff Camero','Berlin',100,5003);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3008,'Julian Green','London',300,5002);

CREATE TABLE orders(
  ord_no serial PRIMARY KEY,
  purch_amt FLOAT,
  ord_date date,
  customer_id INTEGER,
  salesman_id INTEGER
);

CREATE TABLE sales(
  salesman_id integer,
  name varchar(255) not null ,
  city varchar(255) not null,
  commission float
);

SELECT Sum(purch_amt) FROM orders;

SELECT AVG (purch_amt) FROM orders;

SELECT count(*) FROM customers WHERE cust_name IS NOT NULL;

SELECT min(purch_amt) FROM orders;

SELECT * FROM customers WHERE  cust_name LIKE '%b';

SELECT * FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT * FROM customers WHERE customer_id = (SELECT customer_id FROM orders WHERE purch_amt>=10);

SELECT sum(grade) FROM customers;

SELECT * FROM customers WHERE cust_name IS NOT NULL ;

SELECT max(grade) FROM customers;
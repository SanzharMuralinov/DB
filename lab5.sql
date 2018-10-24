CREATE DATABASE  lab5;

CREATE TABLE custumers{
	custumer_id INT,
	cust_name VARCHAR(250),
	city VARCHAR(50),
	grade INT,
	salesman_id INT	
};

SELECT * FROM custumers WHERE grade >= 100;

SELECT * FROM custumers WHERE grade >= 100 and city = "New York";

SELECT * FROM custumers WHERE grade >= 100 or city = "New York";

SELECT * FROM custumers WHERE city = "Paris" or city = "Rome";

SELECT * FROM custumers WHERE cust_name LIKE 'B%';


CREATE TABLE orders{
	order_id SERIAL PRIMARY KEY,
	custumer_id INT FOREIN KEY custumers(custumer_id),
	description VARCHAR(250),
	purch_amt INT
 };

SELECT * FROM orders WHERE custumer_id = (SELECT custumer_id FROM custumers WHERE city = "New York");

SELECT * FROM customers WHERE cusomer_id=(SELECT cusomer_id FROM orders GROUP BY custumer_id HAVING count(*) > 10);

SELECT count(order_id) FROM orders;
SELECT avg(order_id) FROM orders;

SELECT cust_name FROM customers WHERE cust_name IS NOT NULL;

SELECT GREATEST(purch_amt) FROM orders;

CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id serial primary key ,
  country_name varchar(50) ,
  region_id int ,
  population int
);

INSERT INTO countries VALUES
       (default , 'Kazakhstan', 9, 100000);

INSERT INTO countries (country_id, country_name)
values (default , 'RUSSIA');

UPDATE countries SET region_id = NULL;

INSERT INTO countries
  VALUES (default, 'USA', 15, 12500000),
         (default, 'CHINA', 20, 2000000000),
         (default, 'FRANCE', 10, 210000);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'KAZAKHSTAN';

INSERT INTO countries (country_id, country_name)
  VALUES(default, default);

INSERT INTO countries VALUES(default, default, default, default);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new(
  like countries
);

INSERT INTO countries_new
SELECT * FROM countries;

UPDATE countries_new SET region_id = 1
where region_id is null;

UPDATE countries_new SET population = population + (population*0.1)
    returning country_name, population as "New Population";

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
AS cn USING countries as co
WHERE cn.country_id=co.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;
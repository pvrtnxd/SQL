-- Задание 1

CREATE DATABASE skypro;


CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'Male', 30);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Polina', 'Ignatova', 'Female', 25);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Maksim', 'Lebedev', 'Male', 23);

SELECT * FROM employee;

UPDATE employee
SET first_name = 'Oleg',
    last_name  = 'Gazmanov',
    gender     = 'Male',
    age        = '18'
WHERE last_name = 'Lebedev';

SELECT *
FROM employee;

DELETE
FROM employee
WHERE last_name = 'Ivanov';

SELECT *
FROM employee;

-- Задание 2

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ahmed', 'Ozrokov', 'Male', 32);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Anna', 'Saakyan', 'Female', 22);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Elizaveta', 'Perova', 'Female', 26);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Sergey', 'Semenov', 'Male', 47);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Tatyana', 'Sharipkova', 'Female', 46);

SELECT first_name AS Имя, last_name  AS Фамилия
FROM employee;

SELECT * FROM employee
WHERE age < 30 OR age > 50;

SELECT * FROM employee
WHERE age BETWEEN 30 AND 50;

SELECT * FROM employee
ORDER BY last_name DESC;

SELECT * FROM employee
WHERE LENGTH(first_name) > 4;

UPDATE employee
SET first_name = 'Tatyana'
WHERE last_name = 'Semenov';
UPDATE employee
SET first_name = 'Ivan'
WHERE last_name = 'Ozrokov';

SELECT first_name AS Имя, SUM(age) AS 'Суммарный возраст'
FROM employee GROUP BY first_name;

SELECT first_name AS Имя, MIN(age) AS 'Мин. возраст'
FROM employee GROUP BY first_name;

SELECT first_name AS Имя, MAX(age) AS max_age
FROM employee GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY max_age;

-- Задание 3

CREATE TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee
    ADD COLUMN city_id BIGINT REFERENCES city (city_id);

INSERT INTO CITY (city_name)
VALUES ('Saint Petersburg'),
       ('Kaliningrad'),
       ('Moscow'),
       ('Svetlogorsk'),
       ('Zelenograd')

UPDATE employee
SET city_id = 1
WHERE last_name = 'Ignatova';

UPDATE employee
SET city_id = 2
WHERE last_name = 'Ozrokov';

UPDATE employee
SET city_id = 3
WHERE last_name = 'Lebedev';

UPDATE employee
SET city_id=4
WHERE last_name = 'Sharipkova';

SELECT e.first_name, e.last_name, c.city_name
FROM employee e
INNER JOIN city c ON e.city_id = c.city_id;

SELECT e.first_name, e.last_name, c.city_name
FROM employee e
CROSS JOIN city c;

SELECT e.first_name, e.last_name, c.city_name
FROM employee e
LEFT JOIN city c ON e.city_id = c.city_id;

SELECT e.first_name, e.last_name, c.city_name
FROM employee e
FULL JOIN city c ON e.city_id = c.city_id;



